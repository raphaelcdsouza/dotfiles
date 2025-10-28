# Tmux Quick Start Guide

Get up and running with tmux in 5 minutes!

## 🎯 What is Tmux?

Tmux (Terminal Multiplexer) lets you:
- Split your terminal into multiple panes
- Create multiple windows (like tabs)
- Detach/reattach sessions (work survives disconnections)
- Navigate seamlessly with vim

Think of it as: **Windows = Browser tabs**, **Panes = Split screen**, **Sessions = Browser windows**

## ⚡ Quick Setup (Copy-Paste)

```bash
# 1. Install dependencies
brew install --cask font-meslo-lg-nerd-font
brew install bash bc jq

# 2. Configure Terminal font
# Terminal → Settings → Profiles → Text → Change Font → "MesloLGS Nerd Font" (13pt)
# Close and restart Terminal

# 3. Fix macOS keyboard shortcut (IMPORTANT!)
# System Settings → Keyboard → Keyboard Shortcuts → Input Sources
# Uncheck "Select the previous input source" (usually Ctrl+Space)

# 4. Setup tmux
ln -sf ~/Documents/DEV/dotfiles/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux

# 5. Inside tmux, press: Ctrl+Space then Shift+I
# Wait for plugins to install, press Enter
```

## 🎮 Essential Keybindings

**Remember: Press `Ctrl+Space` FIRST (your prefix), then the command key**

### Start Here (Most Used)
```
Ctrl+Space |    Split pane vertically (side-by-side)
Ctrl+Space -    Split pane horizontally (top/bottom)
Ctrl+h/j/k/l    Navigate panes (LEFT/DOWN/UP/RIGHT)
Ctrl+Space x    Close current pane (confirm with 'y')

Ctrl+Space c    Create new window
Shift+Left      Previous window (NO PREFIX NEEDED!)
Shift+Right     Next window (NO PREFIX NEEDED!)

Ctrl+Space d    Detach from session (keeps running)
```

### Window Shortcuts (No Prefix!)
```
Alt+1           Jump to window 1
Alt+2           Jump to window 2
Alt+3           Jump to window 3
(etc.)
```

### Pane Resizing (No Prefix!)
```
Alt+Left        Shrink pane left
Alt+Right       Expand pane right
Alt+Up          Shrink pane up
Alt+Down        Expand pane down
```

### Copy Mode
```
Ctrl+Space [    Enter copy mode (use vim keys to navigate)
v               Start selection
y               Copy to clipboard
Ctrl+Space ]    Paste
```

### Help
```
Ctrl+Space ?    Show ALL keybindings
Ctrl+Space :    Enter command mode
```

## 🧪 Try It Now!

### Exercise 1: Create Your First Layout
```bash
# 1. Start tmux
tmux

# 2. Split vertically
Press: Ctrl+Space then |

# 3. Split the right pane horizontally
Navigate right: Ctrl+l
Press: Ctrl+Space then -

# 4. Navigate around
Try: Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l
```

You should see something like:
```
┌─────────┬─────────┐
│         │    1    │
│    0    ├─────────┤
│         │    2    │
└─────────┴─────────┘
```

### Exercise 2: Multiple Windows
```bash
# 1. Create a new window
Press: Ctrl+Space then c

# 2. Switch between windows
Press: Shift+Right (next window)
Press: Shift+Left (previous window)
Press: Alt+0 (jump to window 0)
Press: Alt+1 (jump to window 1)

# 3. Close a window
Type: exit
# Or press: Ctrl+Space then &
```

### Exercise 3: Sessions
```bash
# 1. From outside tmux, create a named session
tmux new -s myproject

# 2. Detach from session
Press: Ctrl+Space then d

# 3. List sessions
tmux ls

# 4. Re-attach to session
tmux attach -t myproject

# 5. Kill session
tmux kill-session -t myproject
```

## 💡 Common Workflows

### Web Development
```
Window 0: Editor (nvim)
Window 1: Server (npm run dev)
Window 2: Tests (npm test --watch)
Window 3: Git/Shell
```

### Split Layout for Coding
```
┌─────────────┬──────┐
│             │      │
│   Editor    │ Logs │
│   (nvim)    │      │
│             ├──────┤
│             │ Git  │
└─────────────┴──────┘
```

Create this:
```bash
tmux
# Split vertical: Ctrl+Space |
# Move right: Ctrl+l
# Split horizontal: Ctrl+Space -
# Move left: Ctrl+h
# Open nvim: nvim
# Move right: Ctrl+l
# Run server: npm run dev
```

## 🆘 Troubleshooting

### "Ctrl+Space doesn't work!"
→ Fix macOS keyboard shortcut (System Settings → Keyboard → Keyboard Shortcuts → Input Sources)

### "I see boxes instead of icons"
→ Change Terminal font to "MesloLGS Nerd Font" and restart Terminal

### "Orange bar with no text"
→ Install bash 5: `brew install bash` then restart tmux: `tmux kill-server && tmux`

### "I'm lost in tmux!"
→ Press `Ctrl+Space ?` to see all keybindings
→ Press `q` to exit help
→ Press `Ctrl+Space d` to detach and start fresh

## 🎓 Next Steps

1. **Practice the basics** - Use tmux for a day, muscle memory will develop
2. **Customize** - Edit `~/Documents/DEV/dotfiles/tmux/keymaps.conf` to change keybindings
3. **Learn sessions** - Create different sessions for different projects
4. **Master copy mode** - Practice navigating and copying text
5. **Read the full README** - Check `tmux/README.md` for complete documentation

## 📚 Cheat Sheet

```bash
# Outside tmux
tmux                          # Start new session
tmux new -s name             # Start named session
tmux ls                      # List sessions
tmux attach -t name          # Attach to session
tmux kill-session -t name    # Kill session
tmux kill-server             # Kill all sessions

# Inside tmux (prefix = Ctrl+Space)
prefix |        Split vertical
prefix -        Split horizontal
prefix c        New window
prefix ,        Rename window
prefix &        Kill window
prefix x        Kill pane
prefix d        Detach
prefix ?        Help
prefix :        Command mode

# No prefix needed
Shift+Left/Right    Navigate windows
Alt+1/2/3/4/5       Jump to window
Alt+Arrow keys      Resize panes
Ctrl+h/j/k/l        Navigate panes
```

## 🚀 Pro Tips

1. **Name your sessions** - `tmux new -s project-name` makes it easy to find later
2. **Use window names** - `Ctrl+Space ,` to rename, organize by purpose
3. **Detach often** - Sessions persist, use them like saved workspaces
4. **Don't nest** - Detach before starting tmux in tmux
5. **Pair with vim** - `Ctrl+h/j/k/l` works seamlessly between vim and tmux!

---

**Ready? Start tmux and try Exercise 1!** 🎉
