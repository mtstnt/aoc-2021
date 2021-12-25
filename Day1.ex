{:ok, input} = File.read("files/day1.txt")
input
|> String.split("\n")
|> Enum.map(fn e ->
      String.to_integer(e)
    end)
|> Enum.chunk_every(2, 1, :discard)
|> Enum.count(fn [a, b] -> a < b end)
|> IO.puts
