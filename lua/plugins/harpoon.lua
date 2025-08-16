return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                save_on_toggle = false,
                sync_on_ui_close = false,
                key = function()
                    return vim.loop.cwd()
                end,
            }
        })

        -- Telescope-based Harpoon picker
        local function toggle_picker(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end
            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({ results = file_paths }),
                sorter = require("telescope.config").values.generic_sorter({}),
                attach_mappings = function(_, map)
                    return true
                end,
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_picker(harpoon:list()) end,
            { desc = "Open harpoon window" })
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end,
}
