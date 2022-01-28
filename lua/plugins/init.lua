local execute = vim.api.nvim_command
local fn = vim.fn

-- 根据插件名称引入配置
function get_config(name)
  return string.format("require('plugins/config/%s')", name)
end

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- 如果没有安装packer，安装之。。。
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

-- 初始化packer
local packer = require("packer")
packer.init {
  -- enable profiling via :PackerCompile profile=true
  enable = true,
  -- the amount in ms that a plugins load time must be over for it to be included in the profile
  threshold = 0
}
local use = packer.use
packer.reset()

use 'wbthomason/packer.nvim'

use 'morhetz/gruvbox'
-- 平滑滚动
use {'karb94/neoscroll.nvim', config = get_config("neoscroll")}
-- 自动括号
use 'jiangmiao/auto-pairs'
-- 添加，删除，替换字符对
use 'tpope/vim-surround'
-- 语法检查
use 'scrooloose/syntastic'
-- Git插件
use 'tpope/vim-fugitive'
use 'airblade/vim-gitgutter'

use {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("indent_blankline").setup {
      show_end_of_line = true,
      show_current_context = true,
      show_current_context_start = true
    }
  end
}

use 'andrejlevkovitch/vim-lua-format'

use {'kyazdani42/nvim-web-devicons', config = get_config("web-devicons")}

use 'vim-airline/vim-airline'
use 'vim-airline/vim-airline-themes'

use {'akinsho/toggleterm.nvim', config = get_config("toggleterm")}

use {
  "nvim-telescope/telescope.nvim",
  requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
  config = get_config("telescope")
}
use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

use {
  "hrsh7th/nvim-cmp",
  requires = {
    {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-vsnip"},
    {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}}
  },
  config = get_config("cmp")
}

use {"onsails/lspkind-nvim", requires = {{"famiu/bufdelete.nvim"}}}

use {
  "nvim-treesitter/nvim-treesitter",
  config = get_config("treesitter"),
  run = ":TSUpdate"
}

use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use {
  "neovim/nvim-lspconfig",
  requires = {{"rust-lang/rust.vim"}, {"simrat39/rust-tools.nvim"}},
  config = get_config("lsp")
}

use {"ray-x/lsp_signature.nvim", requires = {{"neovim/nvim-lspconfig"}}}