-- scheme
lvim.colorscheme = "slate"

-- plugins
lvim.plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter"
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  }
}

-- copilot configuration: https://medium.com/aimonks/a-guide-to-integrating-lunarvim-github-copilot-61d92f764913
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

-- bindings
lvim.keys.normal_mode["<leader>ff"] = ":Telescope"
lvim.keys.normal_mode["<leader>f"] = false

-- formatting
lvim.format_on_save.enabled = true
