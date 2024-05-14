defmodule W3GraphqlAssignmentWeb.Schema do
  @moduledoc """
  The Root of the Absinthe Schema Definitions
  """
  use Absinthe.Schema

  import_types W3GraphqlAssignmentWeb.Types.UserTypes
  import_types W3GraphqlAssignmentWeb.Queries.UserQuery
  import_types W3GraphqlAssignmentWeb.Mutations.UserMutations

  query do
    import_fields :user_queries
    import_fields :users_queries
  end

  mutation do
    import_fields :user_mutations
  end
end
