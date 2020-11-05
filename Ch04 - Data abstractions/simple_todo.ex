defmodule TodoList do
  def new, do: HashDict.new

  def add_entry(todo_list, date, title) do
    HashDict.update(
      todo_list,
      date,
      [title], # initial value
      fn(titles) -> [title|titles] end # function that updates
    )
  end

  def entries(todo_list, date) do
    HashDict.get(todo_list, date, [])
  end

end
