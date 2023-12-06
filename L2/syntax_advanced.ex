## Advanced Syntax -- Keyword Search and Navigation functionality

"""
The Keyword Module

- Keywords in Elixir are basically a list of tuple pairs used to fetch values based on the
provided keyword[:key]
- They are not guaranteed to be unique and are commonly referenced
- Commonly used in Options and Configuration

The Access Module

- Access is implemented for Keywords and Maps respectively
- Accessible via item[key]
- Helper functions 'get_in'/'update_in'/'put_in'


Open Terminal

> keyword = [{:atom, 1}]
  [atom: 1]
> keyword_2 = [atom: 1]
 [atom: 1]
> keyword === keyword_2
  true
> map = %{a: %{b: %{c: 2}}}
  %{a: %{b: %{c: 2}}}
> get_in(map, [:a, :b, :c]) ---------> Allows fetching of values from map using keyword
  2
> put-in(map, [:a, :b, :d], 123) ------> allows addition of tuple into map using keyword
  %{a: %{b: %{c: 2, d: 123}}}
> update_in(map, [:a, :b, :c], fn x -> x* 2 end) ---> modifies the map value of specified keywords
  %{a: %{b: %{c: 4}}}

> get_in(keyword, [:atom]) ------> fetches values by variable name 'keyword' used above
  [atom: 1]
> keyword
  [atom: 1]
> map
  %{a: %{b: %{c: 2}}}
> map.a.b.c -------> Shorthand for retrieving map values by level of nesting
  2
> put_in(map.a.b.c, 5) -----> shorthand for updating map using keyword. Nest value MUST exist
  %{a: %{b: %{c: 5}}}
> update_in(map.a.b.c, fn x -> x * 2 end)
  %{a: %{b: %{c: 4}}}


The get_in function actually handles Nil Values instead of throwing hard errors.

> get_in(map, [:a, :d, :c])
  nil
> map[:a][:d][:c]
  nil
"""


## Functions and Short-Forming

"""
- Anonymous functions 'fn -> end'
- Short-form anon functions '&(&1)' --> where the 1 represents the actual parameters for the function
- Short-form function passing '&function/1' --> where 'function/1 represents the name of the function as well as the parameter for the function in question

Open Terminal

> va = fn a -> a*2 end
   function<7..... in :erl_eval.expr/5
> va.(1)
  2
> va = &(&1 * 2) ------> This is the exact same function but written in short-form
  function<7..... in :erl_eval.expr/5
> va.(2)
  4


This can be chained for extremely effective usefulness

> va = &(&1 * &2) ----> function to multiply variable 1 by variable 2
  &:erlang.*/2
> va.(2, 3)
  6

"""

## Structs (These are NOT the same as maps and therefore ACCESS is not possible in the same way)

"""
- Essentially a guarantee of keys
- Can match the struct
- Map.from_struct
- Can enforce keys to be provided on creation
- Default Values

See struct.ex attached file for runtime compile/execution

Open Terminal

> iex
  ....
> c "L2/struct.ex"
  [User]
> User.__struct__
  %User{name: nil, birthday: 10}
> %User{name: "Russell"} ----> Updates the struct according to the passed key with the provided value
  %User{name: "Russell", birthday: 10}
> %User{name: "Russell", birthday: 15}
  %User{name: "Russell", birthday: 15}
> %User{birthday: 15} -----> Let's see if we exclude the enforced 'name' key and value
  ERROR

Struct value or type can be fetched in the following manner
> %struct_type{} = %User{name: "Russell"}
  %User{name: "Russell", birthday: 10}
> struct_type
  User


HOW TO CHECK IF SOMETHING IS A STRUCT VS A MAP

> struct_item = %User{name: "Russell"}
  %User{name: "Russell", birthday: 10}
> struct_item.__struct__
  User

ACCESS Behaviour is not available to Structs and therefore, we cannot use the [] notation to fetch values within a struct
Instead, we must use the . value notation below

> struct_item.name
  "Russell"

We can also use any Map function to retrieve struct values

> Map.get(struct_item, :name)
  " Russell"
"""

## Behaviours

"""

A Behaviour in Elixir is basically a contract that a module implementing the behaviour needs to adhere to.
- Allow for Polymorphism
- Define a contract
- @impl

Open terminal

> iex
....
> c "L2/behaviour.ex"
  [Division, Multiplication, MyBehaviour]
> MyBehaviour.serialize_math(Division, 10)
  "5.0" (using operator '/' for division in Elixir will return a float value. For integers, use 'div()' instead)
> MyBehaviour.serialize_math(Multiplication, 10)
  "50"
"""

## Protocols

"""
- Another way to allow for Polymorphism
- Allow for type-based implementations
- Enumerable
- Powerful tool

A protocol species an API that should be defined by its implementations. A protocol is defined with
'Kernel.defprotocol/2' and its implementations with 'Kernel.defimpl/2'

For example, in Elixir there are 2 actions that can be used to check the items within a Data Structure - 'length' and 'size'.
'length' means the the information has to be computed such that 'length(list) needs to traverse the entire list structure to determine its length.
'size' however, comes with built-in multiple sub-methods 'tuple_size' and 'binary_size', and they do not depend on computation as they are precomputed within the data structure.

Protocols allow us to retrieve information that is not specific to the available data structure type.
I.E writing polymorphic code is possible in Elixir allowing us to work with different shapes/types.

A size protocol can be implemented as follows:


defprotocol Size do
  @doc "Calculates the size(not the length) of a Data Structure"
  def size(data)
end

defimpl Size, for: BitString do
  def size(binary), do: byte_size(binary)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end


The Size module can be implemented with the use of 'Any' also

defprotocol Size do
  @fallback_to_any true

  def size(data)
end

defimpl Size, for: Any do
  def size(_), do: 0
end

"""
