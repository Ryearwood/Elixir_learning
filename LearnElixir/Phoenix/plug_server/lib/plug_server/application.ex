defmodule PlugServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: PlugServer.Router, options: [port: 4000]}
    ]

    Logger.info("Running Servers...")
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlugServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
