# Core Configuration

This directory contains core Neovim configuration files.

## Files

- `bootstrap.lua` - Plugin manager bootstrap configuration
- `keymaps.lua` - Global keybindings and custom keymaps
- `coffeescript.lua` - CoffeeScript autocommands, keybindings, and filetype detection
- `options.lua` - Neovim options and settings
- `utils.lua` - Utility functions
- `autocommands.lua` - Automatic commands

## Keymaps

The `keymaps.lua` file contains all global keybindings. Key features include:

### AI & Copilot
- **`<leader>aa`** - Toggle Avante AI chat (with Oil buffer protection)
- **`<leader>ae`** - Edit selected code with AI
- **`<leader>ap`** - Switch AI provider (Claude/Copilot)
- **`<leader>am`** - Switch Claude model
- **`<leader>aM`** - Switch Copilot model (GPT)
- **`<leader>aE`** - Edit Avante config file
- **Diff controls**: `co`, `ct`, `ca`, `c0`, `cb`, `]x`, `[x`

### Window Management
- **`Ctrl+h/j/k/l`** - Navigate between splits (seamlessly works with tmux panes via vim-tmux-navigator)
- **`<leader>pv/ps`** - Split vertically/horizontally
- **`<leader>w+/-/>/< `** - Resize splits

### Editing
- **`Option+↑/↓`** - Move lines/selection up/down (VSCode-style)
- **`<leader>cn`** - Cursor-style jump to next word occurrence and append

### Git Navigation
- **`<leader>gs`** - Git status (changed files only via Telescope)
- **`<leader>gf`** - Git files (all tracked files via Telescope)

See [KEYMAPS.md](../../KEYMAPS.md) for complete keymap reference.

## Options Reference

The `options.lua` file configures various Neovim settings. Below is a complete reference of all configured options:

### Display & UI

| Option | Value | Description |
|--------|-------|-------------|
| `winbar` | `'%=%m %f %y'` | Window bar format string |
| `cursorline` | `false` | Highlight the current line |
| `cursorcolumn` | `false` | Highlight the current column |
| `termguicolors` | `true` | Enable 24-bit RGB colors in the TUI |
| `showmode` | `false` | Don't show mode in command line |
| `showmatch` | `true` | Highlight matching brackets |
| `matchtime` | `2` | Time to show matching bracket (tenths of a second) |
| `number` | `true` | Show line numbers |
| `relativenumber` | `true` | Show relative line numbers |
| `numberwidth` | `2` | Minimum width of number column |
| `showtabline` | `0` | Never show tab line |
| `laststatus` | `3` | Global statusline |
| `cmdheight` | `0` | No command line height |
| `conceallevel` | `0` | Don't conceal text |

### Window Splitting

| Option | Value | Description |
|--------|-------|-------------|
| `splitright` | `true` | Open vertical splits to the right |
| `splitbelow` | `true` | Open horizontal splits below |

### Search Options

| Option | Value | Description |
|--------|-------|-------------|
| `smartcase` | `true` | Override ignorecase if search contains uppercase |
| `ignorecase` | `true` | Ignore case in search patterns |
| `hlsearch` | `false` | Don't highlight search results |
| `incsearch` | `true` | Show search matches as you type |
| `inccommand` | `"nosplit"` | Show effects of substitute command incrementally |

### Indentation & Tabs

| Option | Value | Description |
|--------|-------|-------------|
| `expandtab` | `true` | Use spaces instead of tabs |
| `tabstop` | `2` | Number of spaces a tab counts for |
| `shiftwidth` | `2` | Number of spaces for each indentation level |
| `shiftround` | `true` | Round indent to multiple of shiftwidth |

### Text Wrapping

| Option | Value | Description |
|--------|-------|-------------|
| `wrap` | `false` | Don't wrap lines |
| `linebreak` | `true` | Break lines at word boundaries |
| `joinspaces` | `false` | Don't insert two spaces after punctuation on join |

### Folding

| Option | Value | Description |
|--------|-------|-------------|
| `foldenable` | `false` | Folding disabled by default |
| `foldlevel` | `99` | High fold level (all folds open) |
| `foldlevelstart` | `99` | Start with all folds open |
| `foldcolumn` | `"1"` | Width of fold column |
| `foldmethod` | `"expr"` | Use expression for folding |
| `foldexpr` | `"nvim_treesitter#foldexpr()"` | Use Treesitter for fold expressions |

