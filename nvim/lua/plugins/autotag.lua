-- Filename: autotag.lua
-- Last change: Sat, 25 Oct 2025, 4:38PM

return {
  'windwp/nvim-ts-autotag',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
    },
  },
}
