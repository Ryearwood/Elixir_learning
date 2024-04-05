defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @color_map %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9
  }

  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    # Map inputs into the color map above.
    # Only take the 1st two items from mapped input list,
    # then return the integer represented by the ordered digits
    colors
    |> Enum.map(&(@color_map[&1]))
    |> Enum.take(2)
    |> Integer.undigits()
  end
end
