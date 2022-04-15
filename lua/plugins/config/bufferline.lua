local bufferline = require("bufferline")

bufferline.setup {
  options = {
    mode = "buffers",
    offsets = {{filetype = "NvimTree", text = "File Explorer"}},
    numbers = function(opts)
      return string.format("%s", opts.id)
    end,
  },
  highlights = {
    buffer_selected = {guibg = "#504945", gui = "NONE"},
    separator_selected = {guibg = "#504945"},
    close_button_selected = {guibg = "#504945"},
  },
}
