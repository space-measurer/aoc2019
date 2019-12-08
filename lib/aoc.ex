defmodule Aoc do
  def solve_day_one_first_task() do
    Day01.calculate_total_fuel_per_modules("./mass_list")
  end

  def solve_day_one_second_task() do
    Day01.calculate_total_fuel("./mass_list")
  end

  def solve_day_two_first_task() do
    "./opcode"
    |> Day02.parse_program()
    |> Day02.calculate()
  end

  def solve_day_two_second_task() do
    "./opcode"
    |> Day02.parse_program()
    |> Day02.calculate_gravity_assist()
  end
end
