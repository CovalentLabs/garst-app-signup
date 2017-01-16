defmodule GarstApp.URLDirectionController do
  use GarstApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def direct(conn, %{ "route" => route, "version" => version, "secret" => secret}) do
    render conn, "direct.html", route: route, version: version, secret: secret
  end

  def direct(conn, params) do
    catch_all(conn, params)
  end

  def catch_all(conn, _params) do
    render conn, "catch_all.html"
  end
end