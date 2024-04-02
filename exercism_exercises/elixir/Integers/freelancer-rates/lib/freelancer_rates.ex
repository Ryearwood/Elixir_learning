defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: 8.0 * hourly_rate

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * (discount/100))
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(22 * daily_rate(hourly_rate), discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget/monthly_rate(hourly_rate ,discount) * 22, 1)
  end
end
