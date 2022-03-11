local nvim_lsp = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

nvim_lsp.sumneko_lua.setup {
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
  tools = {autoSetHints = false},
  crate_graph = {backend = "dot"},
})

-- require("lsp_signature").setup({
--   bind = true, -- This is mandatory, otherwise border config won't get registered.
--   floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
--   doc_lines = 2, -- Set to 0 for not showing doc
--   hint_prefix = "💡 ",
--   max_width = 100,
--   -- use_lspsaga = false,  -- set to true if you want to use lspsaga popup
--   handler_opts = {
--     border = "rounded", -- rounded, double, single, shadow, none
--   },
-- })
