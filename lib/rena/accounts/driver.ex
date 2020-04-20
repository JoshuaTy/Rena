defmodule Rena.Accounts.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "drivers" do
    field :is_available, :boolean, default: false
    field :wallet_balance, :integer
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:wallet_balance, :is_available])
    |> validate_required([:wallet_balance, :is_available])
  end
end
