-- neovim options
-- vim.o: behaves like :set
-- vim.go: behaves like :setglobal
-- vim.bo: behaves like :setlocal for buffer-local options
-- vim.wo: behaves like :setlocal for window-local options
-- global options vim.opt is more convenient
local opt = vim.opt

opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true -- 高亮当前行
opt.splitright = true
opt.splitbelow = true
opt.showmatch = true
opt.ignorecase = true
opt.mouse = "v" -- 鼠标中健点粘贴
opt.hlsearch = true
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.wildmode = {"longest", "list"}
opt.colorcolumn = {100}
opt.guifont = "Hack Nerd Font:12"

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

vim.g.gruvbox_contrast_light = "soft"
vim.g.gruvbox_contrast_dark = "hard"

-- vim.g.airline_left_sep = ""
-- vim.g.airline_left_alt_sep = ""
-- vim.g.airline_right_sep = " "
-- vim.g.airline_right_alt_sep = " "
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "gruvbox"
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#buffer_nr_show"] = 1
vim.g["airline#extensions#tabline#formatter"] = "unique_tail_improved"
vim.g["airline#extensions#tabline#fnamemod"] = ":t"

vim.g.rustfmt_autosave = 1

vim.g.go_doc_popup_window = 1
