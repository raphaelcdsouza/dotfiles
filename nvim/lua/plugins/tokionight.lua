-- Filename: tokionight.lua
-- Last change: Wed, 15 Oct 2025, 11:36PM

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd.colorscheme('tokyonight-night')
  end,
}
