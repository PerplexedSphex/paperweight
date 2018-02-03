defmodule PaperweightEngineTest do
  use ExUnit.Case
  doctest PaperweightEngine

  test "greets the world" do
    assert PaperweightEngine.hello() == :world
  end
end
