-- Filename: copilot.lua
-- Last change: Sat, 25 Oct 2025, 4:45PM

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      max_lines = 5,  -- Limit suggestions to max 5 lines (adjust as needed)
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom",
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,        -- Enable automatic suggestions as you type
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = false,           -- Disabled: handled by cmp.lua for smart Tab behavior
          accept_word = false,      -- Disabled: will be handled by Tab cycling
          accept_line = false,      -- Disabled: will be handled by Tab cycling
          next = "<M-]>",           -- Next alternative suggestion
          prev = "<M-[>",           -- Previous alternative suggestion
          dismiss = "<C-]>",        -- Dismiss suggestion
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = vim.fn.expand('~/.config/nvim/scripts/copilot-node'), -- Node.js wrapper that forces v22+ (ignores project .nvmrc)
      server_opts_overrides = {},
    })
  end,
}

