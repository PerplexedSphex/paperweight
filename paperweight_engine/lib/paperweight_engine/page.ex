defmodule PaperweightEngine.Page do
    alias __MODULE__
    alias PaperweightEngine.Bullet

    @enforce_keys [:bullet, :level, :mode]
    defstruct [:bullet, :level, :mode]

    def new(), do:
        %Page{bullet: Bullet.new(), level: 0, mode: :insert}

    def toggle_mode(%Page = page):
        %{Page | mode: :command}

end