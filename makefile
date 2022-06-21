SHELL := /bin/bash

server:
	mix phx.server

server-env:
	source .env
	mix phx.server

db:
	docker-compose up -d

deploy:
	git push heroku main
	heroku run "POOL_SIZE=2 mix ecto.migrate"

local-deploy:
	export SECRET_KEY_BASE=$(mix phx.gen.secret)
	export DATABASE_URL=ecto://postgres:postgres@localhost/hausey_dev
	mix deps.get --only prod
	MIX_ENV=prod mix compile
	npm run deploy --prefix ./assets
	mix phx.digest
	PORT=4001 MIX_ENV=prod mix phx.server

start:
	docker-compose up -d
	mix phx.server

doc:
	pandoc -o Projeto.docx projeto.md

install: 
	mix deps.get
	mix ecto.setup
	npm i --prefix ./assets

reset-heroku-db:
	heroku pg:reset  --app APP????
	heroku run "POOL_SIZE=2 mix ecto.migrate"  --app APP????
	heroku run "POOL_SIZE=2 mix run priv/repo/seeds.exs" --app APP????

reset-node:
	echo "reset node"
	rm -rf ./assets/node_modules
	rm -f ../assets/package-lock.json
	rm -rf ./priv/static/
	npm i --prefix ./assets

makefile-update:
	curl https://gist.githubusercontent.com/zulian-dev/b565e867c2c6d2b4c00ce9a7c05c223b/ > ./makefile