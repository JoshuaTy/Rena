defmodule Rena.Accounts.User do
  @moduledoc """
  User has nickname and phone number fields
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :nickname, :string
    field :phone_number, :integer

    has_one :customer, Rena.Accounts.Customer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nickname, :phone_number])
    |> validate_required([:nickname, :phone_number])
    |> unique_constraint(:phone_number)
  end
end
