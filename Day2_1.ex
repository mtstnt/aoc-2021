defmodule Day2.Counter do
  def start(str), do: str |> String.trim("\r") |> String.split(" ") |> walk
  defp walk(["forward", n]), do: [String.to_integer(n), 0]
  defp walk(["down", n]), do: [0, String.to_integer(n)]
  defp walk(["up", n]), do: [0, -String.to_integer(n)]
end

{:ok, input} = File.read("files/day2.txt")
result = input
|> String.split("\n")
|> Enum.reduce([0, 0], fn (el, acc) ->
  result = Day2.Counter.start(el)
  if !is_list(acc) do
    result
  else
    Enum.map(0..1, fn el ->
      Enum.at(acc, el) + Enum.at(result, el)
    end)
  end
end)
IO.puts Enum.at(result, 0) * Enum.at(result, 1)
