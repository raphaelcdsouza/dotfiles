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
  showmode = false,
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
  wrap = false,
  linebreak = true,
  joinspaces = false,

  -- Folding
  foldenable = false,
  foldlevel = 99,
  foldlevelstart = 99,
  foldcolumn = "1",
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",

  -- File & Path
  path = vim.opt.path + "**",
  autochdir = false,
  isfname = vim.opt.isfname:append("@-@"),
  undofile = true,
  hidden = true,

  -- Visual indicators
  list = true,
  listchars = {
    tab = "→ ",      -- Show tabs clearly
    trail = "•",     -- Show trailing spaces (catch mistakes!)
    extends = "⟩",   -- Line extends beyond screen
    precedes = "⟨",  -- Line starts before screen
  },
  -- Timing & Performance
  timeoutlen = 500,
  ttimeoutlen = 10,
  updatetime = 250,

  -- Scrolling
  scrolloff = 8,
  sidescrolloff = 10,

  -- Modelines
  modeline = true,
  modelines = 5,
  modelineexpr = false,

  -- Misc
  shada = "!,'50,<50,s10,h,r/tmp",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

if vim.fn.executable("rg") then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- disable builtins plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "netrw",
  "netrwFileHandlers",
  "loaded_remote_plugins",
  "loaded_tutor_mode_plugin",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "matchparen", -- matchparen.nvim disables the default
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
