return {
  "iamcco/markdown-preview.nvim",
  dependencies = { "aklt/plantuml-syntax" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "md", "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
