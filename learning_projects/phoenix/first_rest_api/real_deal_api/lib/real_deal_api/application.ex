defmodule RealDealApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RealDealApiWeb.Telemetry,
      RealDealApi.Repo,
      {DNSCluster, query: Application.get_env(:real_deal_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RealDealApi.PubSub},
      # Start a worker by calling: RealDealApi.Worker.start_link(arg)
      # {RealDealApi.Worker, arg},
      # Start to serve requests, typically the last entry
      RealDealApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RealDealApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RealDealApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
