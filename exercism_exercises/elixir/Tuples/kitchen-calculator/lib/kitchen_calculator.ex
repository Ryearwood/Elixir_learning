defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  # Convert Any Metric type to Milliliters
  def to_milliliter({:milliliter, vol}),    do: {:milliliter, vol}
  def to_milliliter({:cup, vol}),           do: {:milliliter, vol * 240}
  def to_milliliter({:fluid_ounce, vol}),   do: {:milliliter, vol* 30}
  def to_milliliter({:teaspoon, vol}),      do: {:milliliter, vol * 5}
  def to_milliliter({:tablespoon, vol}),    do: {:milliliter, vol * 15}

  # Convert Milliliters to any other Metric type
  def from_milliliter({:milliliter, vol}, :milliliter),   do: {:milliliter, vol}
  def from_milliliter({:milliliter, vol}, :cup),          do: {:cup, vol / 240}
  def from_milliliter({:milliliter, vol}, :fluid_ounce),  do: {:fluid_ounce, vol / 30}
  def from_milliliter({:milliliter, vol}, :teaspoon),     do: {:teaspoon, vol / 5}
  def from_milliliter({:milliliter, vol}, :tablespoon),   do: {:tablespoon, vol / 15}

  # Convert incoming type to Milliliters, then convert Milliliters to the Desired type
  def convert(volume_pair, unit), do: volume_pair |> to_milliliter() |> from_milliliter(unit)
end
