-- Filename: bufferline.lua
-- Last change: Tue, 21 Oct 2025, 12:23AM

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    -- Buffer navigation
    { '<Tab>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous buffer' },
    { '<leader>bp', '<cmd>BufferLinePick<cr>', desc = 'Pick buffer' },
    { '<leader>bc', '<cmd>BufferLinePickClose<cr>', desc = 'Pick close' },

    -- Buffer management
    { '<leader>bd', '<cmd>bdelete<cr>', desc = 'Delete buffer' },
    { '<leader>bD', '<cmd>bdelete!<cr>', desc = 'Delete buffer (force)' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = 'Close other buffers' },
    { '<leader>br', '<cmd>BufferLineCloseRight<cr>', desc = 'Close buffers to right' },
    { '<leader>bl', '<cmd>BufferLineCloseLeft<cr>', desc = 'Close buffers to left' },

    -- Move buffers
    { '<leader>bmn', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
    { '<leader>bmp', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },

    -- Go to buffer by number
    { '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'Go to buffer 1' },
    { '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'Go to buffer 2' },
    { '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'Go to buffer 3' },
    { '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'Go to buffer 4' },
    { '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'Go to buffer 5' },
  },
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
}
