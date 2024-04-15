defmodule GraphqlServerWeb.Schema.Queries.Shop do
  use Absinthe.Schema.Notation

  alias GraphqlServerWeb.Resolver

  object :shop_queries do
    field :shop, :shop do
      arg(:id, non_null(:id))

      resolve(&Resolver.Shop.find/2)
    end

    field :shops, list_of(:shop) do
      arg(:category, :shop_category)

      resolve(&Resolver.Shop.all/2)
    end
  end
end
