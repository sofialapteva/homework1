defmodule Homework1Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Homework1

  test "addition" do
    assert Homework1.calculate("1+1") === 2.0
    assert Homework1.calculate("1+0") === 1.0
    assert Homework1.calculate("-1+0") === -1.0
  end

  test "subtract" do
    assert Homework1.calculate("5-1") === 4.0
    assert Homework1.calculate("1-5") === -4.0
    assert Homework1.calculate("1-0") === 1.0
  end

  test "multiply" do
    assert Homework1.calculate("2*5") === 10.0
    assert Homework1.calculate("-2*5") === -10.0
    assert Homework1.calculate("-2*0") === 0.0
  end

  test "divide" do
    assert Homework1.calculate("2/5") === 0.4
    assert Homework1.calculate("-2.5/5") === -0.5
    assert Homework1.calculate("-2/1") === -2.0
    assert Homework1.calculate("-2/0") === "Division by zero is not currently supported."
  end

  test "multiple operations" do
    warning =
      "WARNING: operations are processed from left to right, disregarding the priority of multiplication and division over addition and subtraction\n"

    assert Homework1.calculate("1-0-2") === -1.0
    assert Homework1.calculate("1*10/2") === 5.0
    assert Homework1.calculate("1/5+1") === 1.2
    assert Homework1.calculate("2+2*2") === 8.0

    assert capture_io(fn -> Homework1.calculate("2+2*2") end) == warning
    # The warning would still appear in case the computations are correct
    assert capture_io(fn -> Homework1.calculate("1/5+1") end) == warning
  end
end
