defmodule Rockelivery.Repo.Migrations.CreateItemCategory do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE item_category AS ENUM ('food', 'drink', 'desert')"
    down_query = "DROP TYPE item_category"

    execute(up_query, down_query)
  end
end
