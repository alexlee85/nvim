local telescope = require("telescope")

telescope.load_extension("fzf")

telescope.setup {
  defaults = {
    -- layout_strategy='vertical',
    layout_config = {
      -- vertical = { width = 0.5 }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}
