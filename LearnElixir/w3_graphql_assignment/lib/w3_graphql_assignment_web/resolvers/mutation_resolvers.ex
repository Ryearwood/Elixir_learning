defmodule W3GraphqlAssignmentWeb.Resolvers.MutationResolvers do
@moduledoc """
Root of Absinthe Resolvers for Mutations
"""
alias W3GraphqlAssignmentWeb.Resolvers.UserResolvers

# Helper Function for update function
def update_user_params(id, params) do
  with {:ok, user} <- UserResolvers.get_user_by_id(%{id: id}, params) do
    {:ok, Map.merge(user, params)}
  end
end

# Resolver - updateUser Mutation
def update(%{id: id} = params, _) do
  update_user_params(id, Map.delete(params, :id))
end

end
