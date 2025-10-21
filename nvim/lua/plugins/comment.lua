-- Filename: comment.lua
-- Last change: Mon, 20 Oct 2025, 11:26PM

return {
  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',  -- For JSX/TSX support
    },
    config = function()
      require('Comment').setup({
        -- Add a space between comment and the line
        padding = true,

        -- Should comment out empty or whitespace only lines
        sticky = true,

        -- Lines to be ignored while (un)comment
        ignore = '^$',  -- Ignore empty lines

        -- LHS of toggle mappings in NORMAL mode
        toggler = {
          line = 'gcc',   -- Line-comment toggle keymap
          block = 'gbc',  -- Block-comment toggle keymap
        },

        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          line = 'gc',    -- Line-comment keymap
          block = 'gb',   -- Block-comment keymap
        },

        -- LHS of extra mappings
        extra = {
          above = 'gcO',  -- Add comment on the line above
          below = 'gco',  -- Add comment on the line below
          eol = 'gcA',    -- Add comment at the end of line
        },

        -- Enable keybindings
        mappings = {
          basic = true,
          extra = true,
        },

        -- Function to call before (un)comment
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

        -- Function to call after (un)comment
        post_hook = nil,
      })
    end,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,  -- Let Comment.nvim handle it
    },
  }
}
