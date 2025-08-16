-- Minimal, ergonomic defaults for DevOps + Backend workflows
local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 5
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 400
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", extends = "→", precedes = "←" }

-- Quick save/quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true, desc = "Write" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit" })

-- Move between splits with Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })


