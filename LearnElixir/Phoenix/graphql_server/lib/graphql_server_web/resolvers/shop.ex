defmodule GraphqlServerWeb.Resolvers.Shop do
  alias GraphqlServerWeb.Shop

  def all(params, _), do: Shop.all(params)

  def find(%{id: id}, _) do
    id = String.to_integer(id)

    Shop.find(%{id: id})
  end

  def update(%{id: id} = params, _) do
    id = String.to_integer(id)
    Shop.update(id, Map.delete(params, :id))
  end
end
