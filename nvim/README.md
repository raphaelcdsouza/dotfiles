# Neovim Configuration

Personal Neovim configuration using Lua.

## Directory Structure

```
.
├── init.lua                 # Main entry point
├── lazy-lock.json           # Plugin version lockfile
├── lua/
│   ├── core/                # Core configuration
│   │   ├── bootstrap.lua    # Plugin manager bootstrap
│   │   ├── coffeescript.lua # CoffeeScript autocommands and keybindings
│   │   ├── options.lua      # Neovim options and settings
│   │   └── README.md        # Core configuration documentation
│   └── plugins/             # Plugin configurations
│       ├── autopairs.lua    # Auto-pairing brackets and quotes
│       ├── autotag.lua      # Auto-close and rename HTML/JSX tags
│       ├── cmp.lua          # Autocompletion configuration
│       ├── coffeescript.lua # CoffeeScript syntax support
│       ├── colorizer.lua    # Color preview and highlighting
│       ├── comment.lua      # Smart commenting
│       ├── gitsigns.lua     # Git integration and signs
│       ├── indent-blankline.lua # Indentation guides
│       ├── lsp.lua          # LSP server configuration
│       ├── matchup.lua      # vim-matchup bracket matching
│       ├── oil.lua          # Oil.nvim file explorer
│       ├── telescope.lua    # Telescope fuzzy finder
│       ├── tokionight.lua   # TokyoNight theme
│       └── treesitter.lua   # Treesitter configuration
└── README.md                # This file
```

## Documentation

For detailed information about specific configurations, see:

- **[Core Configuration](lua/core/README.md)** - Complete reference of all Neovim options and settings configured in `options.lua`

## Plugins

This configuration includes the following plugins:

### Language Support

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP client configurations for multiple languages
  - **Language Servers**: TypeScript/JavaScript (vtsls), HTML, CSS, Tailwind CSS, ESLint, JSON, YAML, Lua
  - **Keybindings**: `gd` (definition), `gr` (references), `K` (hover), `<leader>ca` (code action), `<leader>rn` (rename), `[d`/`]d` (diagnostics)
  - Custom diagnostic signs and rounded borders
  - Inlay hints for TypeScript/JavaScript
  - Enhanced Tailwind CSS support with cva(), cx(), clsx() utilities and Vue/Svelte support
