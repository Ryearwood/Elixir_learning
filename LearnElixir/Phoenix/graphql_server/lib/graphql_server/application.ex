defmodule GraphqlServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GraphqlServerWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:graphql_server, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GraphqlServer.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: GraphqlServer.Finch},
      # Start a worker by calling: GraphqlServer.Worker.start_link(arg)
      # {GraphqlServer.Worker, arg},
      # Start to serve requests, typically the last entry
      GraphqlServerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GraphqlServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GraphqlServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
