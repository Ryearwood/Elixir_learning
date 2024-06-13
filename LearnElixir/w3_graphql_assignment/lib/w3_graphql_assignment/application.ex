defmodule W3GraphqlAssignment.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      W3GraphqlAssignmentWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:w3_graphql_assignment, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: W3GraphqlAssignment.PubSub},
      # Start a worker by calling: W3GraphqlAssignment.Worker.start_link(arg)
      # {W3GraphqlAssignment.Worker, arg},
      # Start to serve requests, typically the last entry
      W3GraphqlAssignmentWeb.Endpoint,
      {Absinthe.Subscription, W3GraphqlAssignmentWeb.Endpoint}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: W3GraphqlAssignment.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    W3GraphqlAssignmentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
