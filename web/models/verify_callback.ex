defmodule GarstApp.VerifyCallback do
  use GarstApp.Web, :model

  schema "verify_callbacks" do
    field :token, :string
    field :type, :string
    field :value, :string
    belongs_to :account, GarstApp.Account

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:token, :type, :value])
    |> validate_required([:token, :type, :value])
    |> unique_constraint(:token)
  end
end
