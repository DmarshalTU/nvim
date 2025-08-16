return {
    "DmarshalTU/yaml-jumper",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("yaml-jumper").setup({
            picker_type = "telescope",
            debug_performance = false,

            -- Key mappings
            path_keymap = "<leader>yp",
            value_keymap = "<leader>yv",

            -- Performance settings
            max_file_size = 1024 * 1024, -- 1MB max file size
            max_preview_lines = 20,
            cache_enabled = true,
            cache_ttl = 30, -- seconds
            depth_limit = 10,
            max_history_items = 20,

            -- Parser settings
            use_smart_parser = true,

            -- Highlight settings
            highlights = {
                enabled = true,
                path = { bg = '#404040', fg = '#ffffff', bold = true },
                key = { fg = '#ff9900', bg = '#333333', bold = true }
            },

            -- telescope config only (snacks removed)
            picker_config = {}
        })
    end,
    ft = { "yaml", "yml" },
}
