defmodule GarstApp.Repo.Migrations.CreateVerifyCallback do
  use Ecto.Migration

  def change do
    create table(:verify_callbacks) do
      add :token, :string
      add :type, :string
      add :value, :string
      add :account_id, references(:accounts, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:verify_callbacks, [:token])
    create index(:verify_callbacks, [:account_id])

  end
end
