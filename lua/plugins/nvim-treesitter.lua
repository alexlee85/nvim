return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml", "typescript", "tsx", "json", "json5", "jsonc" })
    end
  end,
}
