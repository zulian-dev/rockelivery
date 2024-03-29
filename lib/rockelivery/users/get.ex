defmodule Rockelivery.Users.Get do
  alias Rockelivery.{Error, Repo, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.buil_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
