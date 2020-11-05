employees = ["Bob", "Alice", "John"]



Enum.with_index(employees)


## Iterates too much!?
["Bob", "Alice", "John"] |> Enum.with_index |> Enum.each(fn({employee, index}) -> IO.puts "#{index+1}. #{employee}" end)


## Stream is lazy enumerable which means that it creates result on the demand
# corresponding transformation hasn't yet occured. Structure describes computation and to make it happen we need to send the stream to Enum function
stream = [1,2,3] |> Stream.map(fn(x) -> 2 * x end)
Enum.to_list(stream)
Enum.take(stream, 2)

# Stream.with_index performs lazy transformation and Enum invokes it
["Bob", "Alice", "John"] |> Stream.with_index |> Enum.each(fn({person, index}) -> IO.puts "#{index + 1}.  #{person}" end)

[9, -1, "foo", 25, 49] |>
Stream.filter(&(is_number(&1) and &1 > 0)) |>
Stream.map(&{&1, :math.sqrt(&1)}) |> # transforming results into tuple
Stream.with_index |> # index tuples
Enum.each(fn({{input, result}, index}) -> IO.puts "#{index + 1} sqrt(#{input}) = #{result}" end)

defmodule StreamsTest do

  defp read_file!(path) do
    File.stream!(path) |>
    Stream.map(&String.replace(&1,"\n",""))
  end

  # iteration trough the files happens only when we request it
  def large_lines!(path) do
    read_file!(path) |>
    Enum.filter(&(String.length(&1) > 80))
  end

  # Notice that when the file does not exist, the version with ! raises an error. The version without ! is preferred when you want to handle different outcomes using pattern matching...
  def lines_length!(path) do
    path |>
    read_file!() |>
    Enum.map(&(String.length(&1)))
  end

  def longest_line!(path) do
    read_file!(path) |>
    Enum.max_by(&(String.length(&1)))
  end

  def longest_line_length!(path) do
    read_file!(path) |>
    Stream.map(&String.length/1) |>
    Enum.max()
  end

  def words_per_line!(path) do
    path |>
    read_file!() |>
    Stream.map(&(length(String.split(&1," ")))) |>
    Enum.to_list
  end

end

# StreamsTest.large_lines!("streams.ex")
