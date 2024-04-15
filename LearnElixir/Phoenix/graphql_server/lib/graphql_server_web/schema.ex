defmodule GraphqlServerWeb.Schema do
  use Absinthe.Schema

  @desc "A category for a shop"
  enum :shop_category do
    value(:HARDWARE)
    value(:CLOTHING)
  end

  @desc "A Store that has a category"
  object :shop do
    field(:id, :id)
    field(:name, :string)
    field(:category, :shop_category)
  end

  @shops [
    %{
      id: 1,
      name: "Clothing Shop",
      category: :CLOTHING
    },
    %{
      id: 2,
      name: "Custom Clothing Shop",
      category: :CLOTHING
    },
    %{
      id: 3,
      name: "Hardware Shop",
      category: :HARDWARE
    },
    %{
      id: 4,
      name: "Pool Shop",
      category: :HARDWARE
    }
  ]

  query do
    field :shop, :shop do
      arg(:id, non_null(:id))

      resolve(fn %{id: id}, _ ->
        id = String.to_integer(id)

        case Enum.find(@shops, &(&1.id == id)) do
          nil -> {:error, %{message: "not found", details: %{id: id}}}
          shop -> {:ok, shop}
        end
      end)
    end

    field :shops, list_of(:shop) do
      arg(:category, :shop_category)

      resolve(fn
        %{category: category}, _ ->
          case Enum.filter(@shops, &(&1.category === category)) do
            [] -> {:error, %{message: "not found", details: %{category: category}}}
            shops -> {:ok, shops}
          end

        _, _ ->
          {:ok, @shops}
      end)
    end
  end
end
