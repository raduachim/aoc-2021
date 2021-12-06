defmodule Aoc.Day03 do
  defp parse_input(input) do
    input
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(fn line -> line |> Enum.map(&String.to_integer/1) end)
    |> Enum.map(&List.to_tuple/1)
  end

  defp get_input do
    Aoc.Input.get!(3, 2021)
    |> String.trim()
    |> String.split("\n")
    |> parse_input()
  end

  defp to_int(data), do: data |> Enum.join() |> String.to_integer(2)

  defp iterations([first | _] = data) do
    tuple_size(first) - 1
  end

  defp most_common_at(list, index),
    do:
      list
      |> Enum.frequencies_by(&elem(&1, index))
      |> Enum.max_by(&elem(&1, 1))
      |> elem(0)

  defp least_common_at(list, index),
    do:
      list
      |> Enum.frequencies_by(&elem(&1, index))
      |> Enum.min_by(&elem(&1, 1))
      |> elem(0)

  def part1 do
    input = get_input()
    nr_of_iterations = iterations(input)

    gamma = Enum.map(0..nr_of_iterations, &most_common_at(input, &1)) |> to_int()
    epsilon = Enum.map(0..nr_of_iterations, &least_common_at(input, &1)) |> to_int()
    gamma * epsilon
  end

  def part2 do
    get_input()
    # |> navigate_by_aim()
    # |> multiply()
  end
end
