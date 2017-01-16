defmodule GarstApp.Router do
  use GarstApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GarstApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/go", URLDirectionController, :index
    get "/go/:route/:token", URLDirectionController, :direct
  end

  # Other scopes may use custom stacks.
  # scope "/api", GarstApp do
  #   pipe_through :api
  # end
end
