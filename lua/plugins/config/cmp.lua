local lspkind = require("lspkind")
local cmp = require("cmp")

cmp.setup({
  completion = {completeopt = "menu,menuone,noselect"},
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 150, -- prevent the popup from showing more than provided characters

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization.
      -- (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        -- vim_item.kind = lspkind.presets.default[vim_item.kind]
        vim_item.menu = ({
          buffer = "[BUF]",
          nvim_lsp = "[LSP]",
          path = "[PATH]",
          vsnip = "[SNIP]",
          calc = "[CALC]",
          spell = "[SPELL]",
          emoji = "[EMOJI]",
        })[entry.source.name]
        return vim_item
      end,
    }),
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {},
  view = {},
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({select = true}),
  }),
  sources = cmp.config.sources({
    {name = "nvim_lsp"},
    {name = "vsnip"}, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {{name = "buffer"}}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/",
                  {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}}),
})
