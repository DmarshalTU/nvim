return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            python = { "ruff" },
            go = { "golangcilint" },
            javascript = { "eslint_d", "eslint" },
            typescript = { "eslint_d", "eslint" },
            yaml = { "yamllint" },
        }

        local function try_lint()
            local ft = vim.bo.filetype
            if lint.linters_by_ft[ft] then
                lint.try_lint()
            end
        end

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
            callback = try_lint,
        })

        vim.keymap.set("n", "<leader>ll", function()
            try_lint()
        end, { desc = "Run Lint" })
    end,
}


