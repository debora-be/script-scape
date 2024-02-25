defmodule ScriptScape.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ScriptScapeWeb.Telemetry,
      ScriptScape.Repo,
      {DNSCluster, query: Application.get_env(:script_scape, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ScriptScape.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ScriptScape.Finch},
      # Start a worker by calling: ScriptScape.Worker.start_link(arg)
      # {ScriptScape.Worker, arg},
      # Start to serve requests, typically the last entry
      ScriptScapeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ScriptScape.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ScriptScapeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
