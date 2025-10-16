-- Filename: bootstrap.lua
-- Last change: Wed, 15 Oct 2025, 12:17AM
-- Install lazy.nvim automatically

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  spec = {
    { import = "plugins" },
  },
  git = { log = { '--since=3 days ago' } },
  ui = { custom_keys = { false } },
  install = { colorscheme = { 'tokyonight' } },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'rplugin',
        'editorconfig',
        'matchparen',
        'matchit',
      },
    },
  },
  checker = { enabled = false },
}

-- Load the plugins and options
require('lazy').setup(opts)
