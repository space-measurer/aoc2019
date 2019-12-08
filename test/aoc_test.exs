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

  describe "day two" do
    test "calculate day two first task" do
      result = Aoc.solve_day_two_first_task()
      solution = result.program[0]
      assert is_number(solution)
    end

    test "calculate day two second task" do
      {noun, verb} = Aoc.solve_day_two_second_task()
      solution = 100 * noun + verb
      IO.inspect(solution, label: "SOLUTION")
      assert is_number(solution)
    end
  end
end
