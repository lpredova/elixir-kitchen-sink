defmodule Test do
    def max(a, b) do
        if a >= b, do: a, else: b
    end

    def max_unless(a, b) do
        unless a >= b, do: b, else: a
    end

    # like if else if
    def max_cond(a, b) do
        cond do
            a >= b -> a

        true -> b
        end
    end

    def max_case(a,b) do
        case a >=b do
            true -> a
            false -> b
        end

    end
end
