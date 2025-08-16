return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_ft = { "markdown" }
            if vim.tbl_contains(disable_ft, vim.bo[bufnr].filetype) then
                return
            end
            return { timeout_ms = 1000, lsp_fallback = true }
        end,
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff_fix" },
            go = { "gofumpt", "goimports" },
            javascript = { "prettierd", "prettier" },
            typescript = { "prettierd", "prettier" },
            json = { "jq", "prettierd", "prettier" },
            yaml = { "prettierd", "prettier" },
            sh = { "shfmt" },
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
        vim.keymap.set({ "n", "v" }, "<leader>cf", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format file or range" })
    end,
}


