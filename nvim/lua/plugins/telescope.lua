-- Filename: telescope.lua
-- Last change: Mon, 20 Oct 2025, 8:33PM

return {
  -- Telescope core
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Telescope',
    keys = {
      -- File pickers
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = 'Find Word Under Cursor' },
      { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent Files' },
      { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search in Current Buffer' },

      -- Buffer & file management
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
      { '<leader>fp', '<cmd>Telescope project<cr>', desc = 'Find Projects' },

      -- Git integration
      { '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = 'Git Commits' },
      { '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = 'Git Branches' },
      { '<leader>gs', '<cmd>Telescope git_status<cr>', desc = 'Git Status' },

      -- LSP integration
      { 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'LSP References' },
      { 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'LSP Definitions' },
      { 'gi', '<cmd>Telescope lsp_implementations<cr>', desc = 'LSP Implementations' },
      { 'gt', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'LSP Type Definitions' },
      { '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Document Symbols' },
      { '<leader>ws', '<cmd>Telescope lsp_workspace_symbols<cr>', desc = 'Workspace Symbols' },
      { '<leader>dd', '<cmd>Telescope diagnostics<cr>', desc = 'Diagnostics' },

      -- Neovim internals
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
      { '<leader>fc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
      { '<leader>fo', '<cmd>Telescope vim_options<cr>', desc = 'Vim Options' },
      { '<leader>ft', '<cmd>Telescope colorscheme<cr>', desc = 'Color Schemes' },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          -- Appearance
          prompt_prefix = '🔍 ',
          selection_caret = '➤ ',
          entry_prefix = '  ',
          multi_icon = '+ ',

          -- Path display
          path_display = { 'truncate' },

          -- Sorting strategy
          sorting_strategy = 'ascending',

          -- Layout
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },

          -- Border style
          border = true,
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },

          -- Colors
          color_devicons = true,

          -- Performance
          set_env = { ['COLORTERM'] = 'truecolor' },

          -- File ignore patterns
          file_ignore_patterns = {
            'node_modules',
            '.git/',
            'dist/',
            'build/',
            'target/',
            '%.lock',
            'package-lock.json',
            'yarn.lock',
          },

          -- Mappings
          mappings = {
            i = {
              -- Navigation
              ['<C-n>'] = actions.move_selection_next,
              ['<C-p>'] = actions.move_selection_previous,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,

              -- Close
              ['<C-c>'] = actions.close,
              ['<Esc>'] = actions.close,

              -- Open file
              ['<CR>'] = actions.select_default,
              ['<C-x>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,

              -- Preview scrolling
              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,

              -- Multi-select
              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,

              -- Send to quickfix
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
              ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

              -- Cycle through history
              ['<Down>'] = actions.cycle_history_next,
              ['<Up>'] = actions.cycle_history_prev,
            },
            n = {
              -- Navigation
              ['j'] = actions.move_selection_next,
              ['k'] = actions.move_selection_previous,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['gg'] = actions.move_to_top,
              ['G'] = actions.move_to_bottom,

              -- Close
              ['q'] = actions.close,
              ['<Esc>'] = actions.close,

              -- Open file
              ['<CR>'] = actions.select_default,
              ['<C-x>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,

              -- Preview scrolling
              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,

              -- Multi-select
              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,

              -- Send to quickfix
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
              ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },

        -- Picker-specific configurations
        pickers = {
          find_files = {
            hidden = true,
            find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
          },
          live_grep = {
            additional_args = function()
              return { '--hidden', '--glob', '!.git/*' }
            end,
          },
          buffers = {
            sort_lastused = true,
            sort_mru = true,
            mappings = {
              i = {
                ['<C-d>'] = actions.delete_buffer,
              },
              n = {
                ['dd'] = actions.delete_buffer,
              },
            },
          },
          git_branches = {
            mappings = {
              i = {
                ['<C-d>'] = actions.git_delete_branch,
              },
            },
          },
          colorscheme = {
            enable_preview = true,
          },
        },

        -- Extension configurations
        extensions = {
          -- FZF extension (faster sorting)
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },

          -- UI Select extension (better code actions)
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({
              previewer = false,
              initial_mode = 'normal',
              sorting_strategy = 'ascending',
              layout_strategy = 'horizontal',
              layout_config = {
                horizontal = {
                  width = 0.5,
                  height = 0.4,
                  results_height = 0.15,
                  preview_width = 0.6,
                },
              },
            }),
          },

          -- Project extension
          project = {
            base_dirs = {
              '~/Documents/DEV',
              '~/work',
              '~/personal',
            },
            hidden_files = true,
            theme = 'dropdown',
            order_by = 'asc',
            search_by = 'title',
            sync_with_nvim_tree = false,
          },
        },
      })

      -- Load extensions
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
      telescope.load_extension('project')
    end,
  },

  -- Extension: FZF Native (C-based sorter for speed)
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable('make') == 1
    end,
  },

  -- Extension: UI Select (better code actions)
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },

  -- Extension: Project (project management)
  {
    'nvim-telescope/telescope-project.nvim',
  },
}
