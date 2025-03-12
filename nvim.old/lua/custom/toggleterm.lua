require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
    width = 100,
    height = 30,
    title_pos = 'center',
  },
}
-- :ToggleTerm size=40 dir=~/Desktop direction=horizontal name=desktop
vim.keymap.set('n', '<leader>ttc', ':ToggleTerm dir=./ direction=float<CR>', { desc = '[T]oggle[T]erm [C]urrent Directory' })
