defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 and is_integer(input), do: recursive_calc(input, 0)

  defp recursive_calc(1, steps_taken), do: steps_taken
  defp recursive_calc(input, steps_taken) when rem(input, 2) == 0, do: recursive_calc(div(input, 2), steps_taken + 1)
  defp recursive_calc(input, steps_taken), do: recursive_calc(input * 3 + 1, steps_taken + 1)
end
