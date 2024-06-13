defmodule W3GraphqlAssignmentWeb.Router do
  use W3GraphqlAssignmentWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    forward "/graphql", Absinthe.Plug, schema: W3GraphqlAssignmentWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: W3GraphqlAssignmentWeb.Schema,
      socket: W3GraphqlAssignmentWeb.Channels.UserSocket,
      socket_url: "ws://localhost:4000/api/graphiql",
      interface: :playground
  end
end
