-- ################################################################################
-- #                                                                              #
-- #                                  MODULES                                     #
-- #                                                                              #
-- ################################################################################

require('plugins')
require('treesitter-config')
require('lualine-config')
require('bufferline-config')
require('dashboard-config')
require('nvim-tree-config')
require('telescope-config')
require('autopairs-config')
require('whichkey-config')
require('toggleterm-config')
require('lsp')
require('twilight-config')
require('zen-mode-config')

-- ################################################################################
-- #                                                                              #
-- #                               CONFIGURATIONS                                 #
-- #                                                                              #
-- ################################################################################

vim.cmd('colorscheme afterglow ') -- afterglow, gruvbox, nord purify onedark
vim.opt.termguicolors = true
vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2
vim.o.splitbelow = true -- :split
vim.o.splitright = true -- :split right
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false -- disable the insert mode message at the bottom
vim.o.backup = false -- prevent making any backup files
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.clipboard = "unnamedplus" -- enable system keyboard
vim.o.hlsearch = false -- highlight search
vim.o.ignorecase = true -- case insensitive
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.mouse = "a" -- enable mouse click in vim
vim.wo.wrap = false -- disable any wrapping for text
vim.wo.number = true -- enable line numbers in the buffer
vim.o.cursorline = true -- hightligh the line we are on
vim.wo.signcolumn = "yes" -- shows dignostics behind the numbers
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- Old Settings
-- vim.o.timeoutlen = 100 -- Disabled gcc command
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.shiftround = true
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- ################################################################################
-- #                                                                              #
-- #                                KEYBINDINGS                                   #
-- #                                                                              #
-- ################################################################################
vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

map('i', 'jk', '<ESC>', {noremap = true, silent = false})
map('i', 'kj', '<ESC>', {noremap = true, silent = false})

map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
    {noremap = true, silent = true})
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>",
    {noremap = true, silent = true})
