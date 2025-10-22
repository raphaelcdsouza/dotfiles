# Neovim Keymaps Reference

Complete reference of all keybindings in this Neovim configuration.

**Leader Key**: `<Space>`

## Table of Contents

- [General](#general)
- [Window Management](#window-management)
- [Buffer Management](#buffer-management)
- [File Navigation](#file-navigation)
- [Fuzzy Finding (Telescope)](#fuzzy-finding-telescope)
- [LSP](#lsp)
- [Git (Gitsigns)](#git-gitsigns)
- [Code Editing](#code-editing)
- [Navigation & Movement](#navigation--movement)
- [Search & Replace](#search--replace)
- [TODO Comments](#todo-comments)

---

## General

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<Space>` | Leader key (no operation) |

## Window Management

### Navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<C-h>` | Move to left split |
| Normal | `<C-j>` | Move to split below |
| Normal | `<C-k>` | Move to split above |
| Normal | `<C-l>` | Move to right split |

### Split Management

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>pv` | Split vertically |
| Normal | `<leader>ps` | Split horizontally |
| Normal | `<leader>pe` | Make splits equal size |
| Normal | `<leader>px` | Close current split |
| Normal | `<leader>po` | Close other splits |

### Resize

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>w+` | Increase window height |
| Normal | `<leader>w-` | Decrease window height |
| Normal | `<leader>w>` | Decrease window width |
| Normal | `<leader>w<` | Increase window width |

## Buffer Management

### Navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<Tab>` | Next buffer |
| Normal | `<S-Tab>` | Previous buffer |
| Normal | `<leader>1` | Go to buffer 1 |
| Normal | `<leader>2` | Go to buffer 2 |
| Normal | `<leader>3` | Go to buffer 3 |
| Normal | `<leader>4` | Go to buffer 4 |
| Normal | `<leader>5` | Go to buffer 5 |

### Management

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>bd` | Delete buffer |
| Normal | `<leader>bD` | Delete buffer (force) |
| Normal | `<leader>bo` | Close other buffers |
| Normal | `<leader>br` | Close buffers to right |
| Normal | `<leader>bl` | Close buffers to left |
| Normal | `<leader>bp` | Pick buffer (interactive) |
| Normal | `<leader>bc` | Pick buffer to close |

### Movement

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>bmn` | Move buffer next |
| Normal | `<leader>bmp` | Move buffer previous |

## File Navigation

### Oil.nvim (File Explorer)

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `-` | Open parent directory |
| Normal | `<leader>-` | Open parent directory (floating) |
| Normal | `<CR>` | Select/Open file or directory |
| Normal | `<C-s>` | Open in vertical split |
| Normal | `<C-x>` | Open in horizontal split |
| Normal | `<C-t>` | Open in new tab |
| Normal | `<C-p>` | Preview file |
| Normal | `<C-c>` | Close Oil |
| Normal | `<C-r>` | Refresh |
| Normal | `_` | Open cwd |
| Normal | `` ` `` | CD to directory |
| Normal | `~` | CD to directory (tab scope) |
| Normal | `gs` | Change sort |
| Normal | `gx` | Open external |
| Normal | `g.` | Toggle hidden files |
| Normal | `g\` | Toggle trash |
| Normal | `g?` | Show help |

## Fuzzy Finding (Telescope)

### File Operations

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>ff` | Find files |
| Normal | `<leader>fg` | Live grep (search in files) |
| Normal | `<leader>fw` | Find word under cursor |
| Normal | `<leader>fr` | Recent files |
| Normal | `<leader>/` | Search in current buffer |

### Buffer & Project

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>fb` | Find buffers |
| Normal | `<leader>fp` | Find projects |

### Git Integration

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>gc` | Git commits |
| Normal | `<leader>gb` | Git branches |
| Normal | `<leader>gs` | Git status |

### LSP Integration

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `gr` | LSP references (Telescope) |
| Normal | `gd` | LSP definitions (Telescope) |
| Normal | `gi` | LSP implementations (Telescope) |
| Normal | `gt` | LSP type definitions (Telescope) |
| Normal | `<leader>ds` | Document symbols |
| Normal | `<leader>ws` | Workspace symbols |
| Normal | `<leader>dd` | Diagnostics |

### Neovim Internals

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>fh` | Help tags |
| Normal | `<leader>fc` | Commands |
| Normal | `<leader>fk` | Keymaps |
| Normal | `<leader>fo` | Vim options |
| Normal | `<leader>ft` | Color schemes |

## LSP

### Navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `gd` | Go to definition |
| Normal | `gD` | Go to declaration |
| Normal | `gi` | Go to implementation |
| Normal | `gr` | Go to references |
| Normal | `gt` | Go to type definition |
| Normal | `K` | Hover documentation |
| Normal | `<leader>K` | Signature help |

### Diagnostics

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `[d` | Previous diagnostic |
| Normal | `]d` | Next diagnostic |
| Normal | `<leader>e` | Open diagnostic float |
| Normal | `<leader>q` | Set diagnostic loclist |

### Code Actions

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal, Visual | `<leader>ca` | Code action |
| Normal | `<leader>rn` | Rename symbol |

## Git (Gitsigns)

### Navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `]c` | Next hunk |
| Normal | `[c` | Previous hunk |

### Actions

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>hs` | Stage hunk |
| Visual | `<leader>hs` | Stage selected hunk |
| Normal | `<leader>hr` | Reset hunk |
| Visual | `<leader>hr` | Reset selected hunk |
| Normal | `<leader>hS` | Stage buffer |
| Normal | `<leader>hu` | Undo stage hunk |
| Normal | `<leader>hR` | Reset buffer |
| Normal | `<leader>hp` | Preview hunk |
| Normal | `<leader>hb` | Blame line (full) |
| Normal | `<leader>hd` | Diff this |
| Normal | `<leader>hD` | Diff this ~ |

### Toggles

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>tb` | Toggle line blame |
| Normal | `<leader>td` | Toggle deleted lines |

### Text Objects

| Mode | Keymap | Description |
|------|--------|-------------|
| Operator, Visual | `ih` | Select hunk |

## Code Editing

### Commenting

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `gcc` | Toggle line comment |
| Normal | `gbc` | Toggle block comment |
| Normal, Visual | `gc` | Comment operator (use with motions) |
| Normal, Visual | `gb` | Block comment operator |
| Normal | `gcO` | Add comment above |
| Normal | `gco` | Add comment below |
| Normal | `gcA` | Add comment at end of line |

### Surround Operations

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal, Visual | `sa` | Add surrounding (e.g., `saiw"` surrounds word with quotes) |
| Normal | `sd` | Delete surrounding |
| Normal | `sr` | Replace surrounding |
| Normal | `sf` | Find surrounding (right) |
| Normal | `sF` | Find surrounding (left) |
| Normal | `sh` | Highlight surrounding |
| Normal | `sn` | Update n_lines |

### Auto-pairs

Auto-pairs work automatically when typing:
- Brackets: `(`, `[`, `{`
- Quotes: `"`, `'`, `` ` ``
- Special: Arrow functions in JS/TS: `() =>` auto-expands to `() => { }`

### CoffeeScript

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>cc` | Compile CoffeeScript file |
| Normal | `<leader>cj` | Show compiled JavaScript |
| Normal | `<leader>cr` | Run CoffeeScript file |
| Normal | `<leader>cl` | Lint CoffeeScript file |

## Navigation & Movement

### Flash (Fast Movement)

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal, Visual, Operator | `s` | Flash jump to location |
| Normal, Visual, Operator | `S` | Flash treesitter jump |

### Bracket Matching

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `%` | Jump to matching bracket/pair |

## Search & Replace

### Spectre (Project-wide)

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>S` | Toggle Spectre |
| Normal | `<leader>sw` | Search current word |

## TODO Comments

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `]t` | Next TODO comment |
| Normal | `[t` | Previous TODO comment |
| Normal | `<leader>ft` | Find all TODOs (Telescope) |

---

## Completion (nvim-cmp)

Completion keybindings work in Insert mode:

| Keymap | Description |
|--------|-------------|
| `<C-n>` | Next completion item |
| `<C-p>` | Previous completion item |
| `<C-d>` | Scroll docs down |
| `<C-f>` | Scroll docs up |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<Tab>` | Next item / Expand snippet / Jump forward |
| `<S-Tab>` | Previous item / Jump backward |

---

## Notes

- **Leader key** is `<Space>`
- **Mode abbreviations**: Normal (n), Insert (i), Visual (v), Operator (o)
- Many plugins provide additional keybindings that appear in which-key popup
- Use `<leader>fk` (Telescope keymaps) to search for keybindings interactively

