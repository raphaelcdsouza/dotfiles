-- Filename: avante.lua
-- Last change: Sat, 25 Oct 2025, 4:44PM

return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or vim.fn.expand('~/.config/nvim/scripts/nvim-make'),
  lazy = true,  -- Only load when commanded
  cmd = {
    "AvanteToggle",
    "AvanteEdit",
    "AvanteRefresh",
    "AvanteClear",
    "AvanteFocus",
  },
  version = false,
  opts = {
    ---@type "claude" | "openai" | "azure" | "copilot" | string
    provider = "copilot", -- Default to Copilot
    
    -- Provider-specific settings
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-sonnet-4-5-20250929", -- Latest Claude 4.5 Sonnet via Anthropic API
      timeout = 30000,
      max_tokens = 8000,
      temperature = 0, -- Deterministic responses
      api_key_name = "AVANTE_ANTHROPIC_API_KEY", -- Your custom environment variable name
    },
    
    -- Copilot settings (GitHub Models)
    copilot = {
      endpoint = "https://api.githubcopilot.com",
      model = "gpt-4o-2024-11-20", -- Copilot only supports GPT models currently
      timeout = 30000,
      max_tokens = 8000,
      temperature = 0,
    },
    
    -- Behavior configuration (KEEP CURRENT WORKING BEHAVIOR)
    behaviour = {
      auto_apply_diff_after_generation = false, -- Cursor-style: show diff, don't auto-apply
      auto_set_keymaps = false, -- Use custom keymaps with Oil guard
      auto_set_highlight_group = true,
      auto_suggestions = false, -- Don't auto-suggest from workspace
      support_paste_from_clipboard = true,
    },
    
    -- Safety: Require confirmation for command execution
    acp = {
      auto_confirm_execution = false, -- IMPORTANT: Always ask before running commands (git, bash, rm, etc.)
    },
    
    -- Mappings (for when Avante sidebar is open)
    mappings = {
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      diff = {
        ours = "co",
        theirs = "ct",
        both = "cb",
        next = "]x",
        prev = "[x",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
    },
    
    -- Window configuration
    windows = {
      wrap = true, -- Wrap text
      width = 30, -- % of editor width
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
    
    -- Highlight settings
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    
    -- File selector (for adding files manually with Ctrl+F)
    file_selector = {
      provider = "telescope",
    },
    
    -- Vendor-specific optimizations
    vendors = {
      ---@type AvanteProvider
      claude = {
        __inherited_from = "claude",
        api_key_name = "ANTHROPIC_API_KEY",
      },
    },
  },
  
  config = function(_, opts)
    -- Node.js isolation for legacy projects
    vim.env.PATH = vim.fn.expand('~/.config/nvim/scripts') .. ':' .. vim.env.PATH
    
    require("avante").setup(opts)
    
    -- Set up custom highlights for better diff visibility
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "AvanteTitle", { fg = "#7aa2f7", bold = true })
        vim.api.nvim_set_hl(0, "AvanteReversedTitle", { fg = "#1a1b26", bg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "AvanteSubtitle", { fg = "#9ece6a", italic = true })
        vim.api.nvim_set_hl(0, "AvanteReversedSubtitle", { fg = "#1a1b26", bg = "#9ece6a" })
      end,
    })
  end,
  
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
