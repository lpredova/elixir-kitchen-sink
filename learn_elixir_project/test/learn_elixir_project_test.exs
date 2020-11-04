defmodule LearnElixirProjectTest do
  use ExUnit.Case
  doctest LearnElixirProject

  test "greets the world" do
    assert LearnElixirProject.hello() == :world
  end
end
