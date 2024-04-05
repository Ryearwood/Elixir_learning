defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @colour_map %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @kilo 1000
  @mega 1000000
  @giga 1000000000

  @spec label(colours :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colours) do
    colours
    |> get_mapped_values()
    |> Integer.undigits()
    |> convert_ohms()
  end

  defp get_mapped_values(colours) do
    first_two_mapped_values = colours |> Enum.map(&(@colour_map[&1])) |> Enum.take(2)
    mapped_zeros = get_number_of_zeros(colours)
    first_two_mapped_values ++ mapped_zeros
  end

  defp get_number_of_zeros(colours) do
    List.duplicate(0, @colour_map[Enum.at(colours, 2)])
  end

  defp convert_ohms(ohms) do
    cond do
      div(ohms, @mega) >= 1000 -> {div(ohms, @giga), :gigaohms}
      div(ohms, @kilo) >= 1000 -> {div(ohms, @mega), :megaohms}
      ohms >= 1000 -> {div(ohms, @kilo), :kiloohms}
      true -> {ohms, :ohms}
    end
  end

end
