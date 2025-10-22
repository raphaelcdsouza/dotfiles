-- Filename: keymaps.lua
-- Last change: Tue, 21 Oct 2025, 10:26PM

local map = require('core.utils').map

map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Window navigation (Ctrl + hjkl)
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to split below' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to split above' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })

-- Window management
map('n', '<leader>pv', '<C-w>v', { desc = 'Split vertically' })
map('n', '<leader>ps', '<C-w>s', { desc = 'Split horizontally' })
map('n', '<leader>pe', '<C-w>=', { desc = 'Make splits equal' })
map('n', '<leader>px', '<cmd>close<cr>', { desc = 'Close current split' })
map('n', '<leader>po', '<C-w>o', { desc = 'Close other splits' })

-- Resize splits
map('n', '<leader>w+', ':resize +2<CR>', { desc = 'Increase height' })
map('n', '<leader>w-', ':resize -2<CR>', { desc = 'Decrease height' })
map('n', '<leader>w>', ':vertical resize -2<CR>', { desc = 'Decrease width' })
map('n', '<leader>w<', ':vertical resize +2<CR>', { desc = 'Increase width' })
