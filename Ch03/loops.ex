# no do-while

defmodule NaturalNums do

    def print(1), do: IO.puts(1)

    def print(n) do
        print(n - 1)
        IO.puts(n)
    end
end

# tail calls?
# tail-calls does not consume additional memory -> goto iinstad of stack
# case when the last thing we do in function is calling other function
defmodule ListHelper do
    def sum(list) do
        do_sum(0, list)
    end

    # Acts like an anchor
    defp do_sum(current_sum,[]) do
        current_sum
    end

    defp do_sum(current_sum, [head | tail]) do
        new_sum = head + current_sum

        # tail recursion call
        do_sum(new_sum, tail)
    end
end

defmodule TestListLen do
    def list_len(list) do
        len(0 ,list)
    end

    defp len(num_elements, []) do
        num_elements
    end

    defp len(num_elements, [_ | tail]) do
        num_elements = num_elements + 1
        len(num_elements,tail)
    end
end

defmodule TestRange do
    def range(from, to) when is_number(from) and from > 0 and is_number(to) and to > 0 and from < to do
        make_range(from, to, [])
    end

    defp make_range(from, to, result) when from > to  do
        result
    end

    defp make_range(from, to, result) do
        make_range(from, to - 1, [to | result])
    end

end

defmodule TestPositive do
    def positive(list) do
        get_positive(list, [])
    end

    defp get_positive([], result) do
        Enum.reverse(result)
    end

    # getting positive values
    defp get_positive([head | tail], result) when head > 0 do
        get_positive(tail, [head | result])
    end

    # handling if head is not positive, ignore it
    defp get_positive([_|tail], result) do
        get_positive(tail, result)
    end

end
