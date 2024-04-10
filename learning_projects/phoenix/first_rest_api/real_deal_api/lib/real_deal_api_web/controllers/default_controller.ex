defmodule RealDealApiWeb.DefaultController do
  use RealDealApiWeb, :controller

  def index(conn, _params) do
    text(conn, "The Real Deal API is live - #{Mix.env()}")
  end
end
