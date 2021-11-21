defmodule Rockelivery.Users.Delete do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.buil_id_format_error()}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.buil_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end
end
