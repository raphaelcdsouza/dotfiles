# Neovim Keymaps Reference

Complete reference of all keybindings in this Neovim configuration.

**Leader Key**: `<Space>`

## Table of Contents

- [General](#general)
- [AI Assistant (Avante)](#ai-assistant-avante)
- [AI Copilot](#ai-copilot)
- [Window Management](#window-management)
- [Buffer Management](#buffer-management)
- [File Navigation](#file-navigation)
- [Fuzzy Finding (Telescope)](#fuzzy-finding-telescope)
- [LSP](#lsp)
- [Git (Gitsigns)](#git-gitsigns)
- [Code Editing](#code-editing)
- [Multi-Cursor](#multi-cursor)
- [Navigation & Movement](#navigation--movement)
- [Search & Replace](#search--replace)
- [TODO Comments](#todo-comments)

---

## General

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<Space>` | Leader key (no operation) |

---

## AI Assistant (Avante)

**Cursor-style AI chat with diff mode for code edits**

### Chat Operations

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal, Visual | `<leader>aa` | Toggle AI chat |
| Normal, Visual | `<leader>ae` | Edit selected code with AI |
| Normal | `<leader>ar` | Refresh chat |
| Normal | `<leader>ac` | Clear chat history |
| Normal | `<leader>ax` | Stop/Cancel current AI request |
| Normal | `<leader>aX` | Clear ALL cache/state (force reset) |
| Normal | `<leader>af` | Focus chat window |
| Normal | `<leader>a?` | List all Avante commands |

### Provider & Model Switching

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>ap` | Switch AI provider (Claude/Copilot) |
| Normal | `<leader>am` | Switch Claude model |
| Normal | `<leader>aM` | Switch Copilot model (GPT) |
| Normal | `<leader>aE` | Edit Avante config file |

### Diff Resolution

These keymaps are active when viewing AI-suggested code changes:

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `co` | Choose ours (reject AI suggestion) |
| Normal | `ct` | Choose theirs (accept AI suggestion) |
| Normal | `ca` | Accept all AI changes |
| Normal | `c0` | Reject all AI changes |
| Normal | `cb` | Keep both versions |
| Normal | `]x` | Next conflict |
| Normal | `[x` | Previous conflict |

**Notes**:
- Avante cannot be used in Oil (file browser) buffers
- Default provider: **Copilot** (GitHub Models)
- Default models: Claude 4.5 Sonnet, GPT-4o
- Use `<leader>ax` to stop long-running AI requests
- Use `<leader>aX` (capital X) to completely clear all cache/state (removes todos, history, everything)
- Or use `Ctrl+C` in the Avante chat window to interrupt
- Avante is used for **chat-based editing only** (not inline suggestions)
- GitHub Copilot plugin handles all inline suggestions

---

## AI Copilot

**GitHub Copilot inline suggestions**

### Inline Suggestions

| Mode | Keymap | Description |
|------|--------|-------------|
| Insert | `<Tab>` | Accept one line (Cursor-style) |
| Insert | `<C-Tab>` | Accept entire suggestion |
| Insert | `<M-]>` | Next alternative suggestion |
| Insert | `<M-[>` | Previous alternative suggestion |
| Insert | `<C-]>` | Dismiss suggestion |

### Copilot Panel

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<M-CR>` | Open Copilot panel |
| Normal | `[[` | Previous suggestion (in panel) |
| Normal | `]]` | Next suggestion (in panel) |
| Normal | `<CR>` | Accept suggestion (in panel) |
| Normal | `gr` | Refresh (in panel) |

**Notes**:
- Suggestions limited to 5 lines max
- Tab accepts line-by-line (like Cursor IDE)
- Ctrl+Tab accepts entire multi-line suggestion

---

## Window Management

### Navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<C-h>` | Move to left split (also works with tmux panes) |
| Normal | `<C-j>` | Move to split below (also works with tmux panes) |
| Normal | `<C-k>` | Move to split above (also works with tmux panes) |
| Normal | `<C-l>` | Move to right split (also works with tmux panes) |
| Normal | `<C-\>` | Move to previous split/pane (tmux) |

**Note**: These keybindings seamlessly navigate between vim splits AND tmux panes when using tmux. See [tmux configuration](../tmux/README.md) for setup.

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
| Normal | `<leader>gs` | Git status (changed files only) |
| Normal | `<leader>gf` | Git files (all tracked files) |

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
| Normal | `<leader>rn` | Rename symbol (interactive with preview) |

**Notes**:
- `<leader>rn` uses inc-rename.nvim for live preview of all changes

---

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

### Quick Edits (Cursor-style)

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<leader>cn` | Search word & jump to next occurrence in append mode |

### Move Lines (VSCode-style)

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<M-Up>` (Option+↑) | Move current line up |
| Normal | `<M-Down>` (Option+↓) | Move current line down |
| Visual | `<M-Up>` (Option+↑) | Move selected lines up |
| Visual | `<M-Down>` (Option+↓) | Move selected lines down |
| Insert | `<M-Up>` (Option+↑) | Move current line up |
| Insert | `<M-Down>` (Option+↓) | Move current line down |

**Notes**:
- Lines are auto-indented after moving
- In visual mode, selection is preserved after moving
- Works in insert mode without leaving insert mode

---

## Multi-Cursor

**vim-visual-multi for multiple simultaneous cursors**

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal, Visual | `<leader>md` | Select next occurrence of word/selection |
| Normal, Visual | `<leader>mk` | Skip current, select next occurrence |
| Normal, Visual | `<leader>mu` | Remove last cursor/selection |
| Normal, Visual | `<leader>ma` | Select all occurrences |
| Normal, Visual | `<M-S-Up>` (Option+Shift+↑) | Add cursor above |
| Normal, Visual | `<M-S-Down>` (Option+Shift+↓) | Add cursor below |

**In Multi-Cursor Mode**:

| Keymap | Description |
|--------|-------------|
| `<C-j>` | Go to next cursor |
| `<C-k>` | Go to previous cursor |
| `i`, `a`, `I`, `A` | Enter insert mode at cursors |
| `<Esc>` | Exit multi-cursor mode |

**Mnemonic**: `<leader>m*` = **M**ulti-cursor operations
- `md` = Multi-cursor **D**uplicate
- `ma` = Multi-cursor **A**ll
- `mk` = Multi-cursor s**K**ip
- `mu` = Multi-cursor **U**ndo

---

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
| `<C-d>` | Scroll docs down (in completion menu) |
| `<C-f>` | Scroll docs up |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<Tab>` | Accept Copilot line / Next item / Expand snippet |
| `<S-Tab>` | Previous item / Jump backward |

**Note**: Tab behavior is context-aware:
1. If Copilot suggestion visible → Accept one line
2. If completion menu open → Next item
3. If in snippet → Jump to next placeholder

---

## Scroll & Page Movement

| Mode | Keymap | Description |
|------|--------|-------------|
| Normal | `<C-d>` | Scroll half page down |
| Normal | `<C-u>` | Scroll half page up |
| Normal | `<C-f>` | Scroll full page down |
| Normal | `<C-b>` | Scroll full page up |
| Normal | `zz` | Center cursor line |
| Normal | `zt` | Cursor line to top |
| Normal | `zb` | Cursor line to bottom |

---

## Notes

- **Leader key** is `<Space>`
- **Mode abbreviations**: Normal (n), Insert (i), Visual (v), Operator (o)
- Many plugins provide additional keybindings that appear in which-key popup
- Use `<leader>fk` (Telescope keymaps) to search for keybindings interactively

## Quick Reference

### Most Used Combos

```
<leader>aa   → Toggle Avante AI chat
<leader>ae   → Edit with AI
<leader>ax   → Stop/Cancel AI request
<leader>aX   → Clear ALL Avante cache (force reset)
<leader>md   → Multi-cursor: select next
<leader>ma   → Multi-cursor: select all
<leader>rn   → LSP rename
<leader>ca   → Code action
<leader>gs   → Git status (changed files)
<leader>gf   → Git files (all tracked)
gd           → Go to definition
gr           → Go to references
K            → Hover docs
<C-d>        → Scroll half page down
<Tab>        → Accept Copilot line / next completion
co/ct        → Avante diff: choose ours/theirs
]c / [c      → Next/prev git hunk
]d / [d      → Next/prev diagnostic
```

### Keymap Namespaces

- `<leader>a*` → **A**vante AI operations
- `<leader>m*` → **M**ulti-cursor operations
- `<leader>h*` → Git **h**unk operations
- `<leader>g*` → **G**it navigation
- `<leader>p*` → **P**ane/split management
- `<leader>w*` → **W**indow resizing
- `<leader>f*` → **F**ind (Telescope)
- `<leader>b*` → **B**uffer management
- `<leader>c*` → **C**ursor-style actions / CoffeeScript
- `<leader>t*` → **T**oggles

