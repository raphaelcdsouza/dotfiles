-- Filename: multicursor.lua  
-- Last change: Sat, 25 Oct 2025, 4:46PM

return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    -- Use Cursor-style behavior
    vim.g.VM_theme = 'iceblue'
    vim.g.VM_mouse_mappings = 1

    -- Custom mappings for Cursor-style workflow
    vim.g.VM_maps = {
      -- Start multi-cursor on current word
      ["Find Under"] = '<leader>md',      -- <leader>md to select next occurrence (avoids conflict with C-d scroll)
      ["Find Subword Under"] = '<leader>md',

      -- Skip current and select next
      ["Skip Region"] = '<leader>mk',

      -- Remove last selection
      ["Remove Region"] = '<leader>mu',   -- "undo" last selection

      -- Select all occurrences
      ["Select All"] = '<leader>ma',      -- "select all"

      -- Navigate between cursors with Ctrl+j/k (avoid Tab conflicts)
      ["Goto Next"] = '<C-j>',
      ["Goto Prev"] = '<C-k>',

      -- Add cursor with Alt+Shift+Up/Down (avoid conflict with line moving)
      ["Add Cursor Down"] = '<M-S-Down>',
      ["Add Cursor Up"] = '<M-S-Up>',
    }

    -- Highlight colors
    vim.g.VM_Mono_hl = 'DiffText'
    vim.g.VM_Extend_hl = 'DiffAdd'
    vim.g.VM_Cursor_hl = 'Visual'
    vim.g.VM_Insert_hl = 'DiffChange'
  end,
}

