return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    autotag = {
      -- Setup autotag using treesitter config.
      enable = true,
    },
  },
}
