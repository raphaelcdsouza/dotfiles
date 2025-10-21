-- Filename: colorizer.lua
-- Last change: Tue, 21 Oct 2025, 12:04AM

return {
  'brenoprata10/nvim-highlight-colors',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    render = 'background',
    enable_named_colors = true,
    enable_tailwind = true,
    tailwind = 'both',  -- Use both methods
  },
}
