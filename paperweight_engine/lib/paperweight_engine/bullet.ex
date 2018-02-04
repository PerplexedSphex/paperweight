defmodule PaperweightEngine.Bullet do
    alias __MODULE__

    @enforce_keys [:body, :tags, :children, :cursor]
    defstruct [:body, :tags, :children, :cursor]

    def new(), do:
        %Bullet{body: "", tags: %{}, children: [], cursor: 0}
    
    def edit(%Bullet{} = bullet, text), do:
        %{bullet | body: text}

    def nav_down(%Bullet{} = bullet) do
        cond do
            bullet.cursor == length bullet.children -> 
                %{bullet | cursor: 0}
            true -> 
                %{bullet | cursor: bullet.cursor + 1}
        end
    end

    def nav_up(%Bullet{} = bullet) do
        cond do
            bullet.cursor == 0 -> 
                %{bullet | cursor: length bullet.children}
            true -> 
                %{bullet | cursor: bullet.cursor - 1}
        end
    end

    
end

