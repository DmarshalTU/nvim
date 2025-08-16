return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("kanagawa").setup({
            theme = "dragon", -- warmer dark variant
            dimInactive = true,
            transparent = false,
            terminalColors = true,
            background = { dark = "dragon", light = "lotus" },
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none", -- reduce gutter contrast
                        },
                    },
                },
            },
        })
        vim.cmd.colorscheme("kanagawa-dragon")
    end,
}


