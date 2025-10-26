-- Filename: cmp.lua
-- Last change: Sat, 25 Oct 2025, 4:43PM

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      build = 'make install_jsregexp',
    },
    'saadparwaiz1/cmp_luasnip',

    -- Completion sources
    'hrsh7th/cmp-nvim-lsp',     -- This is what LSP needs!
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',

    -- Friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Helper function to check if Copilot suggestion is available
    local has_copilot_suggestion = function()
      local ok, suggestion = pcall(require, 'copilot.suggestion')
      if ok then
        return suggestion.is_visible()
      end
      return false
    end

    -- Cursor-style line-by-line acceptance
    local accept_one_line = function()
      local ok, suggestion = pcall(require, 'copilot.suggestion')
      if ok and suggestion.is_visible() then
        -- Accept only the first line
        suggestion.accept_line()
        return true
      end
      return false
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        
        -- Accept entire Copilot suggestion at once (Ctrl+Tab)
        ['<C-Tab>'] = cmp.mapping(function(fallback)
          if has_copilot_suggestion() then
            require('copilot.suggestion').accept()
          else
            fallback()
          end
        end, { 'i', 's' }),
        
        -- Smart Tab with Cursor-style behavior: Accept line-by-line
        ['<Tab>'] = cmp.mapping(function(fallback)
          -- Priority 1: Accept Copilot suggestion line-by-line (Cursor style)
          if has_copilot_suggestion() then
            if accept_one_line() then
              return
            end
          -- Priority 2: Navigate cmp menu if visible
          elseif cmp.visible() then
            cmp.select_next_item()
          -- Priority 3: Expand or jump in LuaSnip
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          -- Priority 4: Default behavior
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
    })
  end,
}
