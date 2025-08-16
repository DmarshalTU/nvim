return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "query",
            "python",
            "go",
            "gomod",
            "gowork",
            "gosum",
            "typescript",
            "javascript",
            "tsx",
            "json",
            "yaml",
            "bash",
            "markdown",
            "markdown_inline",
        },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}


