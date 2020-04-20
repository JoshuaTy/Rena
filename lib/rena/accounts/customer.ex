defmodule Rena.Accounts.Customer do
  @moduledoc """
  Customer has has_penalty and user_id foreign key, extends user
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "customers" do
    field :has_penalty, :boolean, default: false

    belongs_to :user, Rena.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:has_penalty])
    |> validate_required([:has_penalty])
  end
end
