-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Indent selection
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Column at 80 characters
vim.opt.colorcolumn = "80"

-- format-on-save
vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = {"*.java", "*.c", "*.cpp", "*.h", "*.hpp", "*.py", "*.js", "*.go"}, 
    callback = function()
      if vim.fn.expand('%:e') == 'java' then
        vim.cmd("silent !google-java-format -i %")
      elseif vim.fn.expand('%:e') == 'cpp' or vim.fn.expand('%:e') == 'c' or vim.fn.expand('%:e') == 'h' then
        vim.cmd("silent !clang-format -i %")
      elseif vim.fn.expand('%:e') == 'py' then
        vim.cmd("silent !black %")
      elseif vim.fn.expand('%:e') == 'js' then
        vim.cmd("silent !prettier --write %")
      elseif vim.fn.expand('%:e') == 'go' then
        vim.cmd("silent !gofmt -w %")
      end
    end,
  }
)

-- Resize splits
vim.keymap.set("n", "<C-Up>", ":resize +1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +1<CR>", { noremap = true, silent = true })

-- ToggleTerm
vim.keymap.set('n', '<C-\\>', '<cmd>ToggleTerm direction=float<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<F7>', '<cmd>ToggleTerm direction=horizontal<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<F8>', '<cmd>ToggleTerm direction=vertical<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-\\>', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<F7>', '<cmd>ToggleTerm direction=horizontal<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<F8>', '<cmd>ToggleTerm direction=vertical<cr>', { noremap = true, silent = true })

-- Map <Esc> in terminal mode to switch to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.scrolloff = 8          -- Keep cursor 8 lines from screen edge while scrolling
vim.opt.signcolumn = "yes"     -- Always show sign column for LSP diagnostics
vim.opt.updatetime = 250       -- Faster updates for gitsigns and diagnostics
vim.opt.timeoutlen = 300       -- Shorter timeout for which-key

-- Split switching
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })

-- Search settings
vim.opt.ignorecase = true      -- Case-insensitive search
vim.opt.smartcase = true       -- Unless uppercase is present
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true }) -- Esc clears the search highlight without canceling the search

-- Load plugin manager
require("config.lazy")
