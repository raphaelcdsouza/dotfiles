-- Filename: treesitter.lua
-- Last changed: Wed, 15 Oct 2025, 11:35PM

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = vim.fn.argc(-1) == 0,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "bash", "css", "diff", "html", "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "luap", "markdown", "markdown_inline", "scss", "tsx", "typescript", "vim", "vimdoc", "yaml" },
      highlight = { enable = true },
      indent = { enable = true },
      folds = { enable = true },
    })
  end
}
