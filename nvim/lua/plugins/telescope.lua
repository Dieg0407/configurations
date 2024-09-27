return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary"
  },
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    dependencies = { "plenary" },
    lazy = false,
    tag = "0.1.6",
    opts = {
      defaults = {
        layout_config = {
          horizontal = {
            preview_cutoff = 0,
          },
        },
      }
    },
    config = function(PluginSpec, opts)
      require("telescope").setup(opts)
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end
  }
}
