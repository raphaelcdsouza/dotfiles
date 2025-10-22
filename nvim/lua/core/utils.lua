-- Filename: utils.lua
-- Last change: Tue, 21 Oct 2025, 10:30PM
-- vim: set ts=2 sw=2 tw=78 et nospell:

local vim = vim
local fn = vim.fn -- access vim functions
local uv = vim.uv

local M = {}

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

return M
