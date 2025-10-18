-- Filename: matchup.lua
-- Last change: Fri, 17 Oct 2025, 5:35PM

return {
  'andymass/vim-matchup',
  init = function()
    vim.g.matchup_treesitter_stopline = 500

    require('match-up').setup({
      treesitter = {
        stopline = 500
      }
    })
  end,
}
