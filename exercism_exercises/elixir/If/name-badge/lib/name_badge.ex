defmodule NameBadge do
  @moduledoc """
  Module with functions to handle printing an employee badge depending on the employee
  life cycle (New, existing or Owner)
  """
  @spec print(String.t() | nil, String.t(), String.t() | nil) :: String.t()
  def print(id, name, department) when is_nil(department), do: print_owner_badge(id, name)
  def print(id, name, department), do: print_employee_badge(id, name, department)

  defp print_owner_badge(id, name) do
    if is_nil(id) do
      "#{name} - OWNER"
    else
      "[#{id}] - #{name} - OWNER"
    end
  end

  defp print_employee_badge(id, name, department) do
    if is_nil(id) do
      "#{name} - #{String.upcase(department)}"
    else
      "[#{id}] - #{name} - #{String.upcase(department)}"
    end
  end
end
