# Dotfiles

Personal configuration files for development environment setup and customization.

## Purpose

This repository contains my personal dotfiles - configuration files used to customize and set up various development tools and applications. These configurations help maintain a consistent development environment across different machines and make it easy to restore settings after a fresh installation.

## What are Dotfiles?

Dotfiles are configuration files (typically prefixed with a dot `.` on Unix-like systems) that customize your system and applications. This repository centralizes these configurations, making them version-controlled and easily portable.

## Contents

This repository currently contains configurations for:

- **[Neovim](nvim/README.md)** - Personal Neovim configuration using Lua, including plugin management with lazy.nvim
- **Zsh** (`.zshrc`) - Zsh shell configuration with oh-my-zsh, spaceship theme, and development tools (asdf, NVM, Zinit plugins)

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

## Contributing

These are personal configurations, but feel free to use them as inspiration or reference for your own dotfiles setup.

## License

Feel free to use and adapt these configurations for your own needs.

