
# Elixir does not have classes like in OOP-based languages.
# Functions can be defined multiple times in succession as opposed to overwriting objects.
# This is a major concept difference between OOP-based languages and Function-based languages.

# Instead, modules house all the executional functionality needed to compile code.
# Modules always require a "do" and "end" clause to work.
defmodule MyModule do

  # Public Functions are written the same as in OOP-based languages, except that elixir does not have a "return" statement.
  # Instead, a "do" and "end" clause is used instead.
  def function_name(a,b) do
    # Anonymous functions have no names and are frequently passed to other functions.
    # They can take any number of arguments and parameters.
    # They do not use the "do" clause and can be assigned to variables in the same line of execution.
    new_variable = fn ->
      "asdf"
    end

    private_function_name(new_variable)
  end
   # Single variable function of the same name above.
  def function_name(a) do
    "single variable"
  end

  # Private Functions are written using defp
  # Private functions can ONLY be called within the same module they reside within.
  defp private_function_name(fnc) do
    # Anonymous functions have to be called with .() in this manner if passed in as an arg.
    fnc.()
  end


end

# Running this file with iex -s mix will not work as we are not in a project folder.
# As such, we need to compile this first using "iex > c "{filename}"
# This will compile the function and pass it to the module that it rests within.
# The module can then be called with .{function_name({parameters})} in this manner.
"""
New Terminal Prompt
> iex
> c "~/.filename.ex"
> MyModule.function_name(1)
  "single variable"
> MyModule.function_name(1, 2)
  "asdf"
> CTRL+C to exit iex terminal
"""
