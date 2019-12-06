defmodule Aoc do
  def solve_day_one_first_task() do
    Day01.calculate_total_fuel_per_modules("./mass_list")
  end

  def solve_day_one_second_task() do
    Day01.calculate_total_fuel("./mass_list")
  end
end
