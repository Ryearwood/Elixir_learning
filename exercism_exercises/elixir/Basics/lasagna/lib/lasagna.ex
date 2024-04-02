defmodule Lasagna do
  def expected_minutes_in_oven do
    40
  end

  def remaining_minutes_in_oven(current_time_in_oven) do
    expected_minutes_in_oven() - current_time_in_oven
  end

  def preparation_time_in_minutes(num_layers) do
    time_per_layer = 2
    time_per_layer * num_layers
  end

  def total_time_in_minutes(num_layers, current_time_in_oven) do
    calc_total_time(preparation_time_in_minutes(num_layers), current_time_in_oven)
  end

  defp calc_total_time(prep_time, current_time), do: prep_time + current_time

  def alarm do
    "Ding!"
  end
end
