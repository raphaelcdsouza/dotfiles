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

- **[vim-matchup](https://github.com/andymass/vim-matchup)** - Advanced bracket matching and navigation with treesitter integration
  - Jump between matching pairs with `%`
  - Highlights matching brackets and pairs
  - Stopline set to 500 for performance optimization
- **[Oil.nvim](https://github.com/stevearc/oil.nvim)** - File explorer that lets you edit your filesystem like a buffer
  - Keybindings: `-` to open parent directory, `<leader>-` for floating window
  - Shows hidden files by default with natural ordering
  - Includes mini.icons for file icons
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

