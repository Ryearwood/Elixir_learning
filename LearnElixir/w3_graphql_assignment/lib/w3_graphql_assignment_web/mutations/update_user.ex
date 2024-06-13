defmodule W3GraphqlAssignmentWeb.Mutations.UpdateUser do
  @moduledoc """
  Root for Absinthe-GraphQL updateUser Mutation
  """
  use Absinthe.Schema.Notation
  alias W3GraphqlAssignmentWeb.Resolvers.MutationResolvers

  object :update_user do
    @desc "Updates a User Profile with new information"
    field :update_user, :user do
      arg :id, non_null(:id)
      arg :name, :string
      arg :email, :string
      resolve &MutationResolvers.update_user/2
    end
  end
end
