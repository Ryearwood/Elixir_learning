defmodule RestServerApiWeb.UserController do
  use RestServerApiWeb, :controller

  def index(conn, params) do
    send_resp(conn, 200, Jason.encode!(params))
  end

  def show(conn, %{"id" => id}) do
    send_resp(conn, 200, "Show #{id}")
  end

  def update(conn, %{"id" => id}) do
    send_resp(conn, 200, "Update #{id}")
  end

  def create(conn, %{"name" => name}) do
    send_resp(conn, 200, "Create #{name}")
  end

  def delete(conn, %{"id" => id}) do
    send_resp(conn, 200, "Delete #{id}")
  end
end
