defmodule MyBehaviour do
  @callback math(integer) :: integer

  def serialize_math(behaviour, value) do
    to_string(behaviour.math(value))
  end
end

defmodule Division do
  @behaviour MyBehaviour

  @impl MyBehaviour
  def math(int) do
    int / 2
  end
end

defmodule Multiplication do
  @behaviour MyBehaviour

  @impl MyBehaviour
  def math(int) do
    int * 5
  end
end
