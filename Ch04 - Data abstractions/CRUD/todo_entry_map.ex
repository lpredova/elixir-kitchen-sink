# todo = TodoList.add_entry(todo, %{date: {2020, 10, 22}, task: "Dentist"})
# todo = TodoList.entries(todo,{2020,11,05})

defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new, do: %TodoList{}

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
        new_entry = %{id: ^old_entry_id} = updater_fun.(old_entry)
        new_entries = Map.put(entries, entry_id, new_entry)

        %TodoList{todo_list |
          entries: new_entries
        }
    end
  end

end
# todo = TodoList.add_entry(todo, %{date: {2020, 10, 22}, title: "Dentist", tag: "Healthcare"})
