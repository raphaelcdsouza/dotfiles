-- Filename: inc-rename.lua
-- Last change: Sat, 25 Oct 2025, 4:45PM

return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  keys = {
    {
      "<leader>rn",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      expr = true,
      desc = "LSP: Rename symbol (interactive)",
    },
  },
  opts = {
    input_buffer_type = "dressing", -- Use dressing.nvim for pretty input
    show_message = true,
    preview_empty_name = false,
    hl_group = "Substitute",
  },
}

