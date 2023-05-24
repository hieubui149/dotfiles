-- [[ Configure Mini Packages ]]
require('mini.bracketed').setup()
require('mini.animate').setup({
  scroll = {
    enable = false,
  },
  resize = {
    enable = false,
  },
  open = {
    enable = false,
  },
  close = {
    enable = false,
  },
})

require('mini.indentscope').setup({
  symbol = '|',
})
