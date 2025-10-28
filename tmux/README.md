# Tmux Configuration

Terminal multiplexer configuration with custom keybindings, plugins, and vim integration, featuring the Tokyo Night theme.

> **🚀 New to tmux?** Check out [QUICK-START.md](QUICK-START.md) for a beginner-friendly guide!

## ✨ Highlights

- 🎨 **Tokyo Night Theme** - Beautiful dark theme with git status, path, and datetime widgets
- ⌨️ **Custom Prefix** - `Ctrl+Space` for ergonomic access
- 🔄 **Vim Integration** - Seamless navigation between vim and tmux with `Ctrl+h/j/k/l`
- 💾 **Session Persistence** - Auto-save/restore sessions across reboots
- 📍 **Status Bar on Top** - Clean separation from vim's lualine

## 🚀 Quick Setup

### Requirements

- **Nerd Font** - Required for Tokyo Night theme icons
- **Bash 5+** - For theme widgets (install via Homebrew)
- **Optional**: `jq`, `bc`, `gh`, `glab` for full widget support

### 1. Install Dependencies

```bash
# Install Nerd Font
brew install --cask font-meslo-lg-nerd-font

# Install bash 5 and utilities
brew install bash bc jq

# Optional: Git CLI tools for git widgets
brew install gh glab
```

### 2. Configure Terminal Font

**Apple Terminal:**
1. Terminal → Settings → Profiles → Text
2. Click "Change" next to Font
3. Select "MesloLGS Nerd Font" (size 13pt recommended)
4. Restart Terminal

**iTerm2:**
1. Preferences → Profiles → Text
2. Change Font to "MesloLGS Nerd Font"

### 3. Create Symlink

```bash
ln -sf ~/Documents/DEV/dotfiles/tmux/.tmux..conf ~/.tmux.conf
```

### 4. Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 5. Start Tmux and Install Plugins

```bash
tmux
```

Inside tmux, press: `Ctrl+Space` then `Shift+I` (capital I for Install)

Wait for plugins to install, then press Enter.

## 🎯 Features

- **Custom prefix**: `Ctrl+Space` (instead of default `Ctrl+b`)
- **Vim-style navigation**: Seamless navigation between vim splits and tmux panes
- **Modern split commands**: `|` for horizontal, `-` for vertical (in current directory)
- **Fast window switching**: `Shift+Left/Right` or `Alt+1-5`
- **Easy pane resizing**: `Alt+Arrow keys`
- **Session persistence**: Auto-save/restore sessions across reboots
- **Vi-style copy mode**: Familiar vim keybindings for copying text
- **Beautiful theme**: Tokyo Night theme

## ⌨️ Keybindings

### Prefix Key
- `Ctrl+Space` - Prefix key (replaces default `Ctrl+b`)

### Panes
- `Ctrl+Space |` - Split pane vertically (side by side)
- `Ctrl+Space -` - Split pane horizontally (top/bottom)
- `Alt+↑/↓/←/→` - Resize current pane
- `Ctrl+h/j/k/l` - Navigate between panes (vim-style, works with vim!)
- `Ctrl+Space x` - Close current pane

### Windows
- `Ctrl+Space c` - Create new window
- `Shift+Left` - Previous window
- `Shift+Right` - Next window
- `Alt+1` through `Alt+5` - Jump to specific window
- `Ctrl+Space &` - Close current window
- `Ctrl+Space ,` - Rename window

### Sessions
- `Ctrl+Space s` - Choose session from list
- `Ctrl+Space S` - Create new session
- `Ctrl+Space w` - Show session tree
- `Ctrl+Space d` - Detach from session

### Copy Mode (Vi-style)
- `Ctrl+Space [` - Enter copy mode
- `v` - Begin selection (in copy mode)
- `V` - Select line (in copy mode)
- `Ctrl+v` - Rectangle selection (in copy mode)
- `y` - Copy selection to clipboard (in copy mode)
- `Ctrl+Space ]` - Paste

### TPM (Plugin Manager)
- `Ctrl+Space I` - Install plugins
- `Ctrl+Space U` - Update plugins
- `Ctrl+Space Alt+u` - Uninstall plugins not in config

## 📦 Installed Plugins

- **tmux-sensible** - Sensible default settings
- **vim-tmux-navigator** - Seamless vim/tmux navigation
- **tmux-resurrect** - Save/restore tmux sessions
- **tmux-continuum** - Auto-save sessions every 15 minutes
- **tmux-yank** - Copy to system clipboard
- **tmux-better-mouse-mode** - Improved mouse support
- **tmux-fzf-url** - Open URLs from terminal
- **tmux-sessionist** - Better session management
- **tmux-tokyo-night** - Beautiful Tokyo Night theme

## 🔧 Files

- `.tmux.conf` - Main configuration file with PATH setup and plugin initialization
- `keymaps.conf` - All custom keybindings
- `plugins.conf` - Plugin declarations and Tokyo Night theme configuration
- `overrides.conf` - Settings that override plugin defaults (status position)
- `README.md` - This documentation file

## 📝 Common Commands

```bash
# Session management
tmux                        # Start new session
tmux new -s mysession       # Start named session
tmux ls                     # List sessions
tmux attach -t mysession    # Attach to session
tmux kill-session -t name   # Kill specific session
tmux kill-server            # Kill all sessions

# Inside tmux
Ctrl+Space ?                # List all keybindings
Ctrl+Space :                # Enter command mode
```

## 🐛 Troubleshooting

### Keybindings not working?

1. **Check if tmux is reading your config:**
   ```bash
   tmux show-options -g | grep prefix
   # Should show: prefix C-Space
   ```

2. **Check if you have ~/.tmux.conf:**
   ```bash
   ls -la ~/.tmux.conf
   # Should be a symlink to ~/.config/tmux/tmux.conf
   ```

3. **Reload configuration:**
   ```bash
   tmux source ~/.tmux.conf
   ```
   Or from inside tmux: `Ctrl+Space :source ~/.tmux.conf`

### Plugins not working?

1. **Check if TPM is installed:**
   ```bash
   ls ~/.tmux/plugins/tpm
   ```

2. **Install plugins:** Press `Ctrl+Space I` inside tmux

3. **Check plugin loading:**
   ```bash
   tmux show-environment | grep TMUX_PLUGIN
   ```

### Vim-tmux navigation not working?

Make sure you have both:
- The tmux plugin: `christoomey/vim-tmux-navigator` (installed via TPM)
- The vim plugin: `nvim/lua/plugins/tmux-navigator.lua` (should already be in your config)

### Ctrl+Space not working on macOS?

**This is the most common issue!** macOS intercepts `Ctrl+Space` for Input Source switching.

**Fix it:**
1. Open **System Settings** → **Keyboard** → **Keyboard Shortcuts**
2. Click **Input Sources** in the left sidebar
3. Uncheck or change **"Select the previous input source"** (usually set to `Ctrl+Space`)
4. Restart Terminal completely
5. Start tmux: `tmux`

**Alternative:** Use iTerm2 instead of Apple Terminal - it handles keybindings better.

### Tokyo Night theme shows only orange bar?

This means the theme widgets aren't rendering. Usually caused by:

1. **Missing Nerd Font**: Install and configure as described in setup
2. **Old Bash version**: macOS ships with bash 3.2, but theme requires 5.x
   ```bash
   bash --version  # Should show 5.x
   brew install bash  # If not
   ```
3. **Theme not loading**: Restart tmux completely
   ```bash
   tmux kill-server
   tmux
   ```

### Colors look wrong?

Add this to your shell config (`.zshrc` or `.bashrc`):
```bash
export TERM=screen-256color
```

Or start tmux with:
```bash
tmux -2
```

## 💡 Tips

1. **Don't nest tmux sessions** - Detach before creating a new session
2. **Use named sessions** - Easier to remember and switch between
3. **Save your work** - Sessions auto-save with tmux-continuum
4. **Learn the prefix** - `Ctrl+Space` is your friend
5. **Check keybindings** - Press `Ctrl+Space ?` to see all available keys

## 🔗 Integration with Neovim

The vim-tmux-navigator plugin allows seamless navigation:
- Use `Ctrl+h/j/k/l` to move between vim splits and tmux panes
- No need to think about whether you're in vim or tmux
- Just navigate naturally!

## 📚 Resources

- [Tmux Documentation](https://github.com/tmux/tmux/wiki)
- [TPM GitHub](https://github.com/tmux-plugins/tpm)
- [Vim-Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)
- [Tokyo Night Tmux](https://github.com/janoamaral/tokyo-night-tmux)

## 📖 Additional Documentation

- **[QUICK-START.md](QUICK-START.md)** - Beginner-friendly guide with hands-on exercises
- **[CONFIGURATION-SUMMARY.md](CONFIGURATION-SUMMARY.md)** - Detailed technical documentation of configuration structure and design decisions

---

**Last Updated**: October 26, 2025
