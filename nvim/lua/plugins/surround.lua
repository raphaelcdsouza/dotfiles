-- Filename: surround.lua
-- Last change: Tue, 21 Oct 2025, 12:21PM

return {
  'echasnovski/mini.surround',
  version = false,
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    mappings = {
      add = 'sa',            -- Add surrounding
      delete = 'sd',         -- Delete surrounding
      find = 'sf',           -- Find surrounding
      find_left = 'sF',      -- Find surrounding (to the left)
      highlight = 'sh',      -- Highlight surrounding
      replace = 'sr',        -- Replace surrounding
      update_n_lines = 'sn', -- Update `n_lines`
    },
  },
}
