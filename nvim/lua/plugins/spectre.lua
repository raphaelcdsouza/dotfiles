-- Filename: spectre.lua
-- Last change: Tue, 21 Oct 2025, 12:23AM

return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', desc = 'Toggle Spectre' },
    { '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = 'Search current word' },
  },
  opts = {},
}
