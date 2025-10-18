-- Filename: coffeescript.lua
-- Last change: Fri, 17 Oct 2025, 11:06PM

vim.api.nvim_create_augroup('CoffeeScript', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.coffee',
  group = 'CoffeeScript',
  callback = function()
    local file = vim.fn.expand('%')
    local result = vim.fn.system('coffee -c ' .. file)

    if vim.v.shell_error ~= 0 then
      vim.notify('CoffeeScript Error:\n' .. result, vim.log.levels.ERROR)
    else
      vim.notify('Compiled successfully', vim.log.levels.INFO)
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'coffee',
  group = 'CoffeeScript',
  callback = function()
    local opts = { buffer = true, silent = true }

    -- Compile current file
    vim.keymap.set('n', '<leader>cc', ':!coffee -c %<CR>',
      vim.tbl_extend('force', opts, { desc = 'Compile CoffeeScript' }))

    -- Show compiled JavaScript
    vim.keymap.set('n', '<leader>cj', ':!coffee -p %<CR>',
      vim.tbl_extend('force', opts, { desc = 'Show compiled JS' }))

    -- Run CoffeeScript
    vim.keymap.set('n', '<leader>cr', ':!coffee %<CR>',
      vim.tbl_extend('force', opts, { desc = 'Run CoffeeScript' }))

    -- CoffeeLint (if installed)
    vim.keymap.set('n', '<leader>cl', ':!coffeelint %<CR>',
      vim.tbl_extend('force', opts, { desc = 'Lint CoffeeScript' }))
  end,
})

vim.filetype.add({
  extension = {
    coffee = 'coffee',
  },
})
