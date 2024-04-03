## Pattern matching - Advanced usage and execution

"""
Open Terminal

We are able to establish anonymous functions that aggregate pattern matching.
This allows extensive usage and the ability to match multiple patterns with a single
function call

> function = fn
  %{a: a, b: b} -> {a, b}
  %{a: a, c: _} -> {a}
  _ -> true
end

> function.(%{a: 2, b: 4})
  {2, 4}
> function.(%{a: 2, c: 4)
  {2}
>function.(1234)
  true
> function.([])
  true
"""

## Assignment is a Pattern Match in Elixir
"""
- {1, 2} = {1, 2} is valid --- in this case, values will match identically due to them
having numerical values

- {a, b} = {1, 2} is pattern matching --- {a, b} sit as substitutional values and
therefore any identically-formatted values will match for {a , b}

- a = {1, 2} is also pattern matching --- This is actually Assignment that is pattern
matched. 'a' is actually matching any value, where {1, 2} is being assigned to 'a' upon a
 successful match
"""

# ======================================================================================
## Pattern Matching with Maps, with Lists, with Functions

"""
Maps:

- Most forgiving format
- Can be used on any key
- Can be Selectively used

Lists:

- Not very forgiving
- Must match every key
- Can match on order [head | tail]
- Recursion with head tail matching

With Functions:

- Can be used within arguments
- Can match anything
- Define multiple functions with different matches
"""

## Putting it all Together

defmodule RecursiveMatch do
  # Module to recursively parse maps and lists to identify a matching value or pattern
  def parse(%{} = map) do
    Enum.into(map, %{}, fn {key, value} ->
    {Atom.to_string(key), parse(value)}
    end)
  end

  def parse([_ | _] = list) do
    Enum.map(list, &parse/1)
  end

  def parse(a) do
    a
  end
end

"""
Open Terminal
> c "./pattern_matching_advanced.ex"
  [RecursiveMatch]

> RecursiveMatch.parse([%{atom: 123, value: %{map: [%{a: 3}]}}])
  [%{"atom" => 123, "value" => %{"map" => [%{"a" => 3}]}}]
"""

## Elixir has powerful use interaction with Recursions.
## Demonstrated in the code written, we see that Pattern matching can be executed
## cleanly with functions that share identical names, but with different patterns of input.
