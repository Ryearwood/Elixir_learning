defmodule GraphqlServerWeb.Schema do
  use Absinthe.Schema

  import_types(GraphqlServerWeb.Types.Shop)

  import_types(GraphqlServerWeb.Schema.Queries.Shop)

  query do
    import_fields(:shop_queries)
  end
end
