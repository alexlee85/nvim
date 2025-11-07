local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
  end,
})
