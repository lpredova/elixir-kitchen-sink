defmodule Rectangle do
    def area({a,b}) do
        a * b
    end
end


defmodule Geometry do
    def rectangle_area(a,b) do
        a * b
    end
end

defmodule Circle do
    @moduledoc """
    this is some descripiton of the module
    """

    @pi  3.141592

    @doc "computes area of the circle"
    @spec area(number) :: number
    def area(r) do
        IO.puts("calculating circle")
        r * r * @pi
    end
end

defmodule Geo2 do

    import IO
    alias IO, as: SomeIOAlias

    # This is some comment
    def rectangle_area(a,b) do
        puts "Getting rectangle area"
        SomeIOAlias.puts("Some IO ALIAS call")
        a * b
    end

    defp square_area(a) do
        rectangle_area(a,a)
    end

    def default(a, b \\ 10) do
        a * b
    end
end
