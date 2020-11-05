defmodule TodoList do
  def new, do: MultiDict.new

  def add_entry(todo_list, date, title) do
    MultiDict.add(todo_list, date, title)
  end

  def entries(todo_list, date) do
    MultiDict.get(todo_list, date)
  end

  def due_date(todo_list) do
    {{year, month, day},_} = :calendar.local_time
    MultiDict.get(todo_list, {day, month, year})
  end

end
