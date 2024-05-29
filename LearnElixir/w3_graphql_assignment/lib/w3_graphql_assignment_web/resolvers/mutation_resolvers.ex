defmodule W3GraphqlAssignmentWeb.Resolvers.MutationResolvers do
@moduledoc """
Root of Absinthe Resolvers for Mutations
"""
  alias W3GraphqlAssignmentWeb.Resolvers.UserResolvers


  # Resolver - updateUser Mutation
  def update_user(%{id: id} = params, _) do
    user = UserResolvers.get_user_by_id(%{id: id}, params) |> elem(1)
    updated_params = Map.delete(params, :id)
    {:ok, Map.merge(user, updated_params)}
  end

  # Resolver - createUser Mutation
  # TODO - Complete this functionality
  def create_user(args, _) do

  end
end
