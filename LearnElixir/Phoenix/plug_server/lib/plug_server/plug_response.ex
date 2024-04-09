defmodule PlugServer.PlugResponse do
  @behaviour Plug

  @impl Plug
  def init(opts), do: opts[:key]

  @impl Plug
  def call(conn, key) do
    Plug.Conn.register_before_send(conn, fn callback_conn ->
      callback_conn
      |> Plug.Conn.put_resp_content_type("application/json")
      |> Map.update!(:resp_body, &("{\"#{key}\": \"#{&1}\"}"))
    end)
  end
end
