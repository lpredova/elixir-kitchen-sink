double = fn(x) -> x*2 end

test_num = fn
    x when is_number(x) and x < 0 -> :negative
    0 -> :zero
    x when is_number(x) and x > 0 -> :positive
    end

# test_num.(5)

defmodule TestList do
    def empty?([]), do: true
    def empty?([_|_]), do: false
end

defmodule Polymorphic do
    def double(x) when is_number(x), do: 2 * x

    def double(x) when is_binary(x), do: x <> x
end

defmodule Fact do
    def fact(0), do: 1

    def fact(n), do: n * fact(n-1)        
end

defmodule ListHelper do
    def sum([]), do: 0
    def sum([head | tail]), do: head + sum(tail)
end

defmodule LinesCounter do
    def count(path) do
        File.read(path)
        |> lines_num    
    end

    defp lines_num({:ok, contents}) do
        contents
        |> String.split("\n")
        |> length
    end

    defp lines_num(error), do: error 

end

