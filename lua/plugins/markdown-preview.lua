return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "md", "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
