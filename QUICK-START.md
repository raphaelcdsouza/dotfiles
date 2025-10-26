# Quick Start Guide

**Cursor-style AI-Powered Neovim Configuration**

Get up and running in minutes with this comprehensive Neovim setup featuring AI chat, Copilot, multi-cursor editing, and modern LSP features.

## 🚀 Installation

### Prerequisites

```bash
# Required
brew install neovim       # or your package manager
brew install ripgrep      # for Telescope live grep
brew install git

# Install a Nerd Font (for icons)
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font

# Node.js (via NVM recommended)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 22
nvm alias default 22
```

### Setup

```bash
# Clone to your Neovim config directory
git clone <repository-url> ~/.config/nvim

# Or symlink if managing dotfiles separately
ln -s /path/to/dotfiles/nvim ~/.config/nvim

# Make scripts executable
chmod +x ~/.config/nvim/scripts/copilot-node
chmod +x ~/.config/nvim/scripts/nvim-make

# Launch Neovim (plugins auto-install)
nvim
```

### Post-Installation

```bash
# 1. GitHub Copilot authentication
nvim
:Copilot auth

# 2. Set up Claude (optional, for Avante)
echo 'export AVANTE_ANTHROPIC_API_KEY="your-api-key"' >> ~/.zshrc
source ~/.zshrc

# 3. Check everything works
nvim
:checkhealth
:Mason       # Check LSP servers
```

## 🎯 Essential Keybindings

### AI Features (Leader = Space)

```
<leader>aa   → Toggle AI chat (Avante)
<leader>ae   → Edit with AI (visual selection)
<leader>ap   → Switch provider (Claude ↔ Copilot)
Tab          → Accept Copilot line-by-line
Ctrl+Tab     → Accept entire Copilot suggestion
```

### Editing

```
Option+↑/↓   → Move lines up/down (VSCode-style)
<leader>md   → Multi-cursor: select next occurrence
<leader>ma   → Multi-cursor: select all occurrences
<leader>rn   → Interactive LSP rename (live preview)
gcc          → Toggle line comment
```

### Navigation

```
<leader>ff   → Find files
<leader>fg   → Live grep (search in files)
<leader>gs   → Git status (changed files)
<leader>gf   → Git files (all tracked)
-            → Open file explorer
s            → Flash jump to any location
```

### LSP

```
gd           → Go to definition
gr           → Go to references
gi           → Go to implementation
K            → Hover documentation
<leader>ca   → Code action
[d / ]d      → Previous/next diagnostic
```

### Git

```
<leader>hs   → Stage hunk
<leader>hp   → Preview hunk
<leader>hb   → Blame line
]c / [c      → Next/prev hunk
```

## 💡 Quick Tips

### Using Avante AI Chat

1. Open a file: `nvim myfile.js`
2. Press `<leader>aa` to open AI chat
3. Ask questions or request edits
4. Review diffs with `co` (reject) or `ct` (accept)

**Note**: Don't open Avante in file browser (`nvim .`) - open a specific file first.

### Using Copilot

1. Start typing code
2. Gray suggestion appears automatically
3. Press `Tab` to accept line-by-line (Cursor-style)
4. Or `Ctrl+Tab` to accept all at once
5. Use `Alt+]` to cycle through alternatives

### Multi-Cursor Editing

1. Place cursor on word: `<leader>md`
2. Press `<leader>md` again to select next occurrence
3. Or `<leader>ma` to select all occurrences
4. Edit normally - changes apply to all cursors
5. Press `Esc` to exit multi-cursor mode

### Moving Lines

1. In normal mode: `Option+↑` or `Option+↓`
2. Or select multiple lines (visual mode) and move them together
3. Lines auto-indent after moving

## 🔧 Configuration Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── KEYMAPS.md            # Full keymap reference
├── lua/
│   ├── core/
│   │   ├── keymaps.lua   # Global keybindings
│   │   └── options.lua   # Neovim settings
│   └── plugins/          # Plugin configs (one per file)
│       ├── avante.lua    # AI chat
│       ├── copilot.lua   # GitHub Copilot
│       ├── lsp.lua       # Language servers
│       └── ...
└── scripts/              # Node.js isolation
    ├── copilot-node
    └── nvim-make
```

## 🐛 Troubleshooting

### Copilot Not Working

```bash
# Check authentication
nvim
:Copilot status

# Re-authenticate if needed
:Copilot auth

# Check Node.js wrapper
~/.config/nvim/scripts/copilot-node --version
# Should show: v22.x.x
```

### Avante Errors

```bash
# Don't open Avante in file browser
nvim myfile.js          # ✅ Good
<leader>aa              # Open chat

nvim .                  # ❌ Bad (file browser)
<leader>aa              # Will show warning
```

### LSP Not Working

```vim
:Mason         " Check installed servers
:LspInfo       " Check LSP status
:LspLog        " View logs
:checkhealth   " Run health checks
```

### Plugins Not Loading

```vim
:Lazy          " Check plugin status
:Lazy sync     " Reinstall/update
:Lazy clean    " Remove unused plugins
```

## 📚 Learn More

- **[Full Keymap Reference](nvim/KEYMAPS.md)** - All keybindings by category
- **[Plugin Documentation](nvim/lua/plugins/README.md)** - Plugin details
- **[Node.js Isolation](nvim/scripts/README.md)** - Legacy project support
- **[Core Config](nvim/lua/core/README.md)** - Options and settings

## 🎨 Customization

### Change Theme Variant

```lua
-- In nvim/lua/plugins/tokionight.lua
style = "storm"  -- or "night", "moon", "day"
```

### Change Leader Key

```lua
-- In nvim/lua/core/keymaps.lua
vim.g.mapleader = ' '  -- Change to your preference
```

### Add Your Own Keymaps

```lua
-- In nvim/lua/core/keymaps.lua
local map = require('core.utils').map

map('n', '<your-key>', '<your-command>', { desc = 'Description' })
```

### Disable a Plugin

```lua
-- In nvim/lua/plugins/plugin-name.lua
return {
  "author/plugin",
  enabled = false,  -- Add this line
}
```

## 🆘 Getting Help

1. Check `:checkhealth` for system issues
2. Read [KEYMAPS.md](nvim/KEYMAPS.md) for all keybindings
3. Press `<leader>` and wait - which-key shows available commands
4. Use `:help <topic>` for Neovim built-in help

## ✨ Features Highlight

✅ **AI Chat** - Cursor-style diff mode for reviewing changes  
✅ **Copilot** - Line-by-line code suggestions  
✅ **Multi-cursor** - Select and edit multiple occurrences  
✅ **LSP** - Auto-installed language servers  
✅ **Git Integration** - Visual indicators, blame, diff  
✅ **Fuzzy Finder** - Fast file/buffer/symbol navigation  
✅ **Beautiful UI** - TokyoNight theme, statusline, color preview  
✅ **Smart Editing** - Auto-pairs, comments, surround, line moving  
✅ **Legacy Support** - Node.js isolation for old projects  

## 🚦 Next Steps

1. **Learn the basics**: Try `<leader>ff` (find files) and `<leader>fg` (grep)
2. **Use AI**: Open a file, press `<leader>aa`, ask AI to explain code
3. **Try Copilot**: Start typing, accept suggestions with `Tab`
4. **Explore LSP**: Press `gd` on a symbol to jump to definition
5. **Read the docs**: Open `:edit ~/.config/nvim/KEYMAPS.md`

Enjoy your Cursor-style Neovim experience! 🎉

