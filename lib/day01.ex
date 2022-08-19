defmodule Aoc.Day01 do
  defp parse_input(args) do
    args
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  def run do
    Aoc.Input.get!(1, 2021)
    |> parse_input()
    |> Enum.map(fn line -> IO.puts(" #{line}") end)
  end
end
