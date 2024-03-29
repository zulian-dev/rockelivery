defmodule Rockelivery.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def buid(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_user_not_found_error, do: buid(:not_found, "User not found")
  def build_id_format_error, do: buid(:bad_request, "invalid id format")
end
