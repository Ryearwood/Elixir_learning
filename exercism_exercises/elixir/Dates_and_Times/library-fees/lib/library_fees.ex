defmodule LibraryFees do

  @monday 1
  @day_in_seconds 24 * 60 * 60

  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    days_to_return = if before_noon?(checkout_datetime), do: 28 * @day_in_seconds, else: 29 * @day_in_seconds
    NaiveDateTime.add(checkout_datetime, days_to_return)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(@monday)
  end

  def calculate_late_fee(checkout, return, rate) do
    return_datetime = datetime_from_string(return)
    late_fee =
      checkout
      |> datetime_from_string()
      |> return_date()
      |> days_late(return_datetime)
      |> Kernel.*(rate)

    if monday?(return_datetime) do
      floor(late_fee * 0.50)
    else
      late_fee
    end

  end
end
