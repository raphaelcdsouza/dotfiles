# Node.js Version Management for Neovim Plugins

## Problem

When working with legacy projects that have `.nvmrc` files specifying older Node versions (e.g., Node 14, 16), Neovim plugins like **Copilot** and **Avante** fail because they require Node.js ≥ 18.

### The Issue:
```bash
# You're in Neovim config with Node 22
node --version  # v22.x.x ✓

# You cd into a legacy project
cd ~/projects/legacy-app

# .nvmrc auto-switches to Node 14
node --version  # v14.x.x ❌

# Copilot breaks! Avante breaks!
```

---

## Solution: Node.js Wrapper Scripts

We created **wrapper scripts** that force Neovim plugins to always use Node 22+, regardless of your project's Node version.

### Architecture:

```
┌─────────────────┐
│  Neovim Plugins │
│  (Copilot,      │
│   Avante, etc)  │
└────────┬────────┘
         │
         ├─ copilot_node_command
         │  └─> ~/.config/nvim/scripts/copilot-node
         │
         └─ build command
            └─> ~/.config/nvim/scripts/nvim-make
                    │
                    ├─ Loads NVM
                    ├─ Forces Node 22
                    └─ Executes command
```

---

## Files Created

### 1. `scripts/copilot-node`
- **Purpose**: Node wrapper for Copilot
- **What it does**: Forces Node 22 for Copilot's language server
- **Used by**: `copilot.lua` plugin

### 2. `scripts/nvim-make`
- **Purpose**: Make wrapper that uses Node 22
- **What it does**: Ensures build scripts use correct Node version
- **Used by**: `avante.lua` and any plugin with `build = "make"`

### 3. `scripts/nvim-npm`
- **Purpose**: NPM wrapper for plugins
- **What it does**: Forces Node 22 for npm operations
- **Used by**: Any plugin that needs npm during installation

---

## How It Works

### Example: Copilot

**Before (Broken):**
```lua
-- copilot.lua
return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      -- Uses system 'node' command
      -- ❌ Breaks if project has Node 14
    })
  end,
}
```

**After (Fixed):**
```lua
-- copilot.lua
return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      -- Uses our wrapper script
      copilot_node_command = vim.fn.expand('~/.config/nvim/scripts/copilot-node'),
      -- ✅ Always uses Node 22, ignores .nvmrc
    })
  end,
}
```

### Example: Avante

**Before (Broken):**
```lua
-- avante.lua
return {
  "yetone/avante.nvim",
  build = "make",  -- ❌ Uses system Node (might be v14)
}
```

**After (Fixed):**
```lua
-- avante.lua
return {
  "yetone/avante.nvim",
  build = vim.fn.expand('~/.config/nvim/scripts/nvim-make'),
  -- ✅ Uses wrapper that forces Node 22
}
```

---

## Testing the Solution

### Test 1: Verify wrappers work
```bash
# From your config directory
~/.config/nvim/scripts/copilot-node --version
# Should output: v22.x.x

~/.config/nvim/scripts/nvim-make --version
# Should output make version (using Node 22 in PATH)
```

### Test 2: Test in legacy project
```bash
# Switch to a legacy project
cd ~/projects/legacy-node-14-app

# Verify project Node is old
node --version  # v14.x.x

# Open Neovim
nvim

# Check if Copilot works
:Copilot status
# Should show: Ready ✓

# Check if Avante works
# Open Avante chat, should work normally
```

---

## Troubleshooting

### Issue: "nvm: command not found"

**Cause**: NVM not installed or not in expected location

**Fix**: 
1. Verify NVM installation:
   ```bash
   ls -la ~/.nvm/nvm.sh
   ```
2. If missing, install NVM:
   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
   ```
3. Restart your terminal

---

### Issue: "Node 22 not installed"

**Cause**: Node 22 not available via NVM

**Fix**:
```bash
nvm install 22
nvm alias default 22
```

---

### Issue: Plugins still breaking

**Cause**: Wrapper scripts not executable

**Fix**:
```bash
chmod +x ~/.config/nvim/scripts/copilot-node
chmod +x ~/.config/nvim/scripts/nvim-make
chmod +x ~/.config/nvim/scripts/nvim-npm
```

---

### Issue: Want to use different Node version

**Solution**: Edit the wrapper scripts and change `nvm use 22` to your preferred version:

```bash
# Edit copilot-node
nvim ~/.config/nvim/scripts/copilot-node

# Change line:
nvm use 22    # Change to: nvm use 20
```

---

## Benefits

✅ **Project Independence**: Your project's `.nvmrc` doesn't affect Neovim plugins  
✅ **No Manual Switching**: No need to switch Node versions for Neovim  
✅ **Future-Proof**: Easy to update Node version for all plugins  
✅ **Clean Separation**: Development Node ≠ Neovim Node  

---

## Architecture Diagram

```
┌─────────────────────────────────────────────────────┐
│           Your Development Environment              │
├─────────────────────────────────────────────────────┤
│                                                     │
│  Legacy Project A      Modern Project B            │
│  └─ .nvmrc (v14)      └─ .nvmrc (v22)             │
│      │                    │                         │
│      ├─ Shell: Node 14   ├─ Shell: Node 22        │
│      │                    │                         │
│      ├─ npm: v14          ├─ npm: v22              │
│      │                    │                         │
│      └─ Neovim            └─ Neovim                 │
│          │                    │                     │
│          └────────┬───────────┘                     │
│                   │                                 │
│            ┌──────▼──────┐                         │
│            │   Wrappers  │                         │
│            │  (Always    │                         │
│            │   Node 22)  │                         │
│            └──────┬──────┘                         │
│                   │                                 │
│            ┌──────▼──────┐                         │
│            │   Copilot   │                         │
│            │   Avante    │                         │
│            │   etc.      │                         │
│            └─────────────┘                         │
│                                                     │
└─────────────────────────────────────────────────────┘
```

---

## Summary

Your Neovim plugins now use **isolated Node.js environments** that:
- Always run with Node 22+
- Ignore project `.nvmrc` files
- Work seamlessly across all your projects
- Require zero manual intervention

**You can now work on Node 14 projects without breaking your editor tools!** 🎉

