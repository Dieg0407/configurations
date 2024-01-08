local plugin = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- setup key bindings
    vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

    -- require nvim tree plugin
    require("nvim-tree").setup {}
  end
}

return plugin
