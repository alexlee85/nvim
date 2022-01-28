-- neovim options
-- vim.o: behaves like :set
-- vim.go: behaves like :setglobal
-- vim.bo: behaves like :setlocal for buffer-local options
-- vim.wo: behaves like :setlocal for window-local options
-- global options vim.opt is more convenient
local opt = vim.opt

opt.background = 'dark'
opt.cursorline = true -- 高亮当前行
opt.splitright = true
opt.splitbelow = true
opt.showmatch = true
opt.ignorecase = true
opt.mouse = 'v' -- 鼠标中健点粘贴
opt.hlsearch = true
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.wildmode = {'longest', 'list'}
opt.cc = '100'
opt.list = true

opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

vim.api.nvim_command [[
  filetype plugin indent on
  syntax on
  colorscheme gruvbox
  autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<cr>
  autocmd BufWrite *.lua call LuaFormat()
]]

vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "gruvbox"
vim.g["airline#extensions#tabline#enabled"] = 1

vim.g.rustfmt_autosave = 1