- **[Mason](https://github.com/williamboman/mason.nvim)** - LSP server installer and manager
  - Automatic installation of configured language servers
  - Rounded border UI with custom icons
- **[lazydev.nvim](https://github.com/folke/lazydev.nvim)** - Neovim Lua development support (modern neodev replacement)
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)** - LSP progress notifications
- **[schemastore.nvim](https://github.com/b0o/schemastore.nvim)** - JSON/YAML schema support
- **[vim-coffee-script](https://github.com/kchmck/vim-coffee-script)** - CoffeeScript syntax highlighting and support
  - Auto-compile on save with error notifications
  - **Keybindings**: `<leader>cc` (compile), `<leader>cj` (show JS), `<leader>cr` (run), `<leader>cl` (lint)

### Completion & Snippets

- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion engine
  - Sources: LSP, buffer, path, snippets
  - Tab/S-Tab navigation and snippet jumping
  - Integrates with LSP for intelligent completions
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine with friendly-snippets library

### Editor Enhancement

- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)** - Highly extendable fuzzy finder for files, buffers, LSP, and more
  - **File Operations**: `<leader>ff` (find files), `<leader>fg` (live grep), `<leader>fw` (grep word), `<leader>fr` (recent files), `<leader>/` (search buffer)
  - **Buffer/Project**: `<leader>fb` (buffers), `<leader>fp` (projects)
  - **Git Integration**: `<leader>gc` (commits), `<leader>gb` (branches), `<leader>gs` (status)
  - **LSP Navigation**: `gr` (references), `gd` (definitions), `gi` (implementations), `gt` (type definitions), `<leader>ds` (document symbols), `<leader>ws` (workspace symbols), `<leader>dd` (diagnostics)
  - **Neovim Internals**: `<leader>fh` (help), `<leader>fc` (commands), `<leader>fk` (keymaps), `<leader>fo` (options), `<leader>ft` (themes)
  - **Extensions**: FZF native sorter, UI select for code actions, project management
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart and powerful commenting
  - **Keybindings**: `gcc` (toggle line), `gbc` (toggle block), `gc` (line operator), `gb` (block operator), `gcO` (above), `gco` (below), `gcA` (end of line)
  - JSX/TSX support via nvim-ts-context-commentstring
  - Works with motions (e.g., `gc3j` to comment 3 lines down)
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Automatic bracket and quote pairing
  - Auto-close brackets, quotes, and tags
  - Smart spacing inside brackets: `(|)` → `( | )`
  - Arrow function support for JS/TS: `() =>` → `() => { | }`
  - Treesitter integration for context-aware pairing
  - Integrates with nvim-cmp for completion
- **[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto-close and rename HTML/JSX tags
  - Automatically close tags when typing `>`
  - Rename paired tags simultaneously
  - Works with HTML, JSX, TSX, and other XML-like formats
- **[vim-matchup](https://github.com/andymass/vim-matchup)** - Advanced bracket matching and navigation with treesitter integration
  - Jump between matching pairs with `%`
  - Highlights matching brackets and pairs
  - Stopline set to 500 for performance optimization
- **[Oil.nvim](https://github.com/stevearc/oil.nvim)** - File explorer that lets you edit your filesystem like a buffer
  - Keybindings: `-` to open parent directory, `<leader>-` for floating window
  - Shows hidden files by default with natural ordering
  - Includes mini.icons for file icons

### UI & Syntax

- **[TokyoNight](https://github.com/folke/tokyonight.nvim)** - Clean, dark Neovim theme with multiple variants
- **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting and code understanding
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration with sign column indicators
  - **Navigation**: `]c` (next hunk), `[c` (previous hunk)
  - **Actions**: `<leader>hs` (stage), `<leader>hr` (reset), `<leader>hp` (preview), `<leader>hb` (blame), `<leader>hd` (diff)
  - **Toggles**: `<leader>tb` (line blame), `<leader>td` (deleted lines)
  - Text object: `ih` (select hunk)
- **[nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)** - Live color preview
  - Highlights hex colors, RGB, HSL, named colors
  - Tailwind CSS color support
  - Background rendering for better visibility
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indentation guides
  - Shows indent levels with vertical lines
  - Highlights current scope with start and end markers
  - Excluded from special buffers (help, dashboard, lazy, mason)

## Setup

### Option 1: Clone directly

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

2. Launch Neovim - plugins will be automatically installed via lazy.nvim:
   ```bash
   nvim
   ```

### Option 2: Symbolic Link (macOS/Unix)

If you manage your dotfiles in a separate directory, you can create a symbolic link:

```bash
ln -s /path/to/your/dotfiles/nvim ~/.config/nvim
```

**Note:** This method is specifically for macOS/Unix. Replace `/path/to/your/dotfiles/nvim` with the actual path to your dotfiles directory.

## Features

### Fuzzy Finding & Navigation

Telescope provides powerful fuzzy finding capabilities:

- **File Navigation**: Quickly find and open files with `<leader>ff`, search file contents with `<leader>fg`
- **Buffer Management**: Switch between open buffers with `<leader>fb`
- **Project Management**: Navigate between projects with `<leader>fp`
- **Git Integration**: Browse commits, branches, and status without leaving Neovim
- **LSP Integration**: Find references, definitions, and symbols across your codebase
- **Live Preview**: See file contents, git diffs, and more in preview window
- **Multi-select**: Select multiple items with Tab and send to quickfix list
- **Smart Filtering**: Ignore node_modules, .git, and build directories automatically

### Git Integration

Seamless Git workflow without leaving Neovim:

- **Visual Indicators**: See added, changed, and deleted lines in the sign column
- **Hunk Navigation**: Jump between changes with `]c` and `[c`
- **Stage & Reset**: Stage or reset hunks with `<leader>hs` and `<leader>hr`
- **Blame & Diff**: View blame info with `<leader>hb` and diff with `<leader>hd`
- **Preview Changes**: Preview hunks inline with `<leader>hp`
- **Text Objects**: Use `ih` to select hunks for operations

### Visual Enhancements

Improve code readability and aesthetics:

- **Color Preview**: See colors inline for hex, RGB, HSL, and Tailwind classes
- **Indentation Guides**: Visual guides for code structure with scope highlighting
- **Git Signs**: Clear visual indicators for file changes in the gutter

### Editing Productivity

Enhance your editing workflow with smart automation:

- **Auto-pairing**: Automatically close brackets, quotes, and parentheses with smart spacing
- **Smart Commenting**: Comment/uncomment code with `gcc` (line) or `gbc` (block), works with any language including JSX/TSX
- **Tag Management**: Auto-close and rename HTML/JSX tags simultaneously
- **Motion Support**: Use operators with motions (e.g., `gc3j` to comment 3 lines)
- **Context Awareness**: Treesitter integration ensures pairing and commenting work correctly in any context

### LSP & Completion

This configuration provides a complete IDE-like experience with:

- **Automatic LSP Installation**: Mason automatically installs configured language servers on first launch
- **Intelligent Autocompletion**: Context-aware completions from LSP, buffer, path, and snippets
- **Code Navigation**: Jump to definitions, references, implementations, and type definitions
- **Diagnostics**: Real-time error and warning display with custom icons
- **Code Actions**: Quick fixes and refactoring suggestions via `<leader>ca`
- **Hover Documentation**: View documentation with `K`
- **Rename Symbol**: Rename across project with `<leader>rn`
- **Inlay Hints**: Type hints for TypeScript/JavaScript (parameters, return types, variable types)

### Supported Languages

Out of the box support for:
- TypeScript/JavaScript (React included)
- HTML/CSS/SCSS
- Tailwind CSS (enhanced with cva, cx, clsx utilities + Vue/Svelte support)
- JSON/YAML (with schema validation)
- Lua (optimized for Neovim config)
- CoffeeScript (with auto-compile and custom keybindings)

## Configuration Files

- `init.lua` - Main configuration entry point
- `lua/core/bootstrap.lua` - Lazy.nvim plugin manager setup
- `lua/core/options.lua` - Editor options and settings (includes disabled built-in plugins for performance)
- `lua/plugins/*.lua` - Individual plugin configurations

## Performance Optimizations

Built-in Neovim plugins are disabled to improve startup performance and reduce conflicts with custom plugins:
- **netrw** - Replaced by Oil.nvim for file exploration
- **matchit/matchparen** - Replaced by vim-matchup for advanced bracket matching
- Other unused built-ins (gzip, tar, zip, vimball, tutor, etc.) are also disabled

## Example Files

The repository includes example configuration files (`.example.lua`) that can be used as templates or references for customization.

