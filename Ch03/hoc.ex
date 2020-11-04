Enum.each([1,2,3], fn(x)-> IO.puts(x*x) end)

Enum.map([1,2,3], fn(x)-> 2 * x end)

Enum.filter([1,2,3], fn(x) -> rem(x,3) == 1 end)

Enum.reduce([1,2,3], 0, fn(element, sum) -> element + sum end)


Enum.reduce([1,2,"test",3], 
    0, 
    fn 
        element, sum when is_number(element) -> element + sum
        _ , sum -> sum
    end
)

defmodule NumHelper do
    def add_num(num,sum) when is_number(num) do
        num + sum    
    end

    def add_num(_,sum) do
        sum
    end
    
end

#Enum.reduce([1,2,3,"Test",5],0, &NumHelper.add_num/2)