return {
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 0.85,
                width = 0.55, -- centered editing column
                options = {
                    number = false,
                    relativenumber = false,
                    signcolumn = "no",
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                },
                gitsigns = { enabled = false },
                twilight = { enabled = true },
            },
        },
        config = function(_, opts)
            require("zen-mode").setup(opts)
            vim.keymap.set("n", "<leader>zz", function()
                require("zen-mode").toggle()
            end, { desc = "Zen: toggle centered focus" })
        end,
    },
    {
        "folke/twilight.nvim",
        opts = { context = 15 },
    },
}


