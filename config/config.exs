# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :garst_app_signup,
  ecto_repos: [GarstAppSignup.Repo]

# Configures the endpoint
config :garst_app_signup, GarstAppSignup.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FtATMAMrl5/4T99D4Yz1FkCW0eyF7SXNuXYYBwMwTip7mNjGg1ozdjlVSxyLjclV",
  render_errors: [view: GarstAppSignup.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GarstAppSignup.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Twilio Test Messaging Setup
config :ex_twilio, account_sid: System.get_env("TWILIO_ACCOUNT_SID")
config :ex_twilio, auth_token:  System.get_env("TWILIO_AUTH_TOKEN")

# SMTP Emailing Setup
config :garst_app_signup, GarstAppSignup.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: System.get_env("GA_SMTP_DOMAIN"),
  port: 465,
  username: System.get_env("GA_SMTP_USERNAME"),
  password: System.get_env("GA_SMTP_PASSWORD"),
  tls: :never, # can be `:always` or `:never`
  ssl: true, # can be `true`
  retries: 1
