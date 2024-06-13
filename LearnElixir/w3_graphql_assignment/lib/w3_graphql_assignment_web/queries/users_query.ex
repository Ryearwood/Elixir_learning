defmodule W3GraphqlAssignmentWeb.Queries.UsersQuery do
  @moduledoc """
  The Root for Absinthe-GraphQL Users Queries
  """
  use Absinthe.Schema.Notation

  alias W3GraphqlAssignmentWeb.Resolvers.UserResolvers

  object :users_query do
    @desc "Get a List of Users based on their Communication Preferences"
    field :users, list_of(:user) do
      arg :likes_emails, :boolean
      arg :likes_phone_calls, :boolean
      arg :likes_faxes, :boolean
      resolve &UserResolvers.get_user_list_by_preferences/2
    end
  end
end
