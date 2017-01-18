defmodule GarstApp.VerifyCallbackTest do
  use GarstApp.ModelCase

  alias GarstApp.VerifyCallback

  @valid_attrs %{token: "some content", type: "some content", value: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = VerifyCallback.changeset(%VerifyCallback{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = VerifyCallback.changeset(%VerifyCallback{}, @invalid_attrs)
    refute changeset.valid?
  end
end
