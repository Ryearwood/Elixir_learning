defmodule GraphqlServerWeb.Resolver.Shop do
  alias GraphqlServerWeb.Shop

  def all(params, _), do: Shop.all(params)

  def find(%{id: id}, _) do
    id = String.to_integer(id)

    Shop.find(%{id: id})
  end
end
