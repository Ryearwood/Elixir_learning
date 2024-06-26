defmodule RestServerApiWeb.Router do
  use RestServerApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", RestServerApiWeb do
    pipe_through(:api)

    resources("/users", UserController)
  end
end
