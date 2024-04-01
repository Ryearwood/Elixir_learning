defmodule BirdCount do
  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([today | tail]), do: [today+1 | tail]

  def has_day_without_birds?([today | _tail]) when today == 0, do: true
  def has_day_without_birds?([_today | tail]), do: has_day_without_birds?(tail)
  def has_day_without_birds?(_list), do: false

  def total([head| tail]), do: head + total(tail)
  def total(_list), do: 0

  # Verify 1st list item
  def busy_days([head | tail]) when head >= 5, do: 1+busy_days(tail)
  # Else pass rest of list as new list to check first item of
  def busy_days([_head | tail]), do: busy_days(tail)
  # if no list to pass, set value to 0
  def busy_days(_list), do: 0

end
