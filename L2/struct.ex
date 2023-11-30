## Struct file for execution

defmodule User do
  @enforce_keys [:name]
  defstruct [
    :name,
    birthday: 10
]
end
