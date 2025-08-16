return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = [[<c-\>]],
            shade_terminals = true,
            direction = "float",
            float_opts = { border = "rounded" },
            highlights = { NormalFloat = { link = "Normal" } },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
}


