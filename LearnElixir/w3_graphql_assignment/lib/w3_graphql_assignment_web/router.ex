defmodule W3GraphqlAssignmentWeb.Router do
  use W3GraphqlAssignmentWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", W3GraphqlAssignmentWeb do
    pipe_through :api
  end
end