### File & Path

| Option | Value | Description |
|--------|-------|-------------|
| `path` | `vim.opt.path + "**"` | Search paths for file operations |
| `autochdir` | `false` | Don't auto-change directory |
| `isfname` | `vim.opt.isfname:append("@-@")` | Characters included in file names |
| `undofile` | `true` | Enable persistent undo |
| `hidden` | `true` | Allow hidden buffers |

### Visual Indicators

| Option | Value | Description |
|--------|-------|-------------|
| `list` | `true` | Show invisible characters |
| `listchars` | `{ leadmultispace = "│   ", multispace = "│ ", trail = "•", tab = "→ " }` | Characters to show for invisible characters |

### Timing & Performance

| Option | Value | Description |
|--------|-------|-------------|
| `timeoutlen` | `500` | Time to wait for mapped sequence (ms) |
| `ttimeoutlen` | `10` | Time to wait for key code sequence (ms) |
| `updatetime` | `250` | Time before swap file is written (ms) |

### Scrolling

| Option | Value | Description |
|--------|-------|-------------|
| `scrolloff` | `8` | Minimum lines to keep above/below cursor |
| `sidescrolloff` | `10` | Minimum columns to keep left/right of cursor |

### Modelines

| Option | Value | Description |
|--------|-------|-------------|
| `modeline` | `true` | Enable modeline support |
| `modelines` | `5` | Number of lines to check for modelines |
| `modelineexpr` | `false` | Don't allow expressions in modelines |

### Miscellaneous

| Option | Value | Description |
|--------|-------|-------------|
| `shada` | `"!,'50,<50,s10,h,r/tmp"` | ShaDa (shared data) file options |

### Global Variables

| Variable | Value | Description |
|----------|-------|-------------|
| `g.matchparen_timeout` | `20` | Timeout for matchparen plugin (ms) |
| `g.matchparen_insert_timeout` | `20` | Timeout for matchparen in insert mode (ms) |

### Conditional Options

The following options are set conditionally based on Neovim version or system capabilities:

- **`smoothscroll`** = `true` - Enabled if Neovim version >= 0.10
- **`grepprg`** = `"rg --vimgrep --no-heading --smart-case"` - Set if ripgrep (`rg`) is installed
- **`grepformat`** = `"%f:%l:%c:%m,%f:%l:%m"` - Set if ripgrep (`rg`) is installed

### Disabled Built-in Plugins

The following built-in Neovim plugins are disabled for performance optimization and to avoid conflicts with custom plugins:

- `2html_plugin` - HTML conversion
- `getscript` / `getscriptPlugin` - Script downloading
- `gzip` - Gzip file handling
- `logipat` - Logical patterns
- `matchit` - Extended bracket matching (replaced by vim-matchup)
- `matchparen` - Bracket highlighting (replaced by vim-matchup)
- `netrw` / `netrwPlugin` / `netrwFileHandlers` / `netrwSettings` - File explorer (replaced by Oil.nvim)
- `tar` / `tarPlugin` - Tar archive handling
- `vimball` / `vimballPlugin` - Vimball package format
- `zip` / `zipPlugin` - Zip archive handling
- `rrhelper` - Remote helper
- `spellfile_plugin` - Spell file downloading
- `loaded_remote_plugins` - Remote plugin loading
- `loaded_tutor_mode_plugin` - Tutorial mode

### CoffeeScript Configuration

The `coffeescript.lua` file provides CoffeeScript development support:

#### Auto-compilation
- Automatically compiles `.coffee` files to JavaScript on save
- Displays success/error notifications

#### Keybindings
Available in CoffeeScript buffers:
- `<leader>cc` - Compile current CoffeeScript file
- `<leader>cj` - Show compiled JavaScript output
- `<leader>cr` - Run CoffeeScript file
- `<leader>cl` - Lint with coffeelint (if installed)

#### Filetype Detection
- Registers `.coffee` extension as CoffeeScript filetype

---

*Last updated: Fri, 17 Oct 2025 - 11:07PM*

