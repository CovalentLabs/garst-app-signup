defmodule GarstApp.Repo.Migrations.AccountAddEmailDomain do
  use Ecto.Migration

  def change do
    alter table(:accounts) do
      add :email_domain, :string
    end
  end
end
