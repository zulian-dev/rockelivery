defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create

  describe "call/1" do
    test "when all params are valid, return an user" do
      params = build(:user_params)
      response = Create.call(params)
      assert {:ok, %User{name: "Zulian"}} = response
    end

    test "when there are invalid params return an error" do
      params = build(:user_params, password: 123, age: 15)
      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["is invalid"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
