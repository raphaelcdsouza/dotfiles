# Neovim Configuration

Cursor-style AI-powered Neovim configuration using Lua.

## ✨ Highlights

### 🤖 AI-Powered Development
- **Avante AI Chat** - Cursor-style AI assistant with diff mode for code review
  - Toggle between Claude and Copilot (GitHub Models)
  - Show diffs before applying changes
  - Chat with AI about your code
  - Default: Copilot with GPT-4o
  
- **GitHub Copilot** - Inline code suggestions
  - Tab to accept line-by-line (Cursor-style)
  - Ctrl+Tab to accept entire suggestion
  - Auto-completes as you type
  
### ⚡ Modern Editing Features
- **Multi-cursor editing** - Select and edit multiple occurrences (`<leader>md`)
- **VSCode-style line moving** - `Option+↑/↓` to swap lines
- **Interactive LSP rename** - Live preview of symbol renames (`<leader>rn`)
- **Smart completions** - Context-aware autocompletion with LSP
- **Project-wide search** - Find and replace across codebase (Spectre)

### 🎨 Beautiful UI
- TokyoNight theme with multiple variants
- Statusline showing git status, LSP diagnostics, and file info
- Color preview for hex, RGB, HSL, and Tailwind colors
- Indentation guides with scope highlighting
- Buffer tabs with diagnostics

## Directory Structure

```
.
├── init.lua                 # Main entry point
├── KEYMAPS.md               # Complete keybindings reference
├── lazy-lock.json           # Plugin version lockfile
├── scripts/                 # Node.js wrapper scripts
│   ├── copilot-node        # Copilot Node wrapper
│   ├── nvim-make           # Make wrapper for plugins
│   └── README.md           # Node isolation documentation
└── lua/
    ├── core/                # Core configuration
    │   ├── autocommands.lua # Automatic commands
    │   ├── bootstrap.lua    # Plugin manager bootstrap
    │   ├── coffeescript.lua # CoffeeScript support
    │   ├── keymaps.lua      # Global keybindings
    │   ├── options.lua      # Neovim options and settings
    │   ├── utils.lua        # Utility functions
    │   └── README.md        # Core configuration docs
    └── plugins/             # Plugin configurations
        ├── avante.lua       # AI chat assistant (Cursor-style)
        ├── copilot.lua      # GitHub Copilot integration
        ├── cmp.lua          # Autocompletion
        ├── lsp.lua          # LSP server configuration
        ├── inc-rename.lua   # Interactive LSP rename
        ├── multicursor.lua  # Multi-cursor support
        ├── telescope.lua    # Fuzzy finder
        ├── gitsigns.lua     # Git integration
        ├── oil.lua          # File explorer
        ├── spectre.lua      # Search and replace
        ├── treesitter.lua   # Syntax highlighting
        ├── tmux-navigator.lua # Seamless tmux/vim navigation
        ├── autopairs.lua    # Auto-pairing brackets
        ├── autotag.lua      # Auto-close HTML tags
        ├── bufferline.lua   # Buffer tabs
        ├── colorizer.lua    # Color preview
        ├── comment.lua      # Smart commenting
        ├── flash.lua        # Fast movement
        ├── indent-blankline.lua # Indentation guides
        ├── lualine.lua      # Statusline
        ├── matchup.lua      # Bracket matching
        ├── surround.lua     # Surround operations
        ├── todo-comments.lua # TODO highlighting
        ├── tokionight.lua   # Theme
        └── whichkey.lua     # Keybinding hints
```

## Documentation

- **[KEYMAPS.md](KEYMAPS.md)** - Complete list of all keybindings by category
- **[Core Configuration](lua/core/README.md)** - Neovim options and settings reference
- **[Node.js Scripts](scripts/README.md)** - Node version isolation for plugins

## Plugins

This configuration includes the following plugins:

### 🤖 AI & Code Assistance

