defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({numerator1, denominator1}, {numerator2, denominator2}) do
    reduce({(numerator1 * denominator2) + (numerator2 * denominator1), denominator1 * denominator2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({numerator1, denominator1}, {numerator2, denominator2}) do
    reduce({(numerator1 * denominator2) - (numerator2 * denominator1), denominator1 * denominator2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({numerator1, denominator1}, {numerator2, denominator2}) do
    reduce({numerator1 * numerator2, denominator1 * denominator2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(a:: rational, b :: rational) :: rational
  def divide_by({numerator1, denominator1}, {numerator2, denominator2}) do
    reduce({numerator1 * denominator2, numerator2 * denominator1})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({numerator, denominator}) do
    reduce({Kernel.abs(numerator), Kernel.abs(denominator)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({numerator, denominator}, pow) do
    if pow < 0,
      do: reduce({denominator ** Kernel.abs(pow), numerator ** Kernel.abs(pow)}),
      else: reduce({numerator ** pow, denominator ** pow})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {numerator, denominator}) do
      # root(x ** numerator, denominator) where the root(p, q) == p ** (1/q), and p = x ** numerator
      (x ** numerator) ** (1/denominator)
  end
  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({numerator, denominator} = whole_num) do
    gcd = Integer.gcd(numerator, denominator)
    if gcd == 1,
      do: std_form(whole_num),
      else: reduce({div(numerator, gcd), div(denominator, gcd)})
  end

  defp std_form({numerator, denominator}) when denominator < 0, do: {numerator * -1, denominator * -1}
  defp std_form(whole_num), do: whole_num
end
