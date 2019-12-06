defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  describe "day one" do
    test "calculate day one first task" do
      total_fuel_per_module_mass = Aoc.solve_day_one_first_task()
      assert is_number(total_fuel_per_module_mass)
    end

    test "calculate day one second task" do
      total_fuel_per_module_mass = Aoc.solve_day_one_second_task()
      assert is_number(total_fuel_per_module_mass)
    end
  end
end
