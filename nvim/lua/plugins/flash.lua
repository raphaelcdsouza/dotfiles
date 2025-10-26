-- Filename: flash.lua
-- Last change: Tue, 21 Oct 2025, 12:22AM

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    -- Labels to use for jump targets
    labels = "asdfghjklqwertyuiopzxcvbnm",
    
    -- Search settings
    search = {
      -- Search mode: "exact" | "search" | "fuzzy"
      mode = "exact",
      -- Incremental search (show results as you type)
      incremental = true,
      -- Show labels after typing this many chars
      multi_window = true,
    },
    
    -- Jump settings
    jump = {
      -- Jump on first match if it's unique
      jumplist = true,
      -- Jump position: "start" | "end" | "range"
      pos = "start",
      -- Auto-jump if only one match
      autojump = false,
      -- Wrap around the buffer
      wraparound = true,
    },
    
    -- Label settings (THIS IS KEY!)
    label = {
      -- Show labels before or after the match
      before = true,
      after = true,
      -- Reuse labels to minimize keystrokes
      reuse = "lowercase",
      -- Rainbow mode (colorful labels)
      rainbow = {
        enabled = true,
        shade = 5,
      },
    },
    
    -- Highlight settings
    highlight = {
      -- backdrop makes everything else grey
      backdrop = true,
      -- Show match highlights
      matches = true,
    },
    
    -- Mode-specific settings
    modes = {
      -- Normal mode search
      search = {
        enabled = true,
        -- Show incremental search
        incremental = true,
      },
      -- Character-based search (s/S keys)
      char = {
        enabled = true,
        -- Config for the char search
        config = function(opts)
          -- Autohide search when only one match
          opts.autohide = false
          return opts
        end,
        -- Show keys for all matches
        keys = { "f", "F", "t", "T" },
        -- Show labels immediately
        search = { wrap = true, multi_window = true },
        -- Highlight settings for char mode
        highlight = { backdrop = true },
      },
    },
    
    -- Prompt configuration
    prompt = {
      enabled = true,
      prefix = { { "⚡", "FlashPromptIcon" } },
    },
  },
  
  keys = {
    -- Primary flash commands (safe, don't conflict with Vim)
    { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash Jump' },
    { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    
    -- Toggle flash in command mode (Ctrl+s in : command line)
    { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
  },
}
