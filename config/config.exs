# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :script_scape,
  ecto_repos: [ScriptScape.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :script_scape, ScriptScapeWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: ScriptScapeWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ScriptScape.PubSub,
  live_view: [signing_salt: "9CwIuhpY"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :script_scape, ScriptScape.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :script_scape, :http,
  pexels_api: "https://api.pexels.com",
  pexels_api_key: "9RZNDlWe3lIpKj1ilHPoQVbrR4C0aPwuNEELpgb7AYHBBQXfHpQVRO1O",
  techy_api: "https://techy-api.vercel.app"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
