# Tmux Configuration Summary

This document describes the structure and purpose of each file in this tmux configuration.

## 📁 File Structure

```
tmux/
├── .tmux.conf           # Main configuration file
├── keymaps.conf         # All keybinding definitions
├── plugins.conf         # Plugin declarations and settings
├── overrides.conf       # Post-plugin override settings
├── README.md            # Complete documentation
├── QUICK-START.md       # Quick start guide for beginners
└── CONFIGURATION-SUMMARY.md  # This file
```

## 🔧 Configuration Files

### `.tmux.conf` (Main Config)

**Purpose**: Entry point for tmux configuration

**Key responsibilities**:
- Sets PATH to use Homebrew bash 5.x (required for Tokyo Night theme)
- Sources other configuration files in correct order
- Initializes TPM (Tmux Plugin Manager)
- Applies override settings after plugins load

**Load order**:
1. Set environment (PATH for bash 5)
2. Load keymaps
3. Load plugins configuration
4. Initialize TPM (plugins load here)
5. Apply overrides

**Important**: The PATH must be set BEFORE TPM initializes, otherwise theme widgets will fail.

### `keymaps.conf`

**Purpose**: All custom keybinding definitions

**Contains**:
- Prefix key configuration (`Ctrl+Space`)
- Pane management (split, resize, navigate)
- Window navigation (`Shift+Left/Right`, `Alt+1-5`)
- Session management bindings
- Copy mode configuration (vi-style)

**Design philosophy**:
- Frequently used commands don't require prefix (`-n` flag)
- Intuitive symbols for splits (`|` for vertical, `-` for horizontal)
- Vim-style navigation (`h/j/k/l`)
- Current directory preservation on splits

### `plugins.conf`

**Purpose**: Plugin declarations and plugin-specific settings

**Plugins declared**:
- `tpm` - Tmux Plugin Manager
- `tmux-sensible` - Sensible defaults
- `vim-tmux-navigator` - Seamless vim/tmux navigation
- `tmux-resurrect` - Session save/restore
- `tmux-continuum` - Auto-save sessions
- `tmux-yank` - System clipboard integration
- `tmux-better-mouse-mode` - Enhanced mouse support
- `tmux-fzf-url` - URL opener with fzf
- `tmux-sessionist` - Session management helpers
- `janoamaral/tokyo-night-tmux` - Tokyo Night theme

**Tokyo Night settings**:
- Theme variant: `night` (dark blue)
- Window ID style: `digital`
- Pane ID style: `hsquare`
- Widgets: datetime, path, git status

**Note**: Requires Nerd Fonts and bash 5+ to work properly.

### `overrides.conf`

**Purpose**: Settings that must be applied AFTER plugins initialize

**Contains**:
- `status-position top` - Overrides plugin default (bottom)

**Why needed**: Some plugins set status bar options during initialization. This file loads after TPM runs, ensuring our preferences win.

**Design**: Keep minimal - only settings that absolutely need to override plugins.

## 🎨 Theme: Tokyo Night

### Requirements

1. **Nerd Font** (v3+)
   - Required for icons in status bar
   - Recommended: MesloLGS Nerd Font

2. **Bash 5.x**
   - macOS ships with bash 3.2 (too old)
   - Install via Homebrew: `brew install bash`
   - Config sets PATH to use Homebrew bash

3. **Optional utilities**:
   - `jq` - JSON parsing for widgets
   - `bc` - Calculations for netspeed widget
   - `gh`, `glab` - Git CLI tools for git widgets

### How Theme Loading Works

1. `.tmux.conf` sets PATH to `/opt/homebrew/bin` first
2. TPM initializes and loads Tokyo Night plugin
3. Tokyo Night scripts run using bash 5.x from Homebrew
4. Scripts execute to generate status bar content:
   - `hostname-widget.sh` - Shows hostname
   - `path-widget.sh` - Current directory
   - `git-status.sh` - Git branch and status
   - `datetime-widget.sh` - Date and time
5. Status bar rendered with icons from Nerd Font

### Common Issues

**Orange bar with no text**:
- Cause: Bash 3.2 can't run theme scripts
- Fix: Install bash 5.x and ensure PATH is set correctly

**Boxes instead of icons**:
- Cause: Terminal not using Nerd Font
- Fix: Configure Terminal to use MesloLGS Nerd Font

## ⌨️ Keybinding Philosophy

### Prefix vs No-Prefix

**With Prefix (`Ctrl+Space`)**: Destructive or mode-changing actions
- Split panes (`|`, `-`)
- Close panes (`x`)
- Create windows (`c`)
- Enter copy mode (`[`)

