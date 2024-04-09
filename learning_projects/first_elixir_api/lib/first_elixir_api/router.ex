defmodule FirstElixirApi.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/", do: send_resp(conn, 200, "OK")

  get "/aliens_name", do: send_resp(conn, 200, "Jabba the Hutt")

  match _, do: send_resp(conn, 404, "Not Found")
end
