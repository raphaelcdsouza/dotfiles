-- Filename: keymaps.lua
-- Last change: Sat, 25 Oct 2025, 4:36PM

local map = require('core.utils').map

map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Window navigation (Ctrl + hjkl)
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to split below' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to split above' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })

-- Window management
map('n', '<leader>pv', '<C-w>v', { desc = 'Split vertically' })
map('n', '<leader>ps', '<C-w>s', { desc = 'Split horizontally' })
map('n', '<leader>pe', '<C-w>=', { desc = 'Make splits equal' })
map('n', '<leader>px', '<cmd>close<cr>', { desc = 'Close current split' })
map('n', '<leader>po', '<C-w>o', { desc = 'Close other splits' })

-- Resize splits
map('n', '<leader>w+', ':resize +2<CR>', { desc = 'Increase height' })
map('n', '<leader>w-', ':resize -2<CR>', { desc = 'Decrease height' })
map('n', '<leader>w>', ':vertical resize -2<CR>', { desc = 'Decrease width' })
map('n', '<leader>w<', ':vertical resize +2<CR>', { desc = 'Increase width' })

-- Cursor-style quick edit workflow
-- Search for word under cursor and jump to next occurrence in append mode
map('n', '<leader>cn', function()
  -- Search for current word
  vim.cmd('normal! *')
  -- Jump to next occurrence
  vim.cmd('normal! n')
  -- Go to end of match and enter insert mode
  vim.cmd('normal! ea')
end, { desc = 'Cursor-style: Jump to next & append' })

-- Move lines up/down (VSCode-style Alt+Up/Down)
map('n', '<M-Up>', ':m .-2<CR>==', { desc = 'Move line up', silent = true })
map('n', '<M-Down>', ':m .+1<CR>==', { desc = 'Move line down', silent = true })
map('v', '<M-Up>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up', silent = true })
map('v', '<M-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down', silent = true })
map('i', '<M-Up>', '<Esc>:m .-2<CR>==gi', { desc = 'Move line up', silent = true })
map('i', '<M-Down>', '<Esc>:m .+1<CR>==gi', { desc = 'Move line down', silent = true })

