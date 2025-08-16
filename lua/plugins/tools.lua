return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- LSPs
                "pyright",
                "ruff-lsp",
                "gopls",
                "typescript-language-server",
                "yaml-language-server",

                -- Formatters
                "ruff",
                "gofumpt",
                "goimports",
                "prettierd",
                "prettier",
                "jq",
                "shfmt",
                "stylua",

                -- Linters
                "golangci-lint",
                "yamllint",
                "eslint_d",
            },
            run_on_start = true,
        })
    end,
}


