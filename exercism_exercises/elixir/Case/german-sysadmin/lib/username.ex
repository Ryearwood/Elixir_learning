defmodule Username do
  @moduledoc """
  Module for housing a string sanitizer that uses charlist expressions to clean and
  convert some german character to english.
  """
  @type string_input :: [] | [char()]

  @doc """
  Recursive sanitizer function that removes any characters outside of the charlist [a -> z] chain.
  Converts some german typed characters to english components as outlined below:
    ä --> ae
    ö --> oe
    ü --> ue
    ß --> ss
  """
  @spec sanitize(string_input()) :: [char()]
  def sanitize(~c""), do: ~c""
  def sanitize([head | tail]) do
    head
    |> case do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      character when character <= ?z and character >= ?a -> [character]
      ?_ -> ~c"_"
      _ -> ~c""
    end
    |> Kernel.++(sanitize(tail))
  end
end
