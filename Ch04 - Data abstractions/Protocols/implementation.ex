#entries = [
#  %{date: {2013, 12, 19}, title: "Dentist"},
#  %{date: {2013, 12, 20}, title: "Shopping"},
#  %{date: {2013, 12, 19}, title: "Movies"}
#]

# todo = TodoList.new(entries)

defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{}, # Initial todo accumulator
      fn (entry, todo_list_acc) ->
        add_entry(todo_list_acc, entry)
      end # or &add_entry(&2, &1)
    )
  end

  def add_entry(
    # Save into variable from function argument
    # Also an runtime check
    %TodoList{entries: entries, auto_id: auto_id} = todo_list,
    entry
    ) do

    # assign id attribute to passed entity
    entry = Map.put(entry, :id, auto_id)
    new_entries = Map.put(entries, auto_id, entry)

    # increment auto_id and re-assign entries
    %TodoList{todo_list |
      auto_id: auto_id + 1,
      entries: new_entries
    }

  end

  def entries(%TodoList{entries: entries}, date) do
    entries |>
    Stream.filter(fn({_, entry}) -> entry.date == date end) |> # When we use HashDict/Map instance with functions from Enum,Stream, than each element is treated in the from key/value
    Enum.map(fn({_,entry}) -> entry end)
  end

  def due_date(%TodoList{entries: entries}) do
    {date,_} = :calendar.local_time

    entries |>
    Stream.filter(fn({_, entry}) -> entry.date == date end) |>
    Enum.map(fn({_,entry}) -> entry end)
  end

  def delete_entry(%TodoList{entries: entries} = todo_list, %{} = entry_to_delete) do

    entry_id_to_delete = entry_to_delete.id

    updated_entries = entries |>
    Stream.filter(fn({_, entry}) -> entry_id_to_delete != entry.id end) |>
    Enum.map(fn({_, entry}) -> entry end)

    %TodoList{ todo_list| entries: updated_entries }
  end

  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn(_) -> new_entry end)
  end

  def update_entry(
    %TodoList{entries: entries} = todo_list,
    entry_id,
    updater_fun
  ) do

    # checks if entity exists in results and if so invokes updater function
    case entries[entry_id] do
      nil -> todo_list

      old_entry ->

        old_entry_id = old_entry.id

        # %{} assertion that result of updater_fun will be map and checking that id was not changed, otherwise error will be invoked
        # ^ means that we are trying to match the value
        new_entry = %{id: ^old_entry_id} = updater_fun.(old_entry)
        new_entries = Map.put(entries, entry_id, new_entry)

        # If you have hierarchical data, you can’t directly modify part of it that resides deep in its tree.
        # Instead, you have to walk down the tree to the particular part that needs to be modified and then transform it and all of its ancestors.
        %TodoList{todo_list |
          entries: new_entries
        }
    end
  end
end

defimpl Collectable, for: TodoList  do
  def into(original) do
    {original, &into_callback/2}
  end

  def into_callback(todo_list, {:cont, entry}) do
    TodoList.add_entry(todo_list,entry)
  end

  def into_callback(todo_list, :done), do: todo_list
  def into_callback(todo_list, :halt), do: :ok

end
