defmodule GarstApp.Repo.Migrations.CreateURLDirection do
  use Ecto.Migration

  def change do
    create table(:url_directions) do
      add :path, :string
      add :token, :string
      add :active, :boolean, default: true, null: false

      timestamps()
    end

    index :url_directions, [ :path ], where: "active = TRUE"
  end
end
