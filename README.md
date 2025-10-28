# Dotfiles

Personal configuration files for development environment setup and customization.

## Purpose

This repository contains my personal dotfiles - configuration files used to customize and set up various development tools and applications. These configurations help maintain a consistent development environment across different machines and make it easy to restore settings after a fresh installation.

## What are Dotfiles?

Dotfiles are configuration files (typically prefixed with a dot `.` on Unix-like systems) that customize your system and applications. This repository centralizes these configurations, making them version-controlled and easily portable.

## Contents

This repository currently contains configurations for:

- **[Neovim](nvim/README.md)** - Cursor-style AI-powered Neovim configuration using Lua, featuring:
  - **AI Assistant** (Avante.nvim) - ChatGPT/Claude integration with diff mode
  - **GitHub Copilot** - Inline code suggestions with Tab line-by-line acceptance
  - **Multi-cursor** support (vim-visual-multi)
  - **LSP** with auto-installation (TypeScript, HTML, CSS, Tailwind, JSON, YAML, Lua)
  - **Telescope** fuzzy finder with git integration
  - **Oil.nvim** file explorer
  - Plugin management with lazy.nvim

- **[Tmux](tmux/README.md)** - Terminal multiplexer configuration with:
  - **Tokyo Night theme** with git status, path, and datetime widgets
  - Custom prefix key (`Ctrl+Space`) for ergonomic access
  - Vim-tmux seamless navigation (`Ctrl+h/j/k/l`)
  - Modern split commands (`|` and `-` in current directory)
  - Fast window switching (`Shift+Left/Right`, `Alt+1-5`)
  - Session persistence across reboots (auto-save/restore)
  - Vi-style copy mode with clipboard integration
  - Status bar positioned at top for clean separation from vim
  
- **Zsh** (`.zshrc`) - Zsh shell configuration with oh-my-zsh, spaceship theme, and development tools (asdf, NVM, Zinit plugins)

## Neovim Highlights

### 🤖 AI-Powered Coding
- **Avante AI Chat** - Cursor-style AI assistant with diff mode for reviewing changes
- **GitHub Copilot** - Line-by-line code suggestions (Tab to accept)
- **Provider switching** - Toggle between Claude and Copilot models on the fly

### ✨ Key Features
- **Multi-cursor editing** - Select and edit multiple occurrences simultaneously
- **VSCode-style line moving** - `Option+↑/↓` to move lines
- **Git integration** - Visual indicators, blame, diff, and Telescope git commands
- **Smart completions** - LSP-powered autocompletion with snippets
- **Interactive rename** - Live preview of symbol renames across your project
- **Project-wide search** - Find and replace across entire codebase

### 🎨 Beautiful UI
- TokyoNight theme
- Statusline with git status and LSP diagnostics
- Color preview for hex/RGB/HSL/Tailwind colors
- Indentation guides with scope highlighting

## Usage

Each subdirectory contains its own README with specific setup instructions and documentation. Please refer to the individual README files linked above for detailed information about each configuration.

### General Setup Pattern

Most configurations in this repository are designed to work with symbolic links:

```bash
# Example: linking Neovim configuration
ln -s /path/to/dotfiles/nvim ~/.config/nvim

# Example: linking Zsh configuration
ln -s /path/to/dotfiles/.zshrc ~/.zshrc
```

Refer to each configuration's README for specific setup instructions.

## Quick Start (Neovim)

```bash
# Clone or symlink to your config directory
ln -s /path/to/dotfiles/nvim ~/.config/nvim

# Launch Neovim - plugins auto-install
nvim

# Check the keymap reference
:edit ~/.config/nvim/KEYMAPS.md
```

## Contributing

These are personal configurations, but feel free to use them as inspiration or reference for your own dotfiles setup.

## License

Feel free to use and adapt these configurations for your own needs.

