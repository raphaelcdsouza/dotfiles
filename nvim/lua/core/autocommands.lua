-- Filename: autocommands.lua
-- Last change: Sat, 25 Oct 2025, 4:37PM

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Skip special buffers (oil, help, quickfix, etc.)
    local buftype = vim.bo.buftype
    if buftype ~= "" then
      return
    end

    -- Safely modify formatoptions with pcall to catch errors
    pcall(function()
      vim.opt_local.formatoptions:remove({ "o", "a", "t", "2" })
      vim.opt_local.formatoptions:append({ "c", "r", "n", "j" })
    end)
  end,
  desc = "Override filetype formatoptions"
})


