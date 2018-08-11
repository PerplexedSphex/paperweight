defmodule Paperweight do
  alias Paperweight.Item

  defdelegate new_item(), to: Item

end
