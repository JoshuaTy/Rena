defmodule Rena.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nickname, :string
      add :phone_number, :integer

      timestamps()
    end
    
    create unique_index(:users, [:phone_number])
  end
end
