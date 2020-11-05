defmodule Geometry2 do

    def area({:rectangle, a, b}) do
        a * b
    end

    def area({:square, a}) do
        a * a
    end

    def area({:circle, r}) do
        r * r * 3.14
    end

    def area(unknown) do
        {:error, {:unknown_shape, unknown}}
    end

end

# Geometry2.area({:circle, 10})
# Geometry2.area({:rectangle, 10, 20})
