
# Elixir does not have classes like in OOP-based languages.

# Instead, modules house all the executional functionality needed to compile code.
# Modules always require a "do" and "end" clause to work.
defmodule MyModule do

  # Private Functions are written using defp
  defp private_function_name do
    "asdf"
  end

  # Public Functions are written the same as in OOP-based languages, except that elixir does not have a "return" statement.
  # Instead, a "do" and "end" clause is used instead.
  def public_function_name(a,b) do
    # Private functions can ONLY be called within the same module they reside within.
    private_function_name

    # Anonymous functions have no names and are frequently passed to other functions.
    # They can take any number of arguments and parameters.
    # They do not use the "do" clause and can be assigned to variables in the same line of execution.
    new_variable = fn a,f ->
      "asdf"
    end

    "return"
  end
end
