return {
  -----------------------------------------------------
  -- setup gruvbox
  -----------------------------------------------------

  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = false,
    },
  },

  -----------------------------------------------------

  -----------------------------------------------------
  -- setup tokyonight
  -----------------------------------------------------

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      style = "moon",
      styles = {
        sidebars = "transparent",
      },
    },
  },

  -----------------------------------------------------

  -----------------------------------------------------
  -- setup catppuccin
  -----------------------------------------------------

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = false,
      color_overrides = {
        all = {
          -- text = "#ffffff",
        },
        latte = {
          -- base = "#ff0000",
          -- mantle = "#242424",
          -- crust = "#474747",
        },
        frappe = {},
        macchiato = {},
        mocha = {},
      },
    },
  },

  -- fix bufferline bug
  -- {
  --   "akinsho/bufferline.nvim",
  --   init = function()
  --     local bufline = require("catppuccin.groups.integrations.bufferline")
  --     function bufline.get()
  --       return bufline.get_theme()
  --     end
  --   end,
  -- },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "catppuccin-macchiato", -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    },
  },

  -----------------------------------------------------
}
