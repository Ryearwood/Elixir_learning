defmodule W3GraphqlAssignmentWeb.Mutations.UpdateUserPreferences do
@moduledoc """
Root for Absinthe-GraphQL Update User Preferences Mutations
"""
use Absinthe.Schema.Notation
alias W3GraphqlAssignmentWeb.Resolvers.MutationResolvers

  object :update_user_preferences do
    @desc "Updates User Preferences field"
    field :update_user_preferences, :user do
      arg :id, non_null(:id)
      arg :likes_emails, :boolean
      arg :likes_phone_calls, :boolean
      arg :likes_faxes, :boolean
      resolve &MutationResolvers.update_user_preferences/2
    end
  end
end
