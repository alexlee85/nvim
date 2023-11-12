return {
  -- add gruvbox
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   opts = {
  --     transparent_mode = false,
  --   },
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