**Without Prefix**: Navigation and non-destructive actions
- Navigate windows (`Shift+Left/Right`)
- Jump to window (`Alt+1-5`)
- Resize panes (`Alt+Arrow`)
- Navigate panes (`Ctrl+h/j/k/l`) - when not in copy mode

### Why `Ctrl+Space`?

- **Ergonomic**: Easy to reach on most keyboards
- **Mnemonic**: "Space" for a multiplexer feels natural
- **Not common**: Unlike `Ctrl+b` (back), `Ctrl+a` (home)

**Note**: macOS uses `Ctrl+Space` for Input Source switching by default. Must be disabled in System Settings.

### Vim Integration

The `vim-tmux-navigator` plugin makes `Ctrl+h/j/k/l` work seamlessly:
- In vim splits: Navigate between vim splits
- In tmux panes: Navigate between tmux panes
- Crossing boundaries: Automatically switches from vim to tmux

No mental overhead - just navigate naturally!

## 🔄 Plugin Management

### Installing Plugins

1. Add plugin to `plugins.conf`:
   ```bash
   set -g @plugin 'user/plugin-name'
   ```

2. Inside tmux, press `Ctrl+Space I` (capital I)

3. Plugins install to `~/.tmux/plugins/`

### Updating Plugins

Press `Ctrl+Space U` inside tmux

### Removing Plugins

1. Remove/comment line in `plugins.conf`
2. Press `Ctrl+Space Alt+u` to uninstall
3. Or manually: `rm -rf ~/.tmux/plugins/plugin-name`

## 🎯 Design Decisions

### Status Bar at Top

**Why**: Separation of concerns
- Tmux status at top: Session/window info
- Nvim status at bottom (lualine): File/mode/git info
- Clean visual hierarchy

### Split in Current Directory

**Why**: Common workflow
- Split to open related file
- Don't want to cd again
- Predictable behavior

**Implementation**: `-c "#{pane_current_path}"` flag on splits

### Session Persistence

**Why**: Don't lose work
- `tmux-resurrect` - Manual save/restore
- `tmux-continuum` - Auto-save every 15 minutes
- Survives: reboots, crashes, terminal closures

**Storage**: `~/.tmux/resurrect/`

### Vi-style Copy Mode

**Why**: Vim users feel at home
- `setw -g mode-keys vi`
- Visual selection with `v`
- Yank with `y`
- System clipboard integration via `tmux-yank`

## 🚀 Extending the Configuration

### Adding Custom Keybindings

Edit `keymaps.conf`:

```bash
# With prefix
bind key-combo command

# Without prefix (root table)
bind -n key-combo command
```

Examples:
```bash
bind r source-file ~/.tmux.conf  # Ctrl+Space r to reload
bind -n C-t new-window           # Ctrl+t to create window
```

### Adding New Plugins

Edit `plugins.conf`:

```bash
set -g @plugin 'user/plugin-name'
set -g @plugin-option 'value'
```

Then: `Ctrl+Space I` to install

### Customizing Theme

Edit Tokyo Night settings in `plugins.conf`:

```bash
set -g @tokyo-night-tmux_window_id_style digital  # or: fsquare, dsquare
set -g @tokyo-night-tmux_pane_id_style hsquare    # or: fsquare, dsquare
set -g @tokyo-night-tmux_show_datetime 1          # 1 or 0
set -g @tokyo-night-tmux_date_format MYD          # MDY, YMD, etc.
```

### Switching Themes

To use a different theme:

1. Comment out Tokyo Night in `plugins.conf`:
   ```bash
   # set -g @plugin 'janoamaral/tokyo-night-tmux'
   ```

2. Add new theme:
   ```bash
   set -g @plugin 'other/theme'
   ```

3. May need to remove overrides in `overrides.conf` if incompatible

4. Reinstall: `Ctrl+Space I`

## 📊 Load Time Optimization

**Fast startup** is achieved by:

1. **Minimal sourcing**: Only 3 small config files
2. **Lazy plugin loading**: TPM loads plugins efficiently
3. **PATH set once**: Early in `.tmux.conf`
4. **No heavy scripts**: Theme widgets run on-demand

Typical startup time: < 1 second

## 🔐 Security Notes

- **Scripts from plugins**: Tokyo Night runs bash scripts
- **Source**: GitHub repos (vetted, popular)
- **Permissions**: Scripts have execute permissions
- **Network**: Some widgets may make network calls (git status to GitHub)

Always review plugin source before installing!

## 📚 Further Reading

- [Tmux Manual](https://man7.org/linux/man-pages/man1/tmux.1.html)
- [Tokyo Night Tmux Docs](https://github.com/janoamaral/tokyo-night-tmux)
- [Vim-Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)
- [TPM Docs](https://github.com/tmux-plugins/tpm)

---

**Last Updated**: October 26, 2025
