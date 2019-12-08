defmodule Day02 do
  def calculate_gravity_assist(input) do
    list = for noun <- 0..99, verb <- 0..99, do: {noun, verb}

    Enum.find(list, fn {noun, verb} ->
      program = %{
        program:
          input.program
          |> Map.put(1, noun)
          |> Map.put(2, verb),
        counter: input.counter
      }

      %{program: program, position: _} = calculate(program)

      if program[0] == 19_690_720,
        do: true,
        else: false
    end)
  end

  def calculate(%{program: program, counter: counter}) do
    Enum.reduce_while(1..counter, %{program: program, position: 0}, fn _n, acc ->
      operation = acc.program[acc.position]
      first = Map.get(acc.program, acc.program[acc.position + 1])
      second = Map.get(acc.program, acc.program[acc.position + 2])
      result = calculate_result(operation, first, second)
      location = acc.program[acc.position + 3]

      if result do
        {:cont, %{program: Map.put(acc.program, location, result), position: acc.position + 4}}
      else
        {:halt, acc}
      end
    end)
  end

  def parse_program(path) do
    input = parse_input(path)

    program =
      Enum.reduce(input, %{program: [], position: 0}, fn n, acc ->
        %{program: [{acc.position, n} | acc.program], position: acc.position + 1}
      end)

    %{program: Enum.into(program.program, %{}), counter: program.position - 1}
  end

  defp calculate_result(1, first, second), do: first + second
  defp calculate_result(2, first, second), do: first * second
  defp calculate_result(99, _first, _second), do: nil

  def parse_input(path) do
    path
    |> File.stream!()
    |> Stream.flat_map(&String.split(&1, ","))
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list()
  end
end
