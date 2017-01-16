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
  end

  # All redirections
  scope "/go", GarstApp do
    pipe_through :browser # Use the default browser stack

    get "/", URLDirectionController, :index
    get "/:version/:route", URLDirectionController, :direct
    get "/*path", URLDirectionController, :catch_all
  end

  # Service hooks, such as Twilio SMS
  scope "/hook", GarstApp do
    pipe_through :api


  end
end
