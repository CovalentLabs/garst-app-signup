defmodule GarstAppSignup.PageController do
  use GarstAppSignup.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
