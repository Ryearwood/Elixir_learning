defmodule W3GraphqlAssignmentWeb.Queries.UserQuery do
  @moduledoc """
  The Root for Absinthe-GraphQL User Queries
  """
  use Absinthe.Schema.Notation

  alias W3GraphqlAssignmentWeb.Resolvers.UserResolvers

  object :user_queries do
    @desc "Get a User Profile by ID"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &UserResolvers.get_user_by_id/2
    end
  end

  object :users_queries do
    @desc "Get a List of Users based on their Communication Preferences"
    field :users, list_of(:user) do
      arg :likes_emails, :boolean
      arg :likes_phone_calls, :boolean
      arg :likes_faxes, :boolean
      resolve &UserResolvers.get_user_list_by_preferences/2
    end
  end
end
