defmodule Day2.Counter do
  def start(str), do: str |> String.trim("\r") |> String.split(" ") |> walk
  defp walk(["forward", n]), do: %{h: String.to_integer(n), d: 0}
  defp walk(["down", n]), do: %{h: 0, d: String.to_integer(n)}
  defp walk(["up", n]), do: %{h: 0, d: -String.to_integer(n)}
end

{:ok, input} = File.read("files/day2.txt")
result = input
|> String.split("\n")
|> Enum.reduce(%{h: 0, d: 0}, fn (el, acc) ->
  result = Day2.Counter.start(el)
  %{h: acc.h + result.h, d: acc.d + result.d}
end)
IO.puts result.h * result.d
