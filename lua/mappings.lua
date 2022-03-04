local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

map("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "

-- 窗口之间移动
map("n", "<leader>wj", "<C-w>j", default_options)
map("n", "<leader>wk", "<C-w>k", default_options)
map("n", "<leader>wh", "<C-w>h", default_options)
map("n", "<leader>wl", "<C-w>l", default_options)
map("n", "<leader>ww", "<C-w>w", default_options)

-- Toggle Term
map("n", "<leader>;", "<cmd>ToggleTerm<cr>", default_options)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", default_options)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", default_options)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", default_options)
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", default_options)
map("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", default_options)
map("n", "<leader>fc", "<cmd>Telescope lsp_code_actions<cr>", default_options)

map("n", "<leader>sq", "<cmd>lua require('rest-nvim').run()<CR>", default_options)

-- LSP
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", default_options)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_options)
map("n", "cn", "<cmd>lua vim.lsp.buf.rename()<CR>", default_options)
map("n", "cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", default_options)

-- Trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", default_options)
