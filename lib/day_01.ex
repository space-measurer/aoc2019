defmodule Day01 do
  def calculate_total_fuel_per_modules(path) do
    path
    |> parse_input()
    |> Enum.map(&calculate_fuel/1)
    |> total_fuel()
  end

  def calculate_total_fuel(path) do
    path
    |> parse_input()
    |> Enum.map(&calculate_fuel/1)
    |> Enum.map(&calculate_recursive_fuel/1)
    |> total_fuel()
  end

  defp parse_input(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list()
  end

  defp calculate_recursive_fuel(fuel), do: calculate_recursive(fuel, calculate_fuel(fuel))

  defp calculate_recursive(fuel, additional_fuel) when additional_fuel <= 0, do: fuel

  defp calculate_recursive(fuel, additional_fuel),
    do: calculate_recursive(fuel + additional_fuel, calculate_fuel(additional_fuel))

  defp calculate_fuel(mass), do: floor(mass / 3) - 2

  defp total_fuel(list), do: Enum.sum(list)
end
