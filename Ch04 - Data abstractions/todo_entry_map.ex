# entry = %{date: {2013, 12, 19}, title: "Dentist"}

defmodule TodoList do
  def new, do: MultiMap.new

  def add_entry(todo_map, entry) do
    MultiMap.add(todo_map, entry.date ,entry)
  end

  def entries(todo_map, date) do
    MultiMap.get(todo_map, date)
  end

  def due_date(todo_map) do
    {{year, month, day},_} = :calendar.local_time
    MultiMap.get(todo_map, {day, month, year})
  end

end
# todo = TodoList.add_entry(todo, %{date: {2020,10,22}, title: "Dentist", tag: "Healthcare"})
