-- Filename: whichkey.lua
-- Last change: Tue, 21 Oct 2025, 12:14PM

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    preset = 'modern',  -- or 'classic', 'helix'
    icons = {
      breadcrumb = '»',
      separator = '➜',
      group = '+',
    },
    win = {
      border = 'rounded',
      padding = { 1, 2 },
    },
  },

  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)

    -- New API: use wk.add() instead of wk.register()
    wk.add({
      -- Leader groups
      { '<leader>f', group = 'Find', icon = '󰈞' },
      { '<leader>g', group = 'Git', icon = '' },
      { '<leader>h', group = 'Hunks', icon = '' },
      { '<leader>c', group = 'Code', icon = '' },
      { '<leader>x', group = 'Diagnostics', icon = '' },
      { '<leader>t', group = 'Toggle', icon = '' },
      { '<leader>w', group = 'Window', icon = '' },
      { '<leader>b', group = 'Buffer', icon = '󰓩' },
      { '<leader>d', group = 'Debug', icon = '' },
      { '<leader>s', group = 'Search', icon = '' },
      { '<leader>n', group = 'NPM', icon = '📦' },

      -- Git navigation
      { ']c', desc = 'Next Git hunk' },
      { '[c', desc = 'Previous Git hunk' },

      -- Diagnostic navigation
      { ']d', desc = 'Next Diagnostic' },
      { '[d', desc = 'Previous Diagnostic' },

      -- LSP
      { 'gd', desc = 'Go to Definition' },
      { 'gD', desc = 'Go to Declaration' },
      { 'gi', desc = 'Go to Implementation' },
      { 'gr', desc = 'Show References' },
      { 'gt', desc = 'Go to Type Definition' },
      { 'K', desc = 'Hover Documentation' },
    })

    -- Visual mode groups
    wk.add({
      { '<leader>h', group = 'Hunks', mode = 'v' },
      { '<leader>c', group = 'Code', mode = 'v' },
    })
  end,
}
