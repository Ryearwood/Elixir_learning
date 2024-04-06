defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    binary_search(numbers, key, 0, tuple_size(numbers)-1)
  end

  defp binary_search(_, _, idx_start, idx_end) when idx_start > idx_end, do: :not_found

  defp binary_search(numbers, key, idx_start, idx_end) do
    mid_idx = div(idx_start + idx_end, 2)
    mid_value = Kernel.elem(numbers, mid_idx)
    cond do
      mid_value  < key -> binary_search(numbers, key, mid_idx + 1, idx_end)
      mid_value  > key -> binary_search(numbers, key, idx_start, mid_idx - 1)
      true -> {:ok, mid_idx}
    end
  end
end
