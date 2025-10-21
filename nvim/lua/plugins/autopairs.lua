-- Filename: autopairs.lua
-- Last change: Mon, 20 Oct 2025, 11:19PM

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local autopairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')

    autopairs.setup({
      -- Check treesitter for better context awareness
      check_ts = true,
      ts_config = {
        lua = { 'string' },  -- Don't add pairs in lua string treesitter nodes
        javascript = { 'template_string' },
        java = false,  -- Don't check treesitter on java
      },

      -- Disable for certain filetypes
      disable_filetype = { 'TelescopePrompt', 'vim' },

      -- Disable in macro recording
      disable_in_macro = false,

      -- Disable when recording or executing a macro
      disable_in_visualblock = false,

      -- Ignored next character regex
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],

      -- Enable fast wrap (Alt + e to wrap)
      enable_moveright = true,
      enable_afterquote = true,
      enable_check_bracket_line = true,
      enable_bracket_in_quote = true,
      enable_abbr = false,
      break_undo = true,

      -- Map <CR> (Enter)
      map_cr = true,
      map_bs = true,  -- Map backspace
      map_c_h = false,  -- Map <C-h> to delete pair
      map_c_w = false,  -- Map <C-w> to delete pair
    })

    -- Integration with nvim-cmp
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )

    -- Custom rules
    -- Add spaces between parentheses
    autopairs.add_rules({
      Rule(' ', ' ')
        :with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({ '()', '[]', '{}' }, pair)
        end),
      Rule('( ', ' )')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
      Rule('{ ', ' }')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
      Rule('[ ', ' ]')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']'),
    })

    -- Arrow function rule for JavaScript/TypeScript
    autopairs.add_rules({
      Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' })
        :use_regex(true)
        :set_end_pair_length(2),
    })
  end,
}
