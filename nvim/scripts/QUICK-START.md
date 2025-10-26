# Neovim AI Setup - Complete Reference

**Last Updated:** October 25, 2025

This document summarizes your complete AI-powered Neovim configuration with Cursor-style workflows.

---

## 🎯 Quick Start Guide

### **AI Inline Completions (Copilot)**

1. Start typing → Ghost text appears
2. **Tab** → Accept one line at a time (Cursor-style!)
3. **Ctrl+Tab** → Accept entire suggestion
4. **Alt+]** / **Alt+[** → Cycle through alternative suggestions
5. **Ctrl+]** → Dismiss suggestion

### **AI Chat & Refactoring (Avante)**

1. Open Avante chat (your configured keymap)
2. Ask for code changes: "Refactor this function to use async/await"
3. Review the **diff preview** 
4. **ct** → Accept AI changes (theirs)
5. **co** → Keep your code (ours)
6. **ca** → Accept all changes
7. **]x** / **[x** → Navigate between conflicts

### **Multi-Cursor Editing**

1. Place cursor on a word/variable
2. **Ctrl+d** → Select next occurrence
3. **Ctrl+d** again → Add more cursors
4. **Ctrl+Shift+l** → Select ALL occurrences
5. **Tab** / **Shift+Tab** → Jump between cursors
6. **c** → Start editing all at once

### **Smart Rename**

1. Place cursor on variable/function
2. **<leader>rn** → Start interactive rename
3. Type new name (see live preview!)
4. **Enter** → Apply to all references

### **Quick Edit Workflow**

1. Edit first occurrence of a pattern
2. **<leader>cn** → Jump to next + auto-enter append mode
3. Type or Tab (Copilot learns from first edit!)

---

## 📋 Complete Keymap Reference

### **Copilot Suggestions**

| Key | Action |
|-----|--------|
| `Tab` | Accept one line (Cursor-style) |
| `Ctrl+Tab` | Accept entire suggestion |
| `Alt+]` | Next alternative |
| `Alt+[` | Previous alternative |
| `Ctrl+]` | Dismiss |
| `Alt+Enter` | Open Copilot panel |

### **Avante Chat (Diff Mode)**

| Key | Action |
|-----|--------|
| `ct` | Accept AI suggestion (theirs) |
| `co` | Keep your code (ours) |
| `ca` | Accept all AI changes |
| `cb` | Keep both versions |
| `cc` | Cursor selection |
| `]x` | Next conflict |
| `[x` | Previous conflict |

### **Multi-Cursor (vim-visual-multi)**

| Key | Action |
|-----|--------|
| `Ctrl+d` | Select next occurrence |
| `Ctrl+k` | Skip current, select next |
| `Ctrl+Shift+k` | Remove last selection |
| `Ctrl+Shift+l` | Select ALL occurrences |
| `Tab` | Jump to next cursor |
| `Shift+Tab` | Jump to previous cursor |
| `c` | Change/edit mode |
| `Esc` | Exit multi-cursor |

### **LSP & Refactoring**

| Key | Action |
|-----|--------|
| `<leader>rn` | Interactive rename (inc-rename) |
| `<leader>ca` | Code actions |
| `gd` | Go to definition |
| `gr` | Show references |
| `K` | Hover documentation |

### **Custom Workflows**

| Key | Action |
|-----|--------|
| `<leader>cn` | Jump to next occurrence + append |

---

## 🛠️ Technical Setup

### **Node.js Version Isolation**

Your plugins use Node 22+ regardless of project `.nvmrc`:

- **Scripts Location:** `~/.config/nvim/scripts/`
  - `copilot-node` → Node wrapper for Copilot
  - `nvim-make` → Make wrapper for Avante
  - `nvim-npm` → NPM wrapper for plugins

**How it works:**
- Project: Can use Node 14, 16, 18, etc.
- Neovim plugins: Always use Node 22 via wrappers
- No conflicts! 🎉

### **Plugin Configuration Files**

- **Copilot:** `nvim/lua/plugins/copilot.lua`
- **Avante:** `nvim/lua/plugins/avante.lua`
- **CMP (completions):** `nvim/lua/plugins/cmp.lua`
- **Multi-cursor:** `nvim/lua/plugins/multicursor.lua`
- **Rename:** `nvim/lua/plugins/inc-rename.lua`
- **Keymaps:** `nvim/lua/core/keymaps.lua`

---

## 📊 Comparison: Cursor vs Your Setup

| Feature | Cursor IDE | Your Neovim | Notes |
|---------|-----------|-------------|-------|
| **Inline AI** | ✅ | ✅ Copilot | Tab = line-by-line |
| **AI Chat** | ✅ | ✅ Avante | Claude-powered |
| **Diff approval** | ✅ | ✅ | ct/co keymaps |
| **Multi-cursor** | ✅ | ✅ | Ctrl+d workflow |
| **Smart rename** | ✅ | ✅ | LSP + inc-rename |
| **Cross-file edits** | ✅ | ✅ Avante | Via chat |
| **Auto Tab jumping** | ✅ | ⚠️ Manual | Use Ctrl+d instead |

---

## 🎬 Real-World Examples

### **Example 1: Add Class to Multiple Divs**

```html
<div class="container">
<div class="container inner-box">
```

**Workflow:**
1. `/class="container` → Search
2. `Ctrl+d` → Select first
3. `n` then `Ctrl+d` → Select second
4. `ea` → Go to end, append mode
5. Type ` flex-col` → Applies to both!

---

### **Example 2: Rename Variable Across Files**

```javascript
// utils.js
export const fetchUser = () => {...}

// main.js  
import { fetchUser } from './utils'
```

**Workflow:**
1. Cursor on `fetchUser`
2. `<leader>rn`
3. Type `getUserData`
4. Enter → Updates both files!

---

### **Example 3: Refactor with AI**

**Workflow:**
1. Select code (visual mode)
2. Open Avante chat
3. Say: "Add error handling and TypeScript types"
4. Review diff
5. `ct` to accept or `co` to reject

---

## 🐛 Troubleshooting

### **Copilot Issues**
- Check: `:Copilot status`
- Restart: `:Copilot restart`
- Logs: `:messages`
- See: `scripts/TROUBLESHOOTING.md`

### **Avante Issues**
- Rebuild: `:Lazy clean avante.nvim` then `:Lazy install`
- See: `scripts/FIX-AVANTE.md`

### **Node Version Issues**
- Test wrapper: `~/.config/nvim/scripts/copilot-node --version`
- Should show: `v22.x.x` (regardless of project Node)
- See: `scripts/README.md`

---

## 📚 Documentation

- **Main Setup:** `scripts/README.md`
- **Troubleshooting:** `scripts/TROUBLESHOOTING.md`
- **Avante Fixes:** `scripts/FIX-AVANTE.md`
- **This Guide:** `scripts/QUICK-START.md`

---

## 🚀 What Makes This Setup Special

1. ✅ **Cursor-style Tab acceptance** - Line-by-line, not all-at-once
2. ✅ **Node isolation** - Legacy projects don't break your editor
3. ✅ **Diff approval mode** - Never auto-applies AI changes
4. ✅ **No conflicts** - Copilot + Avante work together seamlessly
5. ✅ **Powerful multi-cursor** - Better than most IDEs
6. ✅ **LSP-aware renaming** - Smarter than text search
7. ✅ **Fully documented** - Every feature explained

---

## 💡 Pro Tips

1. **Tab is your friend** - Line-by-line for control, Ctrl+Tab for speed
2. **Multi-cursor for similar patterns** - Ctrl+d is faster than AI chat
3. **Avante for complex refactoring** - Let AI handle the heavy lifting
4. **<leader>cn for quick edits** - Jump and edit in one keystroke
5. **LSP rename for variables** - Scope-aware, cross-file safe

---

**Enjoy your AI-powered Neovim setup! 🎉**

For questions or issues, refer to the documentation in `scripts/` directory.

