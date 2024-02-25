defmodule ScriptScape.Repo do
  use Ecto.Repo,
    otp_app: :script_scape,
    adapter: Ecto.Adapters.Postgres
end
