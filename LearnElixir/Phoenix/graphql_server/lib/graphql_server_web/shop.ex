defmodule GraphqlServerWeb.Shop do
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

  def all(%{category: category}) do
    case Enum.filter(@shops, &(&1.category === category)) do
      [] -> {:error, %{message: "not found", details: %{category: category}}}
      shops -> {:ok, shops}
    end
  end

  def all() do
    {:ok, @shops}
  end

  def find(%{id: id}) do
    case Enum.find(@shops, &(&1.id == id)) do
      nil -> {:error, %{message: "not found", details: %{id: id}}}
      shop -> {:ok, shop}
    end
  end

end
