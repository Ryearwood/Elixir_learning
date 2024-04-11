defmodule RestServerApiWeb.Router do
  use RestServerApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", RestServerApiWeb do
    pipe_through(:api)
  end
end
