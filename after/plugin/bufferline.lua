require("bufferline").setup({
  options = {
    mode = "tabs", -- set to "tabs" to only show tabpages instead
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get()
})
