defmodule GarstApp.URLDirection do
  use GarstApp.Web, :model

  schema "url_directions" do
    field :path, :string
    field :token, :string
    field :active, :boolean, default: true

    field :version, :string, virtual: true
    field :calls, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:path, :token, :active])
    |> validate_required([:path, :token, :active])
  end
end
