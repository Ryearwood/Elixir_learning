defmodule PlugServer.PlugLog do
  @behaviour Plug

  require Logger

  @impl Plug
  def init(opts), do: opts

  @impl Plug
  def call(conn, _opts) do
    url = Plug.Conn.request_url(conn)
    Logger.info("A url was hit #{url}")
    conn

  end
end
