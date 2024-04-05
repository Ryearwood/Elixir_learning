defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    # Convert to binary format, then count each value where value is 1
    number
    |> Integer.digits(2)
    |> Enum.count(&(&1 == 1))
  end
end
