defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 27,
      address: "rua das bananeiras 15",
      cep: "12345678",
      cpf: "12345678909",
      email: "teste@email.com",
      password: "1234567890",
      name: "Zulian"
    }
  end

  def user_params_str_factory do
    %{
      "age" => 27,
      "address" => "rua das bananeiras 15",
      "cep" => "12345678",
      "cpf" => "12345678909",
      "email" => "teste@email.com",
      "password" => "1234567890",
      "name" => "Zulian"
    }
  end

  def user_factory do
    %User{
      id: "2d679e8e-8d97-438e-9bcd-e61e7344c557",
      age: 27,
      address: "rua das bananeiras 15",
      cep: "12345678",
      cpf: "12345678909",
      email: "teste@email.com",
      password: "1234567890",
      name: "Zulian"
    }
  end
end
