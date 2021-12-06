# Aoc

My take on [advent of code 2021](https://adventofcode.com/2021) using Elixir.

FYI I have no idea what I'm doing 😱

I have used [this](https://github.com/jzimbel/adventofcode-elixir) as inspiration for structuring the project and reading inputs from Github (ain't nobody got time to manually download files)

Create a `secrets.exs` inside the `config` folder and add this to it (also make sure you have a session cookie value):

```
use Mix.Config

config :aoc, Aoc.Input,
  allow_network?: true,
  session_cookie: "you find this in the cookie header for your request to https://adventofcode.com/2021/day/1/input"
```

## Run

```
mix deps.get
iex -S mix
iex(1)> Aoc.Day01.run
```