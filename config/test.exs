import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :script_scape, ScriptScape.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "script_scape_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :script_scape, ScriptScapeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "nZ3/lSWR2Yd/985s+1onvzlzhhV0P6P1uo4qLF7lzmuky+3kVGcAk1h7QG2xwx/A",
  server: false

# In test we don't send emails.
config :script_scape, ScriptScape.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
