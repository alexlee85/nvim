-- neovim options
-- vim.o: behaves like :set
-- vim.go: behaves like :setglobal
-- vim.bo: behaves like :setlocal for buffer-local options
-- vim.wo: behaves like :setlocal for window-local options

-- global options vim.opt is more convenient
local o = vim.opt

o.cursorline = true		-- 高亮当前行
o.splitright = true
o.splitbelow = true
o.showmatch = true
o.ignorecase = true
o.mouse = 'v'			-- 鼠标中健点粘贴
o.hlsearch = true
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.shiftwidth = 4
o.autoindent = true
o.number = true
o.relativenumber = true
o.wildmode = {'longest', 'list'}
o.cc = '100'

vim.api.nvim_command [[
    filetype plugin indent on
    syntax on
    colorscheme gruvbox
]]

vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "gruvbox"
vim.g["airline#extensions#tabline#enabled"] = 1

vim.g.rustfmt_autosave = 1


