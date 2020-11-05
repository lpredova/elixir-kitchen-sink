
for x <- [1,2,3] do
  x*x
end


for x <- [1, 2, 3], y <- [1, 2, 3], do: {x, y, x*y}


for x <- 1..10, y <- 1..10, do: {x,y, x*y}


# Collectable -> abstract term for a functional data type that can collect values = lists, maps, hash-dict


# saving data into table - map
multiplication_table = for x <- 1..9, y <- 1..9, into: %{} do
  {{x, y}, x*y}
end

multiplication_table_filter = for x <- 1..9, y <- 1..9, x <= y, into: %{} do
  {{x,y}, x*y}
end
