# Configuration Summary

**Last Updated**: October 25, 2025

Complete overview of this Cursor-style AI-powered Neovim configuration.

## 🎯 Configuration Goals

This Neovim setup replicates Cursor IDE's best features:
- ✅ AI chat with diff mode for reviewing changes
- ✅ Line-by-line code suggestions (Tab to accept)
- ✅ Multi-cursor editing
- ✅ Interactive LSP rename with live preview
- ✅ VSCode-style line moving
- ✅ Git-aware file navigation
- ✅ Modern, beautiful UI

## 📦 Core Features

### 🤖 AI Integration

**Avante.nvim** - Cursor-style AI assistant
- **Providers**: Claude (Anthropic API), Copilot (GitHub Models)
- **Default**: Copilot with GPT-4o
- **Key Feature**: Diff mode - review changes before applying
- **Keybinding**: `<leader>aa` to toggle chat
- **Protection**: Prevents opening in Oil (file browser) buffers

**GitHub Copilot**
- **Tab Behavior**: Accept one line at a time (Cursor-style)
- **Ctrl+Tab**: Accept entire multi-line suggestion
- **Limit**: Maximum 5 lines per suggestion
- **Auto-trigger**: Suggestions appear as you type

### ⚡ Modern Editing

**Multi-Cursor** (vim-visual-multi)
- `<leader>md` - Select next occurrence
- `<leader>ma` - Select all occurrences
- `<leader>mk` - Skip current, select next
- `Ctrl+j/k` - Navigate between cursors
- `Option+Shift+Up/Down` - Add cursor above/below

**Interactive Rename** (inc-rename.nvim)
- `<leader>rn` - Shows live preview of all renames
- Real-time feedback as you type
- Works across entire workspace

**Line Moving** (VSCode-style)
- `Option+Up` - Move line/selection up
- `Option+Down` - Move line/selection down
- Auto-indents after moving
- Preserves selection in visual mode

### 🎨 UI & Appearance

**Theme**: TokyoNight with multiple variants
**Statusline**: Lualine showing git, LSP, file info
**Buffer Tabs**: Bufferline with diagnostics
**Color Preview**: Hex, RGB, HSL, Tailwind colors
**Indentation**: Visual guides with scope highlighting

### 🌿 Git Integration

**Gitsigns.nvim**
- Visual indicators in sign column
- Hunk navigation: `]c` / `[c`
- Stage/reset: `<leader>hs` / `<leader>hr`
- Blame: `<leader>hb`
- Preview: `<leader>hp`

**Telescope Git**
- `<leader>gs` - Git status (changed files only)
- `<leader>gf` - Git files (all tracked files)
- `<leader>gc` - Git commits
- `<leader>gb` - Git branches

### 📝 LSP & Completion

**Language Servers** (auto-installed via Mason)
- TypeScript/JavaScript (vtsls)
- HTML, CSS, Tailwind CSS
- ESLint, JSON, YAML
- Lua (optimized for Neovim)

**Completion** (nvim-cmp)
- Smart Tab: Copilot → completion → snippet
- Sources: LSP, buffer, path, snippets
- Integrates with LuaSnip

**Navigation**
- `gd` - Go to definition
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<leader>ca` - Code actions

## 🗂️ File Structure

```
dotfiles/
├── README.md                    # Main overview
├── QUICK-START.md               # Quick start guide
└── nvim/
    ├── README.md                # Neovim overview
    ├── KEYMAPS.md               # Complete keymap reference
    ├── init.lua                 # Entry point
    ├── lazy-lock.json           # Plugin versions
    ├── scripts/
    │   ├── README.md            # Node.js isolation docs
    │   ├── copilot-node         # Copilot Node wrapper
    │   └── nvim-make            # Make wrapper
    └── lua/
        ├── core/
        │   ├── README.md        # Core config docs
        │   ├── bootstrap.lua    # Plugin manager
        │   ├── keymaps.lua      # Global keymaps
        │   ├── options.lua      # Neovim settings
        │   ├── utils.lua        # Helper functions
        │   ├── autocommands.lua # Auto commands
        │   └── coffeescript.lua # CoffeeScript support
        └── plugins/
            ├── README.md        # Plugin docs
            ├── avante.lua       # AI chat
            ├── copilot.lua      # GitHub Copilot
            ├── cmp.lua          # Completion
            ├── lsp.lua          # LSP servers
            ├── inc-rename.lua   # Interactive rename
            ├── multicursor.lua  # Multi-cursor
            ├── telescope.lua    # Fuzzy finder
            ├── oil.lua          # File explorer
            ├── gitsigns.lua     # Git signs
            └── ... (20+ more plugins)
