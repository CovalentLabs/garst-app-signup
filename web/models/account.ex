defmodule GarstApp.Account do
  use GarstApp.Web, :model

  schema "accounts" do
    field :nickname, :string
    field :mystery_name, :string
    field :password_hash, :string
    field :email, :string
    field :email_domain, :string, default: "live.missouristate.edu"
    field :verified_email, :boolean, default: false
    field :phone, :string
    field :verified_phone, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nickname, :mystery_name, :password_hash, :verified_phone, :verified_email, :email, :phone])
    |> validate_format(:email, ~r/^\s*[\w]+\s*$/)
    |> validate_format(:email_domain, ~r/^live.missouristate.edu$/i)
    |> validate_format(:phone, ~r/^\D*1?(\D*\d\D*){10}$/)
    |> normallize_phone()
    |> validate_required([:nickname, :mystery_name, :verified_phone, :verified_email, :email, :phone])
  end

  defp normallize_phone(struct) do
    struct
    |> update_change(:phone, fn phone -> 
        phone = Regex.replace ~r/\D/, phone, ""
        Regex.replace ~r/^1?/, phone, "+1"
      end)
  end
end
