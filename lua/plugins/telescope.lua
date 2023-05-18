local plugin = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("telescope").setup {}
    vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>")
  end
}

return plugin
