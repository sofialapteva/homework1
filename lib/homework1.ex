defmodule Homework1 do
  @moduledoc """
  This module implements the simple calculation function.
  You can use the Homework1.calculate/1 function to add, remove, multiply and divide.
  """

  @doc """
  Calculate the result of an expression:

  ## Examples
      iex> Homework1.calculate "1 + 1"
      2.0
      iex> Homework1.calculate "12 - 76"
      -64.0
      iex> Homework1.calculate "11 * 9"
      99.0
      iex> Homework1.calculate "11 / 2"
      5.5

  """

  @spec calculate(String.t()) :: number()
  def calculate(expression) when is_binary(expression) do
    expression
    |> String.replace(" ", "")
    |> Float.parse()
    |> compute()
  end

  @spec compute({Float.t(), String.t()}) :: number()
  defp compute({a, "+" <> rest}) do
    {b, _} = Float.parse(rest)
    a + b
  end

  defp compute({a, "-" <> rest}) do
    {b, _} = Float.parse(rest)
    a - b
  end

  defp compute({a, "*" <> rest}) do
    {b, _} = Float.parse(rest)
    a * b
  end

  defp compute({a, "/" <> rest}) do
    {b, _} = Float.parse(rest)
    a / b
  end
end
