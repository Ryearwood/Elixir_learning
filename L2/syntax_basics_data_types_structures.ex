## Data Types and Structures in Elixir are as follows:

## *********** Everything in Elixir is Immutable ***********
"""
Tuples - {}
Lists - []
Maps - %{} -- Same as Dictionaries in OOP-based Languages
Strings - "" -- Not the same as ''
Atoms - :atom
Ranges - 1..2
Date/Time/DateTime/NaiveDateTime
Numbers (Integer/Float) - 1 / 1.0
"""
# Links and Tuples differ in Elixir because lists operate in the same manner as Linked-Lists.
# I.e Lists are more performant to access the 1st item (O^1), than the last item (O^n)
# ======================================================================================

## Strings vs Charlists
"""
  - "" vs ''
  - Codepoint in UTF-8
  - Charlists are a list of Codepoints
  - IO.inspect with charlists: :as_lists

Open Terminal
> "abc"
  Green letters

> 'abc'
  Orange letters

> i 'abc'
  Data Type: List
  Raw Representation: [97, 98, 99] <--- This is the Charlist values corresponding to the UTF-8 string values.

> IO.inspect [97, 98, 99]
  'abc'

> IO.inspect [97, 98, 99], charlists: as_list
  [97, 98, 99]
  'abc'
"""
# ======================================================================================

## Atoms
"""
  - Globally unique
  - Value is the atom itself - they cannot be assigned as anything the way variables can be.
  - Finite amount available - used to call Erlang, therefore finite numbers of calling methods available.

Do not use Atoms as keys in a Map as you run the risk of running out of them very quickly.
"""
# ======================================================================================

## Primary Modules in Elixir
"""
- Kernel (This is available implicitly and should not be called normally. Only exception is when using it to pipe data)
- String
- Enum
- List
- Map
- Keyword

These are the most used modules
"""
# ======================================================================================

## Map Module
"""
  - Mainly a helper module
  - Can access maps via map[]:key], map["key"]
  - Multiple of the same functions (different behaviour)
  - Lazy functions
  - Embrace map.new

Open Terminal
> %{key: 1}
  {key: 1} --> This is actually an Atom because we used the wrong syntax

> %{"asdf" => 1}
  %{"asdf" => 1} --> This is now set up as a Map Key correctly.

> var = %{"asdf" => 1} --> Assign new map key to a variable.
  {asdf: 1}

> var["asdf"]
  1

> %{{1 ,2} => 2} --> Tuples are commonly used to st up maps with multiple values in this manner.
  {%1 ,2} => 2}

> Map.new([{1, 2}, {3, 4}]) --> Allows us to create a new map out of a list of tuples and assign values in sequence.
  {%1 => 2, 3 => 4}

> Map.new([{1, 2}, {3, 4}] fn {key, value} -> {key * 2, value * 3) end) --> functions can be chained into map function to execute in sequence as well.
  %{2 => 6, 6 => 12}

"""
# ======================================================================================

## Enum Module
"""
  - Map and List helpers
  - Works with anything that implements Enumerable
  - Ranges are Enumerable's
  - Higher order functionality (map/reduce)
  - Do not use Enum.each

Open Terminal
> list = [1,2,3]
  [1, 2, 3]

> Enum.map(list, fn x -> x * 2 end) --> Does not change the original value of list output.
  [2, 4, 6]

> list
  [1, 2, 3]

> list = Enum.map(list, fn x -> x * 2 end) --> Values must be reassigned if you want to update the immutable variables in Elixir
  [2, 4, 6]

> list
  [2, 4, 6]

> Enum.filter([1, 3, 4, 5], fn x-> Integer.is_odd(x) end) --> Filter list for odd numbers
  [1, 3, 5]

> Enum.reduce(list, 0, fn accum, x -> accum + x end) --> Reduces a list of values into a single value based on the function we specify (In this case, accumulate adds the values together)
  12

> Enum.map(%{1 => 2}, fn {key, value} -> {value, key} end) --> Enum can be used to reverse the key and value pairs in this manner. Returns as a list
  [{2, 1}]

> Enum.map(%{1 => 2}, fn {key, value} -> {value, key} |> Map.new end)
  %{2 => 1}

> Enum.into(%{1 => 2}, %{}, fn {key, value} -> {value, key} end) --> Enum.into will convert the value returned into whatever format we specify in arg position 2
  %{2 => 1}

> Enum.into(%{1 => 2}, [], fn {key, value} -> {value, key} end)
  [{2, 1}]
"""
