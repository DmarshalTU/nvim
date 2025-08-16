return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                mappings = {
                    i = { ["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous" },
                },
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume' })
    end,
}
