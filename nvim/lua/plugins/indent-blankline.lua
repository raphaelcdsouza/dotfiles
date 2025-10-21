-- Filename: indent-blankline.lua
-- Last change: Mon, 20 Oct 2025, 11:58PM

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    indent = {
      char = '│',
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
    },
    exclude = {
      filetypes = {
        'help',
        'dashboard',
        'lazy',
        'mason',
      },
    },
  },
}
