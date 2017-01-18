defmodule GarstApp.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :mystery_name, :string
      add :password_hash, :string
      add :verified, :boolean, default: false, null: false
      add :email, :string
      add :phone, :string

      timestamps()
    end

  end
end
