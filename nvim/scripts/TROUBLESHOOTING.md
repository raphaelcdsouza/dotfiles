# Troubleshooting Copilot Node.js Issues

## Quick Fix Steps

### 1. Test the wrapper script directly
```bash
~/.config/nvim/scripts/copilot-node --version
```
**Expected output:** `v22.x.x`

If this fails, check:
- Is NVM installed? `ls -la ~/.nvm/nvm.sh`
- Is Node 22 installed? `nvm list`
- Is the script executable? `ls -la ~/.config/nvim/scripts/copilot-node`

---

### 2. Restart Copilot in Neovim
Open Neovim and run:
```vim
:Copilot restart
```

Then check status:
```vim
:Copilot status
```

**Expected:** `Ready` or `Online`

---

### 3. Force reinstall Copilot
If restart doesn't work, fully reinstall:
```vim
:Lazy clean copilot.lua
:Lazy install copilot.lua
:Copilot auth
```

---

### 4. Check Copilot logs
If still having issues, check the logs:
```vim
:messages
```

Or check Copilot's log file:
```bash
tail -f ~/.local/state/nvim/copilot.log
```

---

## Common Errors and Fixes

### Error: "Could not determine Node.js version (exit code -1)"

**Cause:** Wrapper script not executable or NVM not loading correctly

**Fix:**
```bash
# Make sure script is executable
chmod +x ~/.config/nvim/scripts/copilot-node

# Test it directly
~/.config/nvim/scripts/copilot-node --version

# If that works, restart Neovim entirely
```

---

### Error: "nvm: command not found" in wrapper

**Cause:** NVM not installed or in wrong location

**Fix:**
```bash
# Check if NVM exists
ls -la ~/.nvm/nvm.sh

# If missing, install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Source it and install Node 22
source ~/.nvm/nvm.sh
nvm install 22
```

---

### Error: Copilot works in some projects but not others

**Cause:** This is exactly what the wrapper is supposed to fix!

**Verify wrapper is being used:**
```vim
:lua print(vim.g.copilot_node_command or require('copilot.config').get().copilot_node_command)
```

**Expected output:** `~/.config/nvim/scripts/copilot-node` (expanded path)

---

## Testing the Full Setup

### Test in a legacy Node project:
```bash
# 1. Go to legacy project
cd ~/projects/old-node-14-project

# 2. Verify old Node is active
node --version  # Should show v14.x.x or similar

# 3. Verify wrapper uses Node 22
~/.config/nvim/scripts/copilot-node --version  # Should show v22.x.x

# 4. Open Neovim
nvim test.js

# 5. In Neovim, check Copilot
:Copilot status  # Should show "Ready"

# 6. Try to get a suggestion
# Type some code and see if ghost text appears
```

---

## Nuclear Option: Full Reset

If nothing works, do a complete reset:

```bash
# 1. Remove all Copilot data
rm -rf ~/.local/share/nvim/lazy/copilot.lua
rm -rf ~/.local/state/nvim/copilot*
rm -rf ~/.config/github-copilot

# 2. Restart Neovim
nvim

# 3. Reinstall Copilot
:Lazy install copilot.lua

# 4. Authenticate
:Copilot auth

# 5. Check status
:Copilot status
```

---

## Debugging Commands

### Check what Node Copilot is seeing:
```vim
:lua print(vim.fn.system(vim.fn.expand('~/.config/nvim/scripts/copilot-node') .. ' --version'))
```

### Check Copilot config:
```vim
:lua print(vim.inspect(require('copilot.config').get()))
```

### Enable verbose logging:
Add to your `copilot.lua`:
```lua
require("copilot").setup({
  copilot_node_command = vim.fn.expand('~/.config/nvim/scripts/copilot-node'),
  server_opts_overrides = {
    trace = "verbose",  -- Enable verbose logging
  },
})
```

---

## Still Having Issues?

1. Check that your config in `~/Documents/DEV/dotfiles/nvim/lua/plugins/copilot.lua` matches `~/.config/nvim/lua/plugins/copilot.lua`

2. Verify the symlink/sync is working:
   ```bash
   diff ~/Documents/DEV/dotfiles/nvim/lua/plugins/copilot.lua ~/.config/nvim/lua/plugins/copilot.lua
   ```

3. Test the wrapper in isolation:
   ```bash
   bash -x ~/.config/nvim/scripts/copilot-node --version
   # The -x flag shows debug output
   ```

