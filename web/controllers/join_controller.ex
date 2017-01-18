defmodule GarstApp.JoinController do
  use GarstApp.Web, :controller

  alias GarstApp.Account

  def new(conn, _params) do
    changeset = Account.changeset(%Account{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{ "account" => acct_params }) do
    IO.inspect acct_params
    changeset = Account.changeset(%Account{ password_hash: "undefined", mystery_name: "New User" }, acct_params)


    # send_resp(conn, 200, "We have received your application! Please accept the invitation in your email, and accept the invitation sent to your phone!")

    case Repo.insert(changeset) do
      {:ok, account} ->

        conn
        # |> Rumbl.Auth.login(account)
        |> put_flash(:info, "#{account.nickname}, we have received your application! Please accept the invitation in your email (#{account.email}), and accept the invitation sent to your phone (#{account.phone})!")
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        IO.inspect changeset
        render conn, "new.html", changeset: changeset
    end
  end
end
