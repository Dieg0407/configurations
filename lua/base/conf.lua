-- Base global configurations
local configurations = {}

function configurations.load_conf() 
  vim.opt.clipboard = "unnamedplus" --setup global clipboard
  vim.opt.termguicolors = true

  vim.opt.tabstop = 2 --width of tab to 2
  vim.opt.shiftwidth = 2 --each level of indentation uses 2
  vim.opt.expandtab = true --use spaces instead of tab
  vim.bo.softtabstop = 2 --number of spaces press or backspace

  vim.o.mouse = "a" --enable mouse support

  -- setup space as leader key
  vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- enable numlines
  vim.wo.number = true
end

return configurations
