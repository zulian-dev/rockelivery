defmodule Rockelivery.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params ~w[ age addres cep cpf email password name]a
  # %{age: 18, addres: "Rua x", cep: "12345678", cpf: "12345678909", email: "email@email.com", password_hash: "abc123", name: "Cliente Usuario"}  |> Rockelivery.User.changeset()

  schema "users" do
    field :age, :integer
    field :addres, :string
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password_hash, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:cpf])
    |> unique_constraint([:email])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> change(Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changest), do: changest
end