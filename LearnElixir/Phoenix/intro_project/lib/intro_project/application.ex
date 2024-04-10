defmodule IntroProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      IntroProjectWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:intro_project, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: IntroProject.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: IntroProject.Finch},
      # Start a worker by calling: IntroProject.Worker.start_link(arg)
      # {IntroProject.Worker, arg},
      # Start to serve requests, typically the last entry
      IntroProjectWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IntroProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IntroProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
