defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @earth_year_in_seconds 31557600
  @mercury_year_in_earth_years 0.2408467
  @venus_year_in_earth_years 0.61519726
  @mars_year_in_earth_years 1.8808158
  @jupiter_year_in_earth_years 11.862615
  @saturn_year_in_earth_years 29.447498
  @uranus_year_in_earth_years 84.016846
  @neptune_year_in_earth_years 164.79132

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    earth_years = seconds/@earth_year_in_seconds
    planet |> case do
      :mercury -> {:ok, convert_to_years_on_planet(earth_years, @mercury_year_in_earth_years)}
      :venus -> {:ok, convert_to_years_on_planet(earth_years, @venus_year_in_earth_years)}
      :earth -> {:ok, earth_years}
      :mars -> {:ok, convert_to_years_on_planet(earth_years, @mars_year_in_earth_years)}
      :jupiter -> {:ok, convert_to_years_on_planet(earth_years, @jupiter_year_in_earth_years)}
      :saturn -> {:ok, convert_to_years_on_planet(earth_years, @saturn_year_in_earth_years)}
      :uranus -> {:ok, convert_to_years_on_planet(earth_years, @uranus_year_in_earth_years)}
      :neptune -> {:ok, convert_to_years_on_planet(earth_years, @neptune_year_in_earth_years)}
      _ -> {:error, "not a planet"}
    end
  end

  @spec convert_to_years_on_planet(float, float) :: float
  defp convert_to_years_on_planet(earth_years, conversion_value), do: earth_years / conversion_value

end
