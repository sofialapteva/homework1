defmodule Homework1 do
  @moduledoc """
  This module implements the simple calculation function.
  You can use the `Homework1.calculate/1` function to add, subtract, multiply and divide.
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
    |> validate()
    |> String.replace(" ", "")
    |> Float.parse()
    |> compute()
  end

  @spec validate(String.t()) :: String.t()
  defp validate(expression) do
    has_add_or_subtract = String.contains?(expression, ["+", "-"])
    has_multiply_or_divide = String.contains?(expression, ["*", "/"])

    if has_add_or_subtract and has_multiply_or_divide do
      warning =
        "WARNING: operations are processed from left to right, disregarding the priority of multiplication and division over addition and subtraction"

      IO.puts(warning)
    end

    expression
  end

  @spec compute({float(), String.t()}) :: number()
  defp compute({result, ""}), do: result

  defp compute({a, "+" <> rest}) do
    {b, rest} = Float.parse(rest)
    compute({a + b, rest})
  end

  defp compute({a, "-" <> rest}) do
    {b, rest} = Float.parse(rest)
    compute({a - b, rest})
  end

  defp compute({a, "*" <> rest}) do
    {b, rest} = Float.parse(rest)
    compute({a * b, rest})
  end

  defp compute({a, "/" <> rest}) do
    {b, rest} = Float.parse(rest)

    if b != 0 do
      compute({a / b, rest})
    else
      "Division by zero is not currently supported."
    end
  end
end
