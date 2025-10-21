-- Filename: autotag.lua
-- Last change: Mon, 20 Oct 2025, 11:34PM

return {
  'windwp/nvim-ts-autotag',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
}
