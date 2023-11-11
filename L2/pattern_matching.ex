## Pattern matching is used for maintaining neat and functionally efficient code

"""
- Performed with === operant
- Allows Deconstruction
- Can be used with all data types
- Usable inside arguments

Open Terminal

> map = %{a:1, b: 2, c: 3}
  %{a: 1, b: 2, c: 3}

>%{a: value} = map --> because a is an atom here, we can specify the key and extract just the value of it.
  %{a: 1, b: 2, c: 3}

> value
  1

> %{a: value, b: value_2} = map --> We can also match multiple keys at a time using the above method.
  %{a: 1, b: 2, c: 3}

** The '=' above is actually a pattern matching symbol, that's why it is able to match values within the map container. **

** Matches are assigned right to left and open matches just copy the value of the non-open values if provided. **
> var = map
  %{a: 1, b: 2, c: 3}

> value
  1

> value_2
  2

  ** Pattern matching can be applied to lists as well **
> list = [1, 2 ,3]
  [1, 2, 3]

> [a, b, c] = list
  [1, 2, 3]

> a
  1

> b
  2

> c
  3

** Individual items cannot be pattern matched in Lists -- see below **
> [a] = list
  ** [MatchError] no match of right hand side value: [1, 2, 3]

** A workaround is to use an empty variable **
> [_, a, _] = list
  [1, 2, 3]

> a
  2

** Can be used with maps as well **
> map
  %{a: 1, b: 2, c: 3}

> %{a: _} = map ---> doesn't do anything here because we aren't assigning a value, but has useful connotations for later
  %{a: 1, b: 2, c: 3}
"""

defmodule PatternMatch do

  # To match a list single value list
  def function_name([list_item]) do
    list_item
  end

  # To match 1st item in list and then the rest of the list
  def function_name([head | tail]) do
    {head, tail}
  end

  # To match multiple, see this example
  def function_name(%{a: value, b: value_2}) do
    {value, value_2}
  end

  # These functions will match in order from top to bottom within the module
  # Execution will end on the 1st possible match.
  def function_name(%{a: value}) do
    value
  end

  def function_name(%{b: value}) do
    value
  end
end

"""
Open Terminal

> c "./pattern_matching.ex"
  [PatternMatch]

> PatternMatch.function_name(%{a: 1, b: 3})
  {1, 3}

> PatternMatch.function_name(%{a: 1})
  {1}

> PatternMatch.function_name(%{b: 4})
  {4}

> PatternMatch.function_name([13]) --> This is calling the  Head | Tail function.
  {13, []}

> PatternMatch.function_name([13]) --> We need to move the List matching function to be called 1st in this case
  13

> PatternMatch.function_name([13, 13, 54, 64])
  {13, '\r60@'} --> Charlist value, therefore we can pull this value out.

> {a, b} = PatternMatch.function_name([13, 13, 54, 64])
  {13, '\r60@'}

> i b
  Raw Representation: [13, 54, 64]
"""
