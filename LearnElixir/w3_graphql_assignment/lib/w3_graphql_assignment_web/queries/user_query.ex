defmodule W3GraphqlAssignmentWeb.Queries.UserQuery do
  @moduledoc """
  The Root for Absinthe-GraphQL User Queries
  """
  use Absinthe.Schema.Notation

  alias W3GraphqlAssignmentWeb.Resolvers.UserResolvers

  object :user_query do
    @desc "Get a User Profile by ID"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &UserResolvers.get_user_by_id/2
    end
  end
end
