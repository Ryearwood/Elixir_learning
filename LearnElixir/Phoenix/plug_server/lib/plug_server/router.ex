defmodule PlugServer.Router do
  use Plug.Router

  plug :match
  plug PlugServer.PlugResponse, key: "test-key"
  plug :dispatch

  get "/", do: send_resp(conn, 200, "Hello World!")
  get "/a-new-route", do: send_resp(conn, 200, "New Route Found")
  match _, do: send_resp(conn, 404, "Not Found")
end
