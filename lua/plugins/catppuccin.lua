local plugin = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  config = function ()
    require("catppuccin").setup({
      flavour = "macchiato",
      background = {
        dark = "macchiato"
      },
      transparent_background = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}

return plugin
