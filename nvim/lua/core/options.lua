-- Filename: options.lua
-- Last changed: Tue, 14 Oct 2025 - 11:03PM

local opt = vim.opt
local g = vim.g

vim.g.matchparen_timeout = 20
vim.g.matchparen_insert_timeout = 20

local options = {
	-- Display & UI
	winbar = '%=%m %f %y',
  cursorline = false,
  cursorcolumn = false,
  termguicolors = true,

  -- showmode = false // disable this when using a statusline plugin
  showmatch = true,
  matchtime = 2,
  number = true,
  relativenumber = true,
  numberwidth = 2,
  showtabline = 0,
  laststatus = 3,
  cmdheight = 0,
  conceallevel = 0,

  -- Window spliting
  splitright = true,
  splitbelow = true,

  -- Search Options
  smartcase = true,
  ignorecase = true,
  hlsearch = false,
  incsearch = true,
  inccommand = "nosplit",

	-- Indentation & Tabs
	expandtab = true,
	tabstop = 2,
	shiftwidth = 2,
	shiftround = true,

  -- Text wrapping
  wrap = true,
  linebreak = true,
  joinspaces = false,

  -- Folding
  foldenable = false,
  foldlevel = 99,
  foldlevelstart = 99,
  foldcolumn = "1",
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
