defmodule Aoc.Day01 do
  defp parse_input(args) do
    args
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp count_larger_elements(input) do
    # javascript approach I would use
    # let result = 0
    # const output = input.reduce((previous, current) => {
    #   if (current > previous) result++
    #   return current
    # })

    {_, result} =
      Enum.reduce(input, {List.first(input), 0}, fn current, {previous, result} ->
        if current > previous, do: {current, result + 1}, else: {current, result}
      end)

    result
  end

  defp get_input do
    Aoc.Input.get!(1, 2021)
    |> parse_input()
  end

  def part1 do
    get_input()
    |> count_larger_elements()
  end

  def part2 do
    get_input()
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> count_larger_elements()
  end
end