```

## 🔑 Keymap Organization

**Namespaces**:
- `<leader>a*` - **A**vante AI operations
- `<leader>m*` - **M**ulti-cursor operations
- `<leader>h*` - Git **h**unk operations
- `<leader>g*` - **G**it navigation
- `<leader>f*` - **F**ind (Telescope)
- `<leader>p*` - **P**ane/split management
- `<leader>w*` - **W**indow resizing
- `<leader>b*` - **B**uffer management
- `<leader>c*` - **C**ursor-style / CoffeeScript
- `<leader>t*` - **T**oggles

**No Conflicts**: All keymaps reviewed and organized to avoid conflicts.

## 🛠️ Node.js Isolation

**Problem**: Legacy projects with `.nvmrc` files break Copilot/Avante.

**Solution**: Wrapper scripts ensure plugins always use Node 22+.

**Scripts**:
- `scripts/copilot-node` - Forces Node 22 for Copilot
- `scripts/nvim-make` - Forces Node 22 for build commands

**How It Works**:
1. Load NVM
2. Switch to Node 22 (ignoring project .nvmrc)
3. Execute command
4. Project's Node version remains unchanged

## 📋 Plugin List (30+ plugins)

### AI & Code Assistance
- avante.nvim, copilot.lua

### LSP & Completion
- nvim-lspconfig, mason.nvim, nvim-cmp, LuaSnip, inc-rename.nvim

### Editor Enhancement
- vim-visual-multi, telescope.nvim, oil.nvim, flash.nvim, nvim-spectre

### UI & Appearance
- tokyonight.nvim, lualine.nvim, bufferline.nvim, nvim-highlight-colors, indent-blankline.nvim

### Git Integration
- gitsigns.nvim

### Code Editing
- nvim-treesitter, nvim-autopairs, nvim-ts-autotag, Comment.nvim, mini.surround, vim-matchup

### Utilities
- todo-comments.nvim, which-key.nvim, lazydev.nvim, fidget.nvim

### Language-Specific
- vim-coffee-script

## 🎓 Key Concepts

### Lazy Loading
Plugins load on-demand (events, commands, filetypes) for fast startup.

### LSP Integration
Language servers provide IDE features: completion, go-to-definition, diagnostics, refactoring.

### Treesitter
Advanced syntax highlighting and code understanding beyond regex.

### Telescope
Fuzzy finder for files, buffers, git, LSP - with live preview.

### Which-Key
Shows available keybindings after pressing leader key.

## ⚙️ Configuration Highlights

### Smart Tab Behavior
1. If Copilot suggestion visible → Accept one line
2. Else if completion menu open → Next item
3. Else if in snippet → Jump to next placeholder
4. Else → Default Tab behavior

### Avante Oil Protection
- Checks for Oil buffers before opening Avante
- Shows warning if attempting to open in directory view
- Prevents serialization errors from binary-like content

### Node.js PATH Modification
- Prepends wrapper script directory to `vim.env.PATH`
- Ensures Avante's internal Node processes use correct version
- Transparent to user - no manual switching required

### Git-Aware Navigation
- `<leader>gs` - Only shows changed/staged/untracked files
- `<leader>gf` - Shows all git-tracked files (respects .gitignore)
- Faster than browsing file tree for large projects

## 🚀 Performance

**Optimizations**:
- Disabled built-in plugins (netrw, matchit, etc.)
- Lazy-loaded plugins (only load when needed)
- Treesitter compiled parsers
- Mason cached LSP installations
- Oil.nvim instead of netrw (faster)

**Startup Time**: ~50-80ms (with all plugins)

## 📖 Documentation

All documentation is in Markdown and co-located with code:

1. **README.md** (root) - Overview and highlights
2. **QUICK-START.md** - Installation and first steps
3. **nvim/README.md** - Full Neovim config overview
4. **nvim/KEYMAPS.md** - Complete keymap reference (500+ lines)
5. **nvim/lua/core/README.md** - Core config and options
6. **nvim/lua/plugins/README.md** - Plugin documentation
7. **nvim/scripts/README.md** - Node.js isolation guide

## 🔄 Update History

### October 25, 2025
- ✅ Added Avante AI chat with diff mode
- ✅ Integrated GitHub Copilot with line-by-line acceptance
- ✅ Added multi-cursor editing (vim-visual-multi)
- ✅ Added interactive LSP rename (inc-rename.nvim)
- ✅ Added VSCode-style line moving (Option+Up/Down)
- ✅ Added git-aware Telescope navigation
- ✅ Implemented Node.js isolation for legacy projects
- ✅ Resolved all keymap conflicts
- ✅ Created comprehensive documentation
- ✅ Optimized Avante to prevent auto-scanning workspace
- ✅ Changed Avante loading to lazy (cmd-triggered)
- ✅ Added provider/model switching keymaps
- ✅ Set Copilot as default provider with GPT-4o

## 🎯 Design Philosophy

1. **Cursor-style Experience**: Replicate Cursor IDE's best features
2. **No Conflicts**: All keymaps organized by namespace
3. **Legacy Support**: Works with old Node.js projects
4. **Documentation**: Everything is documented
5. **Performance**: Fast startup, lazy loading
6. **Modularity**: One file per plugin, easy to disable
7. **Sensible Defaults**: Works great out of the box
8. **Extensibility**: Easy to customize and extend

## 🎉 Result

A modern, AI-powered Neovim configuration that:
- Feels like Cursor IDE
- Works with any project (even legacy)
- Loads fast (~50ms)
- Is fully documented
- Has zero keymap conflicts
- Provides IDE-level features
- Looks beautiful
- Is easy to customize

**Perfect for developers who want Cursor's AI features in Neovim!** ✨

---

*For questions or issues, refer to the README files in each directory.*

