defmodule PaperweightTest do
  use ExUnit.Case
  doctest Paperweight

  test "greets the world" do
    assert Paperweight.hello() == :world
  end
end
