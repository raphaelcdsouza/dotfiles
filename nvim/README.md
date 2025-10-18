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
│   │   ├── options.lua      # Neovim options and settings
│   │   └── README.md        # Core configuration documentation
│   └── plugins/             # Plugin configurations
│       ├── cmp.lua          # Autocompletion configuration
│       ├── lsp.lua          # LSP server configuration
│       ├── matchup.lua      # vim-matchup bracket matching
│       ├── oil.lua          # Oil.nvim file explorer
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
- **[Mason](https://github.com/williamboman/mason.nvim)** - LSP server installer and manager
  - Automatic installation of configured language servers
  - Rounded border UI with custom icons
- **[lazydev.nvim](https://github.com/folke/lazydev.nvim)** - Neovim Lua development support (modern neodev replacement)
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)** - LSP progress notifications
- **[schemastore.nvim](https://github.com/b0o/schemastore.nvim)** - JSON/YAML schema support

### Completion & Snippets

- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion engine
  - Sources: LSP, buffer, path, snippets
  - Tab/S-Tab navigation and snippet jumping
  - Integrates with LSP for intelligent completions
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine with friendly-snippets library

### Editor Enhancement

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
- Tailwind CSS
- JSON/YAML (with schema validation)
- Lua (optimized for Neovim config)

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

