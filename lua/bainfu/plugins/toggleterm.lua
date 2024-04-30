return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 15, -- Sets the terminal height
            open_mapping = [[<c-\>]], -- Mapping to toggle the terminal
            direction = "horizontal", -- Opens it as a horizontal split
            hide_numbers = true, -- Hides line numbers
        })
    end
}
