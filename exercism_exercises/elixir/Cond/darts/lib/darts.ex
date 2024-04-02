defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case dart_position(x, y) do
      val when val <= 1.0 -> 10
      val when val <= 5.0 -> 5
      val when val <= 10.0 -> 1
      _ -> 0
    end
  end

  defp dart_position(x, y) do
    :math.sqrt((x**2 + y**2))
  end
end
