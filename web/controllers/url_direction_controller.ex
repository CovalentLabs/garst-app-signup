defmodule GarstApp.URLDirectionController do
  use GarstApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def direct(conn, params = %{ "version" => version, "route" => route }) do
    go(conn, version, route, params)
  end

  def direct(conn, params) do
    catch_all(conn, params)
  end

  alias GarstApp.Repo
  alias GarstApp.Account
  alias GarstApp.VerifyCallback
  import Ecto.Query, only: [ from: 2 ]

  def go(conn, "1", "verify", %{ "secret" => token }) do
    query = from v in VerifyCallback,
      where: (v.token == ^token),
      order_by: [ desc: v.inserted_at ],
      preload: [ :account ],
      limit: 1
    
    case Repo.one query do
      %{ account: acct, type: "email" } ->
        acct_update = Ecto.Changeset.change acct, %{ verified_email: true }
        acct = Repo.update!(acct_update, [])

        phone_verification_query = from v in GarstApp.VerifyCallback, where: v.account_id == ^acct.id and v.type == "phone"
        case Repo.all phone_verification_query do
          [] -> IO.puts "Send a new Text Message"
          _ -> IO.puts "Text Message already sent"
        end

        render conn, "verified.html", title: "Verified Email", account: acct

      %{ account: acct, type: "phone" } ->
        acct_update = Ecto.Changeset.change acct, %{ verified_phone: true }
        acct = Repo.update!(acct_update, [])

        render conn, "verified.html", title: "Verified Phone", account: acct

      _ ->

        render conn, "direct_error.html", message: "Lost verification", description: "We could not find a verification matching the key in the url."


    end
  end

  def go(conn, _v, _r, params) do
    catch_all(conn, params)
  end

  def catch_all(conn, _params) do
    render conn, "catch_all.html"
  end
end