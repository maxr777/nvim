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

-- Column at 80 characters
vim.opt.colorcolumn = "80"

-- below are claude's keybinds, TODO: check if they make sense
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.scrolloff = 8          -- Keep cursor 8 lines from screen edge while scrolling
vim.opt.signcolumn = "yes"     -- Always show sign column for LSP diagnostics
vim.opt.updatetime = 250       -- Faster updates for gitsigns and diagnostics
vim.opt.timeoutlen = 300       -- Shorter timeout for which-key

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })

vim.opt.ignorecase = true      -- Case-insensitive search
vim.opt.smartcase = true       -- Unless uppercase is present
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Load plugin manager
require("config.lazy")
