local nvim_lsp = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      cmd = {"lua-language-server"},
      filetypes = {"lua"},
      runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
      completion = {enable = true, callSnippet = "Both"},
      diagnostics = {
        enable = true,
        globals = {"vim", "describe"},
        disable = {"lowercase-global"},
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
        -- adjust these two values if your performance is not optimal
        maxPreload = 2000,
        preloadFileSize = 1000,
      },
      telemetry = {enable = false},
    },
  },
}

require"lspconfig".solc.setup {}
require"lspconfig".volar.setup {
  init_options = {
    typescript = {
      tsdk = "/Users/alex/Library/Caches/fnm_multishells/31790_1695264071086/lib/node_modules/typescript/lib",
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    },
  },
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "json",
  },
}

nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  init_options = {lint = true},
}

nvim_lsp.denols.setup {
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("deno.json"),
  init_options = {lint = true},
}

nvim_lsp.gopls.setup {}

require("rust-tools").setup({
  tools = {
    inlay_hints = {
      auto = true,
      only_current_line = false,
      max_len_align = false,
      max_len_align_padding = 1,
      locationLinks = false,
    },
  },
  server = {settings = {["rust-analyzer"] = {inlayHints = {locationLinks = false}}}},
  crate_graph = {backend = "dot"},
})

require("mason").setup()
require("mason-lspconfig").setup()
