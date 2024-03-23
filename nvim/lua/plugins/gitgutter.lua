return {
  {
    "airblade/vim-gitgutter",
    lazy = false,
    config = function ()
      vim.opt.updatetime = 100;
      vim.opt.signcolumn = "auto";
    end
  }
}
