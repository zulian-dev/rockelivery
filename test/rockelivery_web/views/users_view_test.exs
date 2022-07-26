defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created!",
      user: %Rockelivery.User{
        address: "rua das bananeiras 15",
        age: 27,
        cep: "12345678",
        cpf: "12345678909",
        email: "teste@email.com",
        id: "2d679e8e-8d97-438e-9bcd-e61e7344c557",
        inserted_at: nil,
        name: "Zulian",
        password: "1234567890",
        password_hash: nil,
        updated_at: nil
      }
    }

    assert expected_response == response
  end
end
