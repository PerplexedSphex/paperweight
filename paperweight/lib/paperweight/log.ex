defmodule Paperweight.Log do

  defstruct(
    timestamp: '',
    text: '',
    status: :inactive
  )

  def new_log() do
    %Paperweight.Log{
      timestamp: DateTime.utc_now()
    }
  end
  
end