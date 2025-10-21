-- Filename: todo-comments.lua
-- Last change: Tue, 21 Oct 2025, 12:19AM

return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {},
  keys = {
    { ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
    { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
    { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Find TODOs' },
  },
}
