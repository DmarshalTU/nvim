return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "b0o/SchemaStore.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        -- global diagnostics setup (minimal, readable)
        vim.diagnostic.config({
            virtual_text = { spacing = 2, prefix = "●" },
            float = { border = "rounded" },
            severity_sort = true,
            signs = true,
            underline = true,
            update_in_insert = false,
        })

        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local on_attach = function(client, bufnr)
            local bufmap = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            -- LSP core
            bufmap("n", "gd", vim.lsp.buf.definition, "Goto Definition")
            bufmap("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
            bufmap("n", "gr", vim.lsp.buf.references, "Goto References")
            bufmap("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
            bufmap("n", "K", vim.lsp.buf.hover, "Hover")
            bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
            bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
            bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
            bufmap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
            bufmap("n", "<leader>e", vim.diagnostic.open_float, "Line Diagnostics")
            bufmap("n", "<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
            bufmap("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
            bufmap("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, "Format Buffer")

            -- Use LSP as omnifunc for minimal completion
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
        if ok_cmp then
            capabilities = cmp.default_capabilities(capabilities)
        end

        -- helper for safer ts server name across versions
        local ts_name = lspconfig.ts_ls and "ts_ls" or "tsserver"

        -- mason-lspconfig automatic server setup
        require("mason-lspconfig").setup({
            ensure_installed = {
                "pyright",
                "ruff",
                "gopls",
                ts_name,
                "yamlls",
                "lua_ls",
            },
            automatic_installation = true,
        })

        -- YAML schemas (Kubernetes aware)
        local schemastore_ok, schemastore = pcall(require, "schemastore")
        local yaml_settings = {
            yaml = {
                validate = true,
                hover = true,
                completion = true,
                schemaStore = {
                    enable = schemastore_ok,
                },
                schemas = schemastore_ok and schemastore.yaml.schemas() or {},
                format = { enable = false },
            },
        }

        -- Explicit server setups (no setup_handlers)
        local function setup(server, extra)
            local opts = vim.tbl_deep_extend("force", {
                on_attach = on_attach,
                capabilities = capabilities,
            }, extra or {})
            lspconfig[server].setup(opts)
        end

        setup("pyright")
        setup("ruff")
        setup("gopls")
        setup(ts_name, {
            settings = {
                typescript = { suggest = { completeFunctionCalls = true } },
                javascript = { suggest = { completeFunctionCalls = true } },
            },
        })
        setup("yamlls", { settings = yaml_settings })
        setup("lua_ls")
    end,
}


