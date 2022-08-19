defmodule Aoc.Day02 do
  defp parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      [direction, value] = line |> String.split(" ")
      {String.to_existing_atom(direction), String.to_integer(value)}
    end)
  end

  defp get_input do
    Aoc.Input.get!(2, 2021)
    |> parse_input()
  end

  defp navigate(input) do
    Enum.reduce(input, %{horizontal: 0, depth: 0}, fn
      {:forward, value}, %{horizontal: horizontal} = acc ->
        %{acc | horizontal: horizontal + value}

      {:up, value}, %{depth: depth} = acc ->
        %{acc | depth: depth - value}

      {:down, value}, %{depth: depth} = acc ->
        %{acc | depth: depth + value}
    end)
  end

  defp navigate_by_aim(input) do
    Enum.reduce(input, %{horizontal: 0, depth: 0, aim: 0}, fn
      {:forward, value}, %{horizontal: horizontal, depth: depth, aim: aim} = acc ->
        %{acc | horizontal: horizontal + value, depth: depth + aim * value}

      {:up, value}, %{aim: aim} = acc ->
        %{acc | aim: aim - value}

      {:down, value}, %{aim: aim} = acc ->
        %{acc | aim: aim + value}
    end)
  end

  defp multiply(%{horizontal: horizontal, depth: depth}), do: horizontal * depth

  def part1 do
    get_input()
    |> navigate()
    |> multiply()
  end

  def part2 do
    get_input()
    |> navigate_by_aim()
    |> multiply()
  end
end
