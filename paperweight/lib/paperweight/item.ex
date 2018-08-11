defmodule Paperweight.Item do

  defstruct(
    title: "",
    history: []
  )

  def new_item() do
    %Paperweight.Item{}
  end

end