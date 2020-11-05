
# Compile/shell cmds

Interactive shell
```bash
iex
````

Loading only some files
```bash
iex -r todo-multi_dict.ex -r todo_multi_dict.ex
```

Loading all files in folder into iex session
```bash
iex -r *.ex
```

To exit:
ctrl + c x2


Compile modules
```bash
elixirc geometry.ex
```

Run elixir script (.exs extension)
```bash
elixir script.exs
```

```bash
elixir --no-halt script.exs
```

### Mix
```bash
mix new project_name
```

```bash
mix compile
```

```bash
mix run
```


```bash
iex -S mimx run
```