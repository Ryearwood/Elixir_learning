defmodule FirstApiTest.RouterTest do
  use ExUnit.Case, async: true

  use Plug.Test

  @opts FirstElixirApi.Router.init([])

  test "return ok" do
    build_conn = conn(:get, "/")
    conn = FirstElixirApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  test "return aliens name" do
    build_conn = conn(:get, "/aliens_name")
    conn = FirstElixirApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Jabba the Hutt"
  end

end
