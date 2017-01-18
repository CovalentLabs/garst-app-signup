defmodule GarstApp.AccountTest do
  use GarstApp.ModelCase

  alias GarstApp.Account

  @valid_attrs %{
      nickname: "some nickname", mystery_name: "some mystery name",
      email: "hehey@live.missouristate.edu", phone: "+18167899898",
      password_hash: "hashashashashashashashashashash",
      verified_phone: true, verified_email: true }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Account.changeset(%Account{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Account.changeset(%Account{}, @invalid_attrs)
    refute changeset.valid?
  end
end
