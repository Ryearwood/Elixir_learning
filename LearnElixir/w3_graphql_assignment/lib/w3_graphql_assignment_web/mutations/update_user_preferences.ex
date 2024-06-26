defmodule W3GraphqlAssignmentWeb.Mutations.UpdateUserPreferences do
  @moduledoc """
  Root for Absinthe-GraphQL updateUserPreferences Mutation
  """
  use Absinthe.Schema.Notation
  alias W3GraphqlAssignmentWeb.Resolvers.MutationResolvers

  object :update_user_preferences do
    @desc "Updates User Preferences field"
    field :update_user_preferences, :preferences do
      arg :user_id, non_null(:id)
      arg :likes_emails, :boolean
      arg :likes_phone_calls, :boolean
      arg :likes_faxes, :boolean
      resolve &MutationResolvers.update_user_preferences/2
    end
  end
end
