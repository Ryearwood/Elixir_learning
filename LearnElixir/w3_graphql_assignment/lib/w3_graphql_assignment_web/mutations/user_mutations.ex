defmodule W3GraphqlAssignmentWeb.Mutations.UserMutations do
  @moduledoc """
  Root for Absinthe-GraphQL User Mutations
  """
  use Absinthe.Schema.Notation
  alias W3GraphqlAssignmentWeb.Resolvers.MutationResolvers

  # TODO Figure out creation mutation input types
  # object :user_mutations do
  #   field :createUser, :user do
  #     arg :id, non_null(:id)
  #     arg :name, :string
  #     arg :email, :string
  #     arg :preferences, :preferences
  #     resolve &UserResolvers.update/2
  #   end
  # end

  object :user_mutations do
    field :update_user, :user do
      arg :id, non_null(:id)
      arg :name, :string
      arg :email, :string
      resolve &MutationResolvers.update/2
    end
  end

end
