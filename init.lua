-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Use 2 spaces per indentation level
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Indent selected text
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Map the nvim-tree toggle key
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Load plugin manager
require("config.lazy")
