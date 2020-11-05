# anonymous function
square = fn(x) -> x*x
end

#square.(5)

### Functions
print_elem = fn(x) -> IO.puts(x) end

# Enum.each([1,2,3],print_elem)

#& -> capture operator
# Enum.each([1,2,3],&IO.puts/1)

#lambda = fn (x,y,z) -> x * y * z end
#lmd = &(&1 * &2 * &3)

### Closures
outside_var = 5
my_lambda = fn() ->
    IO.puts(outside_var)
end

### Range
range = 1..10

Enum.each(1..10, &IO.puts/1)

### Keyword list
days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]

days_one = [monday: 1, tuesday: 2, wednesday: 3]

Keyword.get(days_one, :monday)

### Hash dict
daysHah = [monday: 1, tuesday: 2, wednesday: 3] |> Enum.into(HashDict.new)
HashDict.get(daysHah, :monday)

Enum.each(
    daysHah,
    fn(key_value) ->
        key = elem(key_value,0)
        value = elem(key_value,1)
        IO.puts "#{key} => #{value}"
    end
)

### Hash set
dayz = [:monday, :tuesday, :wednesday] |> Enum.into(HashSet.new)
HashSet.member?(dayz,:monday)

Enum.each(dayz, &IO.puts/1)

### IO lists
iolist = [[['H', 'e'], "llo"]," worl", "d"]
IO.puts iolist


### Operators
## ===, !==
# ==, !=
# <,>,<=, >=
## only nil and false are falsy

## macros
