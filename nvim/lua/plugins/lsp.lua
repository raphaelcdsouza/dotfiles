-- Filename: lsp.lua
-- Last change: Sat, 25 Oct 2025, 4:44PM

return {
  -- Mason: LSP installer
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          border = 'rounded',
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      })
    end,
  },

  -- Mason-LSPConfig bridge
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'vtsls',
        'html',
        'cssls',
        'tailwindcss',
        'eslint',
        'jsonls',
        'yamlls',
        'lua_ls',
        'bashls',
      },
      automatic_installation = true,
    },
  },

  -- Lazydev: Modern replacement for neodev (Neovim >= 0.10)
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- Optional: Typed Lua API for vim.uv
  { 'Bilal2453/luvit-meta', lazy = true },

  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      -- Suppress lspconfig deprecation warning (Neovim 0.11+)
      -- Temporarily suppress deprecation warnings from vim.deprecate
      local deprecated_orig = vim.deprecate
      vim.deprecate = function() end
      
      -- Also suppress notifications
      local notify_orig = vim.notify
      vim.notify = function(msg, ...)
        if type(msg) == "string" and (msg:match("lspconfig") or msg:match("deprecated")) then
          return
        end
        notify_orig(msg, ...)
      end

      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')

      -- Capabilities for autocompletion
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = {
          prefix = '●',
          source = 'if_many',
        },
        float = {
          source = 'if_many',
          border = 'rounded',
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Diagnostic signs
      local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- LSP Keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          -- <leader>rn is now handled by inc-rename.lua for better UX
          vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, opts)
          vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, opts)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
        end,
      })

      -- TypeScript/JavaScript (using vtsls - modern, maintained alternative)
      lspconfig.vtsls.setup({
        capabilities = capabilities,
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        settings = {
          vtsls = {
            -- Use workspace TypeScript version
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = 'always' },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              parameterNames = { enabled = 'all' },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
          javascript = {
            updateImportsOnFileMove = { enabled = 'always' },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              parameterNames = { enabled = 'all' },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
      })

      -- HTML
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { 'html', 'javascriptreact', 'typescriptreact' },
      })

      -- CSS/SCSS/SASS
      lspconfig.cssls.setup({
        capabilities = capabilities,
        filetypes = { 'css', 'scss', 'sass', 'less' },
        settings = {
          css = { validate = true, lint = { unknownAtRules = 'ignore' } },
          scss = { validate = true, lint = { unknownAtRules = 'ignore' } },
          sass = { validate = true, lint = { unknownAtRules = 'ignore' } },
        },
      })

      -- Tailwind CSS
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = {
          'html',
          'css',
          'scss',
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
          'vue',
          'svelte',
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                -- Enable in more places
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              },
            },
          },
        },
      })

      -- ESLint
      lspconfig.eslint.setup({
        capabilities = capabilities,
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      })

      -- JSON
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })

      -- YAML
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      })

      -- Lua (for Neovim config)
      -- Lazydev automatically configures lua_ls, but we can add extra settings
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            workspace = {
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      })

      -- Bash/Shell scripts
      lspconfig.bashls.setup({
        capabilities = capabilities,
        filetypes = { 'sh', 'bash', 'zsh' },
        settings = {
          bashIde = {
            globPattern = '*@(.sh|.inc|.bash|.command|.zsh)',
          },
        },
      })

      -- Restore original functions at the end
      vim.deprecate = deprecated_orig
      vim.notify = notify_orig
    end,
  },

  -- JSON/YAML schemas
  {
    'b0o/schemastore.nvim',
    lazy = true,
  },
}
