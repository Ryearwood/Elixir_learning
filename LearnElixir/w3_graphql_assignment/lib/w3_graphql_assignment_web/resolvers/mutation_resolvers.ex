defmodule W3GraphqlAssignmentWeb.Resolvers.MutationResolvers do
@moduledoc """
Root of Absinthe Resolvers for Mutations
"""
  alias W3GraphqlAssignmentWeb.Resolvers.UserResolvers

  # Resolver - updateUser Mutation
  def update_user(%{id: id} = params, _) do
    UserResolvers.update_user_params(params, id)
  end

  # Use this to evaluate if createUser mutation is updating the Users List correctly

  # def create_user(args, _) do
  #   UserResolvers.create_new_user(args)
  # end

  # Resolver - createUser Mutation
  def create_user(args, _) do
    case UserResolvers.create_new_user(args) do
     {:error, details} -> {:error, details}
     {:ok, _} -> {:ok, args}
   end
  end

  # Resolver - updateUserPreferences
  def update_user_preferences(%{id: id} = params, _) do
    UserResolvers.update_user_preferences(params, id)
  end
end
