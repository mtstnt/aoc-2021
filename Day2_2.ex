defmodule Day2.Counter do
  def start(str, aim), do: str |> String.trim("\r") |> String.split(" ") |> walk(aim)
  defp walk(["forward", n], aim), do: %{h: String.to_integer(n), d: String.to_integer(n) * aim, a: 0}
  defp walk(["down", n], _),    do: %{h: 0, d: 0, a: String.to_integer(n)}
  defp walk(["up", n], _),      do: %{h: 0, d: 0, a: -String.to_integer(n)}
end

{:ok, input} = File.read("files/day2.txt")
result = input
|> String.split("\n")
|> Enum.reduce(%{h: 0, d: 0, a: 0}, fn (el, acc) ->
  result = Day2.Counter.start(el, acc.a)
  %{h: acc.h + result.h, d: acc.d + result.d, a: acc.a + result.a}
end)
IO.puts result.h * result.d
