# Avante AI Setup - Quick Reference

## ✅ Working Configuration

Your Avante setup now includes:

### Core Features
- **Diff Mode**: AI suggestions show as diffs, NOT auto-applied
- **Provider**: Claude 3.5 Sonnet (claude-3-5-sonnet-20241022)
- **Node.js Isolation**: Uses Node 22+ via wrapper scripts (works in legacy projects)
- **Oil Buffer Protection**: Prevents errors when opening Avante in directory views

### Key Keymaps

| Keymap | Action |
|--------|--------|
| `<leader>aa` | Toggle Avante Chat (normal & visual mode) |
| `<leader>ae` | Edit selected code with AI (normal & visual) |
| `<leader>ar` | Refresh Avante chat |
| `<leader>ap` | Switch AI Provider (Claude/Copilot/etc.) |
| `<leader>af` | Toggle File Tree (if it appears) |
| `<leader>ac` | Clear chat history |

#### Diff Navigation (when viewing AI suggestions)
| Keymap | Action |
|--------|--------|
| `co` | Choose Ours (reject AI change) |
| `ct` | Choose Theirs (accept AI change) |
| `ca` | Accept All AI changes |
| `c0` | Reject All AI changes |
| `cb` | Keep Both |
| `]x` | Next conflict |
| `[x` | Previous conflict |

### Usage Workflow

1. **Open a specific file**: `nvim path/to/file.js`
   - ⚠️ Do NOT use `nvim .` (Oil buffer causes issues)
   
2. **Start chat**: Press `<leader>aa`

3. **Ask for changes**: Type your request in the chat

4. **Review diff**: AI suggestions appear as diffs in your file

5. **Accept/Reject**: Use `ct` (accept), `co` (reject), or other diff keymaps

6. **Add more files** (optional): Press `Ctrl+F` in Avante to manually select files

### Configuration Files

- **Avante**: `nvim/lua/plugins/avante.lua`
- **Keymaps**: `nvim/lua/core/keymaps.lua`
- **Copilot**: `nvim/lua/plugins/copilot.lua`
- **Completion**: `nvim/lua/plugins/cmp.lua`
- **Node Wrappers**: `scripts/copilot-node`, `scripts/nvim-make`

### Troubleshooting

**If Avante shows a file tree in sidebar:**
- This was fixed by using minimal configuration
- If it returns, run: `rm -rf ~/.local/share/nvim/avante/ ~/.cache/nvim/*avante*`

**If you get serialization errors:**
- Make sure you're NOT in an Oil buffer (`nvim .`)
- Open a specific file first: `nvim somefile.js`
- The keymap guard will warn you if trying to open in Oil

**If Node version conflicts occur:**
- The wrapper scripts (`copilot-node`, `nvim-make`) force Node 22+
- Legacy project `.nvmrc` files won't affect Neovim plugins
- Your terminal still respects `.nvmrc` for actual development

### Why This Setup Works

1. **Minimal Config**: Only essential settings, no extra features that cause issues
2. **Node Isolation**: Plugins use Node 22 regardless of project Node version
3. **Oil Guards**: Explicit checks prevent opening Avante in directory buffers
4. **Clean UI**: No automatic file scanning or repo maps cluttering the interface

## Next Steps

Your setup is now **Cursor-like** with:
- ✅ AI chat with diff confirmation (Avante)
- ✅ Inline code suggestions (Copilot)
- ✅ Tab cycling through suggestions
- ✅ LSP-powered renaming (inc-rename)
- ✅ Multi-cursor editing (vim-visual-multi)

Enjoy your AI-powered Neovim! 🚀

