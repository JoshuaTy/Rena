# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rena,
  ecto_repos: [Rena.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :rena, RenaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0OI+xkwSTcCHfp0mReOjlpNHClNYHUOTTfAnaFJfoK4aGp5JFZLr6/gutEhUlDeU",
  render_errors: [view: RenaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Rena.PubSub,
  live_view: [signing_salt: "k3hwAlEw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configuring secret_key to integrate Guardian
config :rena, Rena.Accounts.Guardian,
  issuer: "rena",
  secret_key: System.get_env("SECRET_KEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
