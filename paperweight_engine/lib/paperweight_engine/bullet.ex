defmodule PaperweightEngine.Bullet do
    alias __MODULE__

    @enforce_keys [:body, :tags, :children, :cursor]
    defstruct [:body, :tags, :children, :cursor]

    def new(), do:
        %Bullet{body: "", tags: %{}, children: [], cursor: 0}
    
    def edit(%Bullet{} = bullet, text), do:
        %{bullet | body: text}

    def edit_at(%Bullet{} = bullet, text) do
        {to_edit, _} = List.pop_at(bullet.children, bullet.cursor)
        %{bullet | children: List.replace_at(bullet.children, bullet.cursor, Bullet.edit(to_edit, text))}
    end

    def nav_down(%Bullet{} = bullet) do
        cond do
            bullet.cursor == length(bullet.children) - 1 -> 
                %{bullet | cursor: 0}
            true -> 
                %{bullet | cursor: bullet.cursor + 1}
        end
    end

    def nav_up(%Bullet{} = bullet) do
        cond do
            bullet.cursor == 0 -> 
                %{bullet | cursor: (length(bullet.children) - 1)}
            true -> 
                %{bullet | cursor: bullet.cursor - 1}
        end
    end

    def move_down(%Bullet{} = bullet) do
        {figure, ground} = List.pop_at(bullet.children, bullet.cursor)
        cond do
            bullet.cursor == length(bullet.children) - 1 -> 
                %{bullet | children: List.insert_at(ground, 0, figure), cursor: 0}
            true -> 
                %{bullet | children: List.insert_at(ground, bullet.cursor + 1, figure), cursor: (bullet.cursor + 1)}
        end
    end

    def move_up(%Bullet{} = bullet) do
        {figure, ground} = List.pop_at(bullet.children, bullet.cursor)
        cond do
            bullet.cursor == 0 -> 
                %{bullet | children: List.insert_at(ground, length(bullet.children) - 1, figure), cursor: length(bullet.children) - 1}
            true -> 
                %{bullet | children: List.insert_at(ground, bullet.cursor - 1, figure), cursor: bullet.cursor - 1}
        end
    end

    def insert(%Bullet{} = bullet), do:
        %{bullet | children: List.insert_at(bullet.children, bullet.cursor, Bullet.new())}

    def add(%Bullet{} = bullet) do
        cond do 
            length(bullet.children) == 0 ->
                %{bullet | children: List.insert_at(bullet.children, bullet.cursor, Bullet.new())}
            true ->
                %{bullet | children: List.insert_at(bullet.children, bullet.cursor + 1, Bullet.new()), cursor: bullet.cursor + 1}
        end
    end

end

