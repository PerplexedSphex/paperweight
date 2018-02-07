defmodule PaperweightEngine.Page do
    alias __MODULE__

    @enforce_keys [:bullet, :level, :mode]
    defstruct [:bullet, :level, :mode]

    def new(), do:
        %Page{bullet: %Bullet{}, level: 0, mode: :insert}

end