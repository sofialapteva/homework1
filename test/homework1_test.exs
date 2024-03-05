defmodule Homework1Test do
  use ExUnit.Case
  doctest Homework1

  test "addition" do
    assert Homework1.calculate("1+1") === 2.0
    assert Homework1.calculate("1+0") === 1.0
    assert Homework1.calculate("-1+0") === -1.0
  end

  test "removal" do
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
  end
end