-- Git-aware file navigation (Telescope)
map('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { desc = 'Git Status (changed files)' })
map('n', '<leader>gf', '<cmd>Telescope git_files<cr>', { desc = 'Git Files (tracked)' })

-- Avante AI Chat (Oil buffer protection)
-- Oil buffers cause serialization errors with Avante's tokenizer
map('n', '<leader>aa', function()
  -- Skip checks if already in Avante buffer
  if vim.bo.filetype == "Avante" or vim.bo.filetype == "AvanteInput" then
    vim.cmd('AvanteToggle')
    return
  end
  
  -- Check filetype
  if vim.bo.filetype == "oil" then
    vim.notify("⚠️  Avante cannot be used in Oil buffers.\n💡 Open a file first, then use <leader>aa", vim.log.levels.WARN)
    return
  end
  
  -- Check buffer name (Oil buffers often have "oil://" in the name)
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname:match("^oil://") or bufname == "" then
    vim.notify("⚠️  Avante cannot be used in directory views.\n💡 Open a specific file first, then use <leader>aa", vim.log.levels.WARN)
    return
  end
  
  vim.cmd('AvanteToggle')
end, { desc = 'Avante: Toggle Chat' })

map('v', '<leader>aa', function()
  -- Skip checks if already in Avante buffer
  if vim.bo.filetype == "Avante" or vim.bo.filetype == "AvanteInput" then
    vim.cmd('AvanteToggle')
    return
  end
  
  -- Check filetype
  if vim.bo.filetype == "oil" then
    vim.notify("⚠️  Avante cannot be used in Oil buffers.\n💡 Open a file first, then use <leader>aa", vim.log.levels.WARN)
    return
  end
  
  -- Check buffer name
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname:match("^oil://") or bufname == "" then
    vim.notify("⚠️  Avante cannot be used in directory views.\n💡 Open a specific file first, then use <leader>aa", vim.log.levels.WARN)
    return
  end
  
  vim.cmd('AvanteToggle')
end, { desc = 'Avante: Toggle Chat (visual)' })

-- Additional Avante commands
map('n', '<leader>ae', '<cmd>AvanteEdit<cr>', { desc = 'Avante: Edit selected code' })
map('v', '<leader>ae', '<cmd>AvanteEdit<cr>', { desc = 'Avante: Edit selected code' })
map('n', '<leader>ar', '<cmd>AvanteRefresh<cr>', { desc = 'Avante: Refresh chat' })
map('n', '<leader>ac', '<cmd>AvanteClear<cr>', { desc = 'Avante: Clear chat history' })
map('n', '<leader>ax', '<C-c>', { desc = 'Avante: Stop/Cancel current request' })

-- Clear Avante cache and state (nuclear option)
map('n', '<leader>aX', function()
  vim.cmd('AvanteToggle') -- Close Avante if open
  vim.fn.system('rm -rf ~/.local/state/nvim/avante ~/.cache/nvim/avante ~/.local/share/nvim/avante')
  vim.notify('✅ Cleared all Avante cache, state, and history\n💡 Reopen Avante for a fresh start', vim.log.levels.INFO)
end, { desc = 'Avante: Clear ALL cache/state (force reset)' })

-- Avante focus (jump to chat window)
map('n', '<leader>af', '<cmd>AvanteFocus<cr>', { desc = 'Avante: Focus chat window' })

-- List all Avante commands (for debugging)
map('n', '<leader>a?', function()
  vim.cmd('command Avante')
end, { desc = 'Avante: List all commands' })

-- Switch AI provider (Claude vs Copilot)
map('n', '<leader>ap', function()
  local providers = {
    { name = "claude", display = "Claude (Anthropic)" },
    { name = "copilot", display = "Copilot (GitHub)" },
  }
  
  vim.ui.select(providers, {
    prompt = "Select AI Provider:",
    format_item = function(item)
      return item.display
    end,
  }, function(choice)
    if choice then
      local config = require("avante.config")
      config.provider = choice.name
      vim.notify("✓ Switched to " .. choice.display .. "\n💡 Close and reopen Avante chat for change to take effect", vim.log.levels.INFO)
    end
  end)
end, { desc = 'Avante: Switch Provider (Claude/Copilot)' })

-- Switch Claude models
map('n', '<leader>am', function()
  local models = {
    "claude-sonnet-4-5-20250929",      -- Latest Claude 4.5 Sonnet via Anthropic API
    "claude-3-5-sonnet-20241022",      -- Claude 3.5 Sonnet (Oct 2024)
    "claude-3-opus-20240229",          -- Claude 3 Opus
    "claude-3-sonnet-20240229",        -- Claude 3 Sonnet
    "claude-3-haiku-20240307",         -- Claude 3 Haiku
  }
  
  vim.ui.select(models, {
    prompt = "Select Claude Model:",
    format_item = function(item)
      return item
    end,
  }, function(choice)
    if choice then
      local config = require("avante.config")
      config.provider = "claude"
      config.claude.model = choice
      vim.notify("✓ Switched to Claude: " .. choice .. "\n💡 Close and reopen Avante chat for change to take effect", vim.log.levels.INFO)
    end
  end)
end, { desc = 'Avante: Switch Claude Model' })

-- Switch Copilot models (GPT only)
map('n', '<leader>aM', function()
  local models = {
    { name = "gpt-4o-2024-11-20", display = "GPT-4o (2024-11-20) - Most capable ⭐" },
    { name = "gpt-4o-2024-08-06", display = "GPT-4o (2024-08-06)" },
    { name = "gpt-4o-2024-05-13", display = "GPT-4o (2024-05-13)" },
    { name = "gpt-4-turbo-2024-04-09", display = "GPT-4 Turbo" },
    { name = "gpt-3.5-turbo", display = "GPT-3.5 Turbo - Faster" },
    { name = "o1-preview", display = "o1-preview - Advanced reasoning" },
    { name = "o1-mini", display = "o1-mini - Fast reasoning" },
  }
  
  vim.ui.select(models, {
    prompt = "Select Copilot Model (GPT):",
    format_item = function(item)
      return item.display
    end,
  }, function(choice)
    if choice then
      local config = require("avante.config")
      config.copilot.model = choice.name
      vim.notify("✓ Switched Copilot to " .. choice.display .. "\n💡 Close and reopen Avante chat for change to take effect", vim.log.levels.INFO)
    end
  end)
end, { desc = 'Avante: Switch Copilot Model (GPT)' })

-- Edit Avante config file directly
map('n', '<leader>aE', function()
  vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/lua/plugins/avante.lua')
  vim.notify("💡 Edit models here, then restart Nvim", vim.log.levels.INFO)
end, { desc = 'Avante: Edit Config (to change models)' })

-- Avante Diff Keymaps (manually set since auto_set_keymaps is disabled)
-- These work when viewing diffs in Avante
map('n', 'co', '<cmd>AvanteConflictOurs<cr>', { desc = 'Avante: Choose Ours (reject AI)' })
map('n', 'ct', '<cmd>AvanteConflictTheirs<cr>', { desc = 'Avante: Choose Theirs (accept AI)' })
map('n', 'ca', '<cmd>AvanteConflictAllTheirs<cr>', { desc = 'Avante: Accept All AI changes' })
map('n', 'c0', '<cmd>AvanteConflictNone<cr>', { desc = 'Avante: Reject All AI changes' })
map('n', 'cb', '<cmd>AvanteConflictBoth<cr>', { desc = 'Avante: Keep Both' })
map('n', ']x', '<cmd>AvanteConflictNextConflict<cr>', { desc = 'Avante: Next conflict' })
map('n', '[x', '<cmd>AvanteConflictPrevConflict<cr>', { desc = 'Avante: Previous conflict' })
