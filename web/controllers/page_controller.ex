defmodule GarstApp.PageController do
  use GarstApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
