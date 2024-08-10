local function set_tab_size(filetype, tabsize)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      vim.bo.tabstop = tabsize
      vim.bo.shiftwidth = tabsize
      vim.bo.expandtab = true -- Set to false if you prefer tabs instead of spaces
    end,
  })
end

-- setup base key bindings and settings
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.wo.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.expandtab = true

set_tab_size("python", 4)
set_tab_size("go", 4)
set_tab_size("javascript", 2)
set_tab_size("html", 2)
set_tab_size("lua", 2)
set_tab_size("rust", 4)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
