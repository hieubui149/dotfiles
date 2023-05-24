-- [[ Configure renamer ]]
local mappings_utils = require('renamer.mappings.utils')
require('renamer').setup {
  title = 'Rename',
  padding = {
      top = 0,
      left = 0,
      bottom = 0,
      right = 0,
  },
  border = true,
  min_width = 15,
  max_width = 45,
  border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
  show_refs = true,
  with_popup = true,
  with_qf_list = true,
}
vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
