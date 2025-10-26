# Plugin Configurations

This directory contains individual plugin configuration files for Neovim.

## Organization

Each plugin has its own `.lua` file that returns a lazy.nvim plugin specification. This modular approach makes it easy to enable/disable plugins and keep configurations organized.

## Plugin Categories

### 🤖 AI & Code Assistance

- **`avante.lua`** - Cursor-style AI chat assistant
  - Supports Claude (Anthropic) and Copilot (GitHub Models)
  - Diff mode for reviewing AI suggestions before applying
  - Provider and model switching on the fly
  - Node.js isolation for legacy project compatibility
  
- **`copilot.lua`** - GitHub Copilot integration
  - Line-by-line acceptance (Cursor-style Tab behavior)
  - Suggestion cycling with Alt+] and Alt+[
  - Limited to 5 lines per suggestion
  - Node.js isolation for legacy projects

### 📝 LSP & Completion

- **`lsp.lua`** - Language Server Protocol configuration
  - Auto-installs TypeScript, HTML, CSS, Tailwind, JSON, YAML, Lua servers
  - Custom keybindings and diagnostic styling
  - Inlay hints for TypeScript/JavaScript
  - Mason integration for server management
  
- **`cmp.lua`** - Autocompletion engine
  - Smart Tab behavior (Copilot → completion → snippet)
  - Sources: LSP, buffer, path, snippets
  - Integrates with LuaSnip and Copilot
  
- **`inc-rename.lua`** - Interactive LSP rename
  - Live preview of symbol renames
  - Shows all occurrences before applying
  - Keybinding: `<leader>rn`

### ✨ Editor Enhancement

- **`multicursor.lua`** - Multi-cursor editing (vim-visual-multi)
  - VSCode-like multi-cursor experience
  - Keybindings: `<leader>md` (select next), `<leader>ma` (select all)
  - Navigation with Ctrl+j/k between cursors
  
- **`telescope.lua`** - Fuzzy finder for files, buffers, LSP, git
  - File operations, git integration, LSP navigation
  - Extensions: FZF native, UI select, project management
  - Preview window for file contents and git diffs
  
- **`oil.lua`** - File explorer that lets you edit filesystem like a buffer
  - Keybindings: `-` (open parent), `<leader>-` (floating window)
  - Shows hidden files, natural ordering
  
- **`flash.lua`** - Lightning-fast cursor movement
  - `s` for flash jump, `S` for treesitter jump
  
- **`spectre.lua`** - Project-wide search and replace
  - `<leader>S` to toggle, `<leader>sw` to search current word

### 🎨 UI & Appearance

- **`tokionight.lua`** - Tokyo Night color scheme
  - Multiple variants (storm, night, day, moon)
  - Transparent background support
  
- **`lualine.lua`** - Statusline
  - Shows mode, branch, diff, diagnostics
  - File info, encoding, progress indicators
  
- **`bufferline.lua`** - Buffer tabs
  - Tab/S-Tab navigation
  - LSP diagnostics in tabs
  - Buffer management commands
  
- **`colorizer.lua`** - Color preview and highlighting
  - Hex, RGB, HSL, Tailwind colors
  - Background rendering
  
- **`indent-blankline.lua`** - Indentation guides
  - Scope highlighting
  - Excluded from special buffers

### 🌿 Git Integration

- **`gitsigns.lua`** - Git integration with sign column
  - Visual indicators for changes
  - Hunk navigation, stage/reset, blame, diff
  - Text object: `ih` to select hunks
  - Works with Oil buffers for directory git status

### 📝 Code Editing

- **`treesitter.lua`** - Advanced syntax highlighting
  - Auto-install for common languages
  - Incremental selection, rainbow brackets
  - Context-aware operations
  
- **`autopairs.lua`** - Auto-pairing brackets and quotes
  - Smart spacing, treesitter integration
  - Arrow function expansion for JS/TS
  
- **`autotag.lua`** - Auto-close and rename HTML/JSX tags
  - Works with HTML, JSX, TSX, XML
  
- **`comment.lua`** - Smart commenting
  - `gcc` (line), `gbc` (block), `gc` (operator)
  - JSX/TSX support via ts-context-commentstring
  
- **`surround.lua`** - Surround operations (mini.surround)
  - `sa` (add), `sd` (delete), `sr` (replace)
  - `sf`/`sF` (find), `sh` (highlight)
  
- **`matchup.lua`** - Advanced bracket matching
  - Jump between pairs with `%`
  - Treesitter integration

### 🔍 Utilities

- **`todo-comments.lua`** - Highlight and navigate TODO comments
  - Keywords: TODO, FIXME, NOTE, HACK, WARNING, PERF, TEST
  - `]t`/`[t` for navigation
  - `<leader>ft` to search all TODOs
  
- **`whichkey.lua`** - Keybinding hints
  - Shows available commands after pressing leader
  - Organizes by logical groups

### ☕ Language-Specific

- **`coffeescript.lua`** - CoffeeScript syntax support
  - Auto-compile on save
  - Keybindings for compile, run, lint, show JS

## Adding New Plugins

To add a new plugin:

1. Create a new `.lua` file in this directory
2. Return a lazy.nvim plugin specification:

```lua
return {
  "author/plugin-name",
  dependencies = {}, -- Optional
  event = "VeryLazy", -- or other lazy-loading trigger
  opts = {
    -- Plugin options
  },
  config = function()
    -- Custom configuration
    require("plugin-name").setup({})
  end,
}
```

3. Restart Neovim - lazy.nvim will auto-detect and install it

## Disabling Plugins

To disable a plugin without deleting it:

```lua
return {
  "author/plugin-name",
  enabled = false,
}
```

Or simply rename the file to add `.disabled` extension:
```bash
mv plugin-name.lua plugin-name.lua.disabled
```

## Plugin Dependencies

Some plugins depend on external tools:

- **Telescope**: requires `ripgrep` for live grep
- **Treesitter**: requires C compiler for parser compilation
- **Mason**: requires `curl`, `unzip`, `tar` for LSP installation
- **Copilot/Avante**: require Node.js ≥ 22 (handled by wrapper scripts)

## Node.js Isolation

Plugins that require Node.js (Copilot, Avante) use wrapper scripts to ensure they always use Node 22+, regardless of the project's `.nvmrc` file. See [scripts/README.md](../../scripts/README.md) for details.

## Performance Tips

- Use `event` or `cmd` for lazy-loading plugins
- Use `ft` for filetype-specific plugins
- Disable unused built-in plugins in `core/options.lua`
- Check startup time: `:Lazy profile`

## Troubleshooting

### Plugin not loading

```vim
:Lazy          " Check plugin status
:Lazy sync     " Reinstall/update plugins
:Lazy clean    " Remove unused plugins
```

### LSP not working

```vim
:Mason         " Check installed servers
:LspInfo       " Check LSP client status
:LspLog        " View LSP logs
```

### Copilot/Avante issues in legacy projects

See [scripts/README.md](../../scripts/README.md) for Node.js isolation troubleshooting.

---

*Last updated: October 25, 2025*

