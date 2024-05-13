defmodule W3GraphqlAssignmentWeb.Schema do
  @moduledoc """
  The Root of the Absinthe Schema Definitions
  """
  use Absinthe.Schema

  import_types W3GraphqlAssignmentWeb.Types.Users
  import_types W3GraphqlAssignmentWeb.Queries.User

  query do
    import_fields :user_queries
    import_fields :users_queries
  end
end