- **[Avante.nvim](https://github.com/yetone/avante.nvim)** - Cursor-style AI chat assistant
  - **Providers**: Claude (Anthropic API), Copilot (GitHub Models)
  - **Models**: Claude 4.5 Sonnet, GPT-4o, and more
  - **Features**: Diff mode, code editing, chat interface
  - **Keybindings**: `<leader>aa` (toggle chat), `<leader>ae` (edit), `<leader>ap` (switch provider)
  - **Diff Controls**: `co` (ours), `ct` (theirs), `ca` (accept all), `c0` (reject all)
  - Node.js isolation for legacy project compatibility
  
- **[Copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot integration
  - **Tab behavior**: Accept one line at a time (Cursor-style)
  - **Ctrl+Tab**: Accept entire suggestion
  - **Alt+]** / **Alt+[**: Cycle through alternative suggestions
  - Limited to 5 lines max per suggestion
  - Node.js isolation for legacy project compatibility

### Language Support

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP client configurations for multiple languages
  - **Language Servers**: TypeScript/JavaScript (vtsls), HTML, CSS, Tailwind CSS, ESLint, JSON, YAML, Lua
  - **Keybindings**: `gd` (definition), `gr` (references), `K` (hover), `<leader>ca` (code action), `<leader>rn` (rename), `[d`/`]d` (diagnostics)
  - Custom diagnostic signs and rounded borders
  - Inlay hints for TypeScript/JavaScript
  - Enhanced Tailwind CSS support with cva(), cx(), clsx() utilities and Vue/Svelte support
- **[Mason](https://github.com/williamboman/mason.nvim)** - LSP server installer and manager
  - Automatic installation of configured language servers
  - Rounded border UI with custom icons
- **[lazydev.nvim](https://github.com/folke/lazydev.nvim)** - Neovim Lua development support (modern neodev replacement)
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)** - LSP progress notifications
- **[schemastore.nvim](https://github.com/b0o/schemastore.nvim)** - JSON/YAML schema support
- **[vim-coffee-script](https://github.com/kchmck/vim-coffee-script)** - CoffeeScript syntax highlighting and support
  - Auto-compile on save with error notifications
  - **Keybindings**: `<leader>cc` (compile), `<leader>cj` (show JS), `<leader>cr` (run), `<leader>cl` (lint)

### Completion & Snippets

- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion engine
  - Sources: LSP, buffer, path, snippets
  - Tab/S-Tab navigation and snippet jumping
  - Integrates with LSP for intelligent completions
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine with friendly-snippets library

### Editor Enhancement

- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless navigation between vim splits and tmux panes
  - **Keybindings**: `Ctrl+h/j/k/l` - Navigate between vim splits and tmux panes without thinking
  - Automatically detects whether you're at vim or tmux boundary
  - Works bidirectionally - navigate from vim to tmux and back
  - Must be used with tmux plugin: See [tmux configuration](../tmux/README.md)

- **[inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim)** - Interactive LSP rename with live preview
  - **Keybinding**: `<leader>rn` - Shows preview of all symbol renames before applying
  - Real-time feedback as you type the new name
  - Works across entire workspace
  
- **[vim-visual-multi](https://github.com/mg979/vim-visual-multi)** - Multi-cursor editing
  - **Keybindings**: `<leader>md` (select next), `<leader>ma` (select all), `<leader>mk` (skip)
  - **Navigation**: `Ctrl+j/k` to jump between cursors
  - **Add cursors**: `Option+Shift+Up/Down` to add cursor above/below
  - VSCode-like multi-cursor experience

- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)** - Highly extendable fuzzy finder for files, buffers, LSP, and more
  - **File Operations**: `<leader>ff` (find files), `<leader>fg` (live grep), `<leader>fw` (grep word), `<leader>fr` (recent files), `<leader>/` (search buffer)
  - **Buffer/Project**: `<leader>fb` (buffers), `<leader>fp` (projects)
  - **Git Integration**: `<leader>gc` (commits), `<leader>gb` (branches), `<leader>gs` (status)
  - **LSP Navigation**: `gr` (references), `gd` (definitions), `gi` (implementations), `gt` (type definitions), `<leader>ds` (document symbols), `<leader>ws` (workspace symbols), `<leader>dd` (diagnostics)
  - **Neovim Internals**: `<leader>fh` (help), `<leader>fc` (commands), `<leader>fk` (keymaps), `<leader>fo` (options), `<leader>ft` (themes)
  - **Extensions**: FZF native sorter, UI select for code actions, project management
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart and powerful commenting
  - **Keybindings**: `gcc` (toggle line), `gbc` (toggle block), `gc` (line operator), `gb` (block operator), `gcO` (above), `gco` (below), `gcA` (end of line)
  - JSX/TSX support via nvim-ts-context-commentstring
  - Works with motions (e.g., `gc3j` to comment 3 lines down)
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Automatic bracket and quote pairing
  - Auto-close brackets, quotes, and tags
  - Smart spacing inside brackets: `(|)` → `( | )`
  - Arrow function support for JS/TS: `() =>` → `() => { | }`
  - Treesitter integration for context-aware pairing
  - Integrates with nvim-cmp for completion
- **[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto-close and rename HTML/JSX tags
  - Automatically close tags when typing `>`
  - Rename paired tags simultaneously
  - Works with HTML, JSX, TSX, and other XML-like formats
- **[vim-matchup](https://github.com/andymass/vim-matchup)** - Advanced bracket matching and navigation with treesitter integration
  - Jump between matching pairs with `%`
  - Highlights matching brackets and pairs
  - Stopline set to 500 for performance optimization
- **[Oil.nvim](https://github.com/stevearc/oil.nvim)** - File explorer that lets you edit your filesystem like a buffer
  - Keybindings: `-` to open parent directory, `<leader>-` for floating window
  - Shows hidden files by default with natural ordering
  - Includes mini.icons for file icons
- **[flash.nvim](https://github.com/folke/flash.nvim)** - Lightning-fast cursor movement
  - `s` - Flash jump to any location
  - `S` - Flash treesitter jump (select nodes)
- **[nvim-spectre](https://github.com/nvim-pack/nvim-spectre)** - Project-wide search and replace
  - `<leader>S` - Toggle Spectre
  - `<leader>sw` - Search current word
- **[mini.surround](https://github.com/echasnovski/mini.surround)** - Surround text with brackets, quotes, tags
  - `sa` - Add surrounding (e.g., `saiw"` to surround word with quotes)
  - `sd` - Delete surrounding
  - `sr` - Replace surrounding
  - `sf`/`sF` - Find surrounding
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding hints and documentation
  - Shows available keybindings after pressing leader key
  - Organizes commands into logical groups
  - Modern preset with rounded borders

### UI & Syntax

- **[TokyoNight](https://github.com/folke/tokyonight.nvim)** - Clean, dark Neovim theme with multiple variants
- **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting and code understanding
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration with sign column indicators
  - **Navigation**: `]c` (next hunk), `[c` (previous hunk)
  - **Actions**: `<leader>hs` (stage), `<leader>hr` (reset), `<leader>hp` (preview), `<leader>hb` (blame), `<leader>hd` (diff)
  - **Toggles**: `<leader>tb` (line blame), `<leader>td` (deleted lines)
  - Text object: `ih` (select hunk)
- **[nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)** - Live color preview
  - Highlights hex colors, RGB, HSL, named colors
  - Tailwind CSS color support
  - Background rendering for better visibility
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indentation guides
  - Shows indent levels with vertical lines
  - Highlights current scope with start and end markers
  - Excluded from special buffers (help, dashboard, lazy, mason)
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Fast and customizable statusline
  - Shows mode, branch, diff, diagnostics
  - Displays filename, encoding, fileformat, filetype
  - Progress and location indicators
  - TokyoNight theme integration
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** - Buffer tabs with LSP diagnostics
  - `Tab` - Next buffer
  - `S-Tab` - Previous buffer
  - `<leader>bd` - Delete buffer
  - Shows LSP diagnostics in tabs
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** - Highlight and navigate TODO comments
  - Highlights TODO, FIXME, NOTE, HACK, WARNING, PERF, TEST
  - `]t` - Next todo comment
  - `[t` - Previous todo comment
  - `<leader>ft` - Find TODOs with Telescope

## Setup

### Option 1: Clone directly

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

2. Launch Neovim - plugins will be automatically installed via lazy.nvim:
   ```bash
   nvim
   ```

### Option 2: Symbolic Link (macOS/Unix)

If you manage your dotfiles in a separate directory, you can create a symbolic link:

```bash
ln -s /path/to/your/dotfiles/nvim ~/.config/nvim
```

**Note:** This method is specifically for macOS/Unix. Replace `/path/to/your/dotfiles/nvim` with the actual path to your dotfiles directory.

## Features

### Fuzzy Finding & Navigation

Telescope provides powerful fuzzy finding capabilities:

- **File Navigation**: Quickly find and open files with `<leader>ff`, search file contents with `<leader>fg`
- **Buffer Management**: Switch between open buffers with `<leader>fb`
- **Project Management**: Navigate between projects with `<leader>fp`
- **Git Integration**: Browse commits, branches, and status without leaving Neovim
- **LSP Integration**: Find references, definitions, and symbols across your codebase
- **Live Preview**: See file contents, git diffs, and more in preview window
- **Multi-select**: Select multiple items with Tab and send to quickfix list
- **Smart Filtering**: Ignore node_modules, .git, and build directories automatically

### Git Integration

Seamless Git workflow without leaving Neovim:

- **Visual Indicators**: See added, changed, and deleted lines in the sign column
- **Hunk Navigation**: Jump between changes with `]c` and `[c`
- **Stage & Reset**: Stage or reset hunks with `<leader>hs` and `<leader>hr`
- **Blame & Diff**: View blame info with `<leader>hb` and diff with `<leader>hd`
- **Preview Changes**: Preview hunks inline with `<leader>hp`
- **Text Objects**: Use `ih` to select hunks for operations
- **Git-aware Navigation**: `<leader>gs` (changed files), `<leader>gf` (all git files)

### Visual Enhancements

Improve code readability and aesthetics:

- **Statusline**: Beautiful statusline showing mode, branch, diagnostics, file info, and location
- **Buffer Tabs**: Visual buffer tabs with LSP diagnostics integration
- **Color Preview**: See colors inline for hex, RGB, HSL, and Tailwind classes
- **Indentation Guides**: Visual guides for code structure with scope highlighting
- **Git Signs**: Clear visual indicators for file changes in the gutter
- **TODO Highlights**: Colorful highlighting for TODO, FIXME, NOTE, and other comment keywords

### Code Editing Productivity

Enhanced editing with automation and shortcuts:

- **Auto-pairing**: Automatically close brackets, quotes, and parentheses with smart spacing
- **Smart Commenting**: Comment/uncomment code with `gcc` (line) or `gbc` (block), works with any language including JSX/TSX
- **Tag Management**: Auto-close and rename HTML/JSX tags simultaneously
- **Surround Operations**: Add, delete, or replace surrounding brackets, quotes, or tags with `sa`, `sd`, `sr`
- **VSCode-style line moving**: `Option+↑/↓` to move lines up/down (preserves selection in visual mode)
- **Motion Support**: Use operators with motions (e.g., `gc3j` to comment 3 lines)
- **Context Awareness**: Treesitter integration ensures pairing and commenting work correctly in any context

### Navigation & Search

Powerful tools for moving around and finding what you need:

- **Flash Movement**: Jump to any location with `s` or use treesitter-aware jumps with `S`
- **Project-wide Search**: Find and replace across entire project with Spectre (`<leader>S`)
- **TODO Management**: Highlight and navigate TODO comments with `]t`/`[t`, search all TODOs with `<leader>ft`
- **Keybinding Discovery**: See available commands and their descriptions with which-key after pressing leader
- **Buffer Navigation**: Quickly switch between buffers with Tab/S-Tab

### LSP & Completion

This configuration provides a complete IDE-like experience with:

- **Automatic LSP Installation**: Mason automatically installs configured language servers on first launch
- **Intelligent Autocompletion**: Context-aware completions from LSP, buffer, path, and snippets
- **Tab Behavior**: Smart Tab key (Copilot line acceptance → completion navigation → snippet jump)
- **Code Navigation**: Jump to definitions, references, implementations, and type definitions
- **Diagnostics**: Real-time error and warning display with custom icons
- **Code Actions**: Quick fixes and refactoring suggestions via `<leader>ca`
- **Hover Documentation**: View documentation with `K`
- **Interactive Rename**: Live preview of symbol renames with `<leader>rn` (inc-rename.nvim)
- **Inlay Hints**: Type hints for TypeScript/JavaScript (parameters, return types, variable types)

## Quick Reference

### Most Used Keybindings

```
AI & Copilot:
<leader>aa   → Toggle Avante AI chat
<leader>ae   → Edit with AI (visual selection)
<leader>ap   → Switch AI provider (Claude/Copilot)
<Tab>        → Accept Copilot line / next completion
<C-Tab>      → Accept entire Copilot suggestion

Multi-cursor:
<leader>md   → Select next occurrence
<leader>ma   → Select all occurrences
<leader>mu   → Remove last selection
<C-j/k>      → Navigate between cursors

Editing:
Option+↑/↓   → Move line/selection up/down
<leader>rn   → Interactive LSP rename
<leader>ca   → Code action
gcc          → Toggle comment
sa/sd/sr     → Surround add/delete/replace

Git:
<leader>gs   → Git status (changed files)
<leader>gf   → Git files (all tracked)
<leader>hs   → Stage hunk
]c / [c      → Next/prev hunk

LSP:
gd           → Go to definition
gr           → Go to references
gi           → Go to implementation
K            → Hover docs
[d / ]d      → Next/prev diagnostic

Navigation:
<leader>ff   → Find files
<leader>fg   → Live grep
<leader>fb   → Find buffers
s            → Flash jump
-            → Open file explorer (Oil)
Ctrl+h/j/k/l → Navigate vim splits & tmux panes
```

## Node.js Version Isolation

This configuration includes wrapper scripts that ensure Neovim plugins (Copilot, Avante) always use Node.js 22+, regardless of your project's `.nvmrc` file. This prevents plugins from breaking when working in legacy projects with older Node versions.

See **[scripts/README.md](scripts/README.md)** for details.

## Setup

### Prerequisites

- Neovim ≥ 0.9.0 (0.10+ recommended)
- Node.js ≥ 22 (via NVM recommended for plugin isolation)
- Git
- A Nerd Font (for icons)
- ripgrep (for Telescope live grep)
- GitHub Copilot subscription (for Copilot features)
- Anthropic API key (optional, for Claude in Avante)

### Installation

#### Option 1: Clone directly

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

2. Launch Neovim - plugins will be automatically installed via lazy.nvim:
   ```bash
   nvim
   ```

#### Option 2: Symbolic Link (macOS/Unix)

If you manage your dotfiles in a separate directory, you can create a symbolic link:

```bash
ln -s /path/to/your/dotfiles/nvim ~/.config/nvim
```

**Note:** This method is specifically for macOS/Unix. Replace `/path/to/your/dotfiles/nvim` with the actual path to your dotfiles directory.

### Post-Installation

1. **Set up GitHub Copilot** (if using):
   ```vim
   :Copilot auth
   ```

2. **Set up Avante with Anthropic** (if using Claude):
   ```bash
   # Add to your ~/.zshrc or ~/.bashrc
   export AVANTE_ANTHROPIC_API_KEY="your-api-key-here"
   ```

3. **Install Node.js 22** (for plugin isolation):
   ```bash
   nvm install 22
   nvm alias default 22
   ```

4. **Make wrapper scripts executable**:
   ```bash
   chmod +x ~/.config/nvim/scripts/copilot-node
   chmod +x ~/.config/nvim/scripts/nvim-make
   ```

5. **Check keymaps**:
   ```vim
   :edit ~/.config/nvim/KEYMAPS.md
   ```

## Configuration Files

- `init.lua` - Main configuration entry point
- `lua/core/bootstrap.lua` - Lazy.nvim plugin manager setup
- `lua/core/options.lua` - Editor options and settings (includes disabled built-in plugins for performance)
- `lua/core/keymaps.lua` - Global keybindings
- `lua/plugins/*.lua` - Individual plugin configurations
- `scripts/*` - Node.js wrapper scripts for plugin isolation

## Performance Optimizations

Built-in Neovim plugins are disabled to improve startup performance and reduce conflicts with custom plugins:
- **netrw** - Replaced by Oil.nvim for file exploration
- **matchit/matchparen** - Replaced by vim-matchup for advanced bracket matching
- Other unused built-ins (gzip, tar, zip, vimball, tutor, etc.) are also disabled

## Troubleshooting

### Copilot not working in legacy projects

If Copilot fails when working in projects with old Node versions:
1. Check wrapper script: `~/.config/nvim/scripts/copilot-node --version` (should show v22.x.x)
2. Ensure script is executable: `chmod +x ~/.config/nvim/scripts/copilot-node`
3. See [scripts/README.md](scripts/README.md) for detailed troubleshooting

### Avante serialization errors

If you get serialization errors when opening Avante:
- Don't open Avante in Oil (file browser) buffers - open a specific file first
- The config includes guards to prevent this automatically

### LSP not working

If LSP features aren't working:
```vim
:Mason       " Check if language servers are installed
:LspInfo     " Check LSP client status
:LspLog      " View LSP logs
```

## Example Files

The repository includes example configuration files (`.example.lua`) that can be used as templates or references for customization.

## License

Feel free to use and adapt this configuration for your own needs.

