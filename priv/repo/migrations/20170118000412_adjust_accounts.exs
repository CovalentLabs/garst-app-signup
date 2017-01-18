defmodule GarstApp.Repo.Migrations.AdjustAccounts do
  use Ecto.Migration

  def change do

    alter table(:accounts) do
      add :find_by_phone, :boolean, default: true, null: false
      add :find_by_email, :boolean, default: true, null: false
      add :verified_email, :boolean, default: false, null: false
    end

    rename table(:accounts), :name, to: :nickname
    rename table(:accounts), :verified, to: :verified_phone
  end
end
