local keymap = vim.keymap.set

keymap("v", "p", "pgvy")
keymap("n", "<leader>hr", ":lua require('kulala').run()<CR>", { desc = "Run current http request" })
keymap("n", "<leader>hn", ":lua require('kulala').jump_next()<CR>", { desc = "go to Next http request" })
keymap("n", "<leader>hp", ":lua require('kulala').jump_prev()<CR>", { desc = "go to Prev http request" })
keymap("n", "<leader>he", ":lua require('kulala').set_selected_env()<CR>", { desc = "select http Environment" })
keymap("n", "<leader>ht", ":lua require('kulala').toggle_view()<CR>", { desc = "Toggle http view" })
