return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "java",
        "xml",
        "markdown",
        "markdown_inline",
        "ron",
        "rust",
        "go",
        "toml",
        "html",
        "css",
        "typescript",
        "tsx",
        "json",
        "json5",
        "jsonc",
      })
    end
  end,
}
