# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :garst_app,
  ecto_repos: [GarstApp.Repo]

# Configures the endpoint
config :garst_app, GarstApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FtATMAMrl5/4T99D4Yz1FkCW0eyF7SXNuXYYBwMwTip7mNjGg1ozdjlVSxyLjclV",
  render_errors: [view: GarstApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GarstApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Twilio Test Messaging Setup
config :ex_twilio, account_sid: System.get_env("GA_TWILIO_ACCOUNT_SID")
config :ex_twilio, auth_token:  System.get_env("GA_TWILIO_AUTH_TOKEN")
config :ex_twilio, send_number:  System.get_env("GA_TWILIO_SEND_NUMBER")
config :ex_twilio, basic_auth:  System.get_env("GA_TWILIO_HTTP_BASIC_AUTH")

# SMTP Emailing Setup
config :garst_app, GarstApp.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: System.get_env("GA_SMTP_SERVER_NAME"),
  port: 465,
  username: System.get_env("GA_SMTP_USERNAME"),
  password: System.get_env("GA_SMTP_PASSWORD"),
  tls: :if_available, # can be `:always` or `:never`
  ssl: true, # can be `true`
  retries: 1
  # adapter: Bamboo.PostmarkAdapter,
  # api_key: System.get_env("GA_PM_API_KEY")
  # adapter: Bamboo.MailgunAdapter,
  # domain: System.get_env("GA_MG_DOMAIN")
