defmodule HighSchoolSweetheart do
  # Get 1st Letter of a name
  def first_letter(name), do: name |> String.trim() |> String.first()

  # Get Uppercase Initial from a name in format "R."
  def initial(name), do: name |> first_letter() |> String.upcase() |> Kernel.<>(".")

  # Get initials from a full name formatted to: "R. Y."
  def initials(full_name), do: "#{get_first_initial(full_name)}"<>" "<>"#{get_last_initial(full_name)}"
  defp get_first_initial(full_name), do: full_name |>  String.split() |> List.first() |> initial()
  defp get_last_initial(full_name), do: full_name |> String.split() |> List.last() |> initial()

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
