-- [[ Configure winshift ]]

-- Start Win-Move mode:
vim.keymap.set('n', '<c-w><c-m>', ':WinShift<CR>' , { desc = '[W]inshift Start' })
vim.keymap.set('n', '<c-w>m', ':WinShift<CR>', { desc = 'Start Winshift' })

-- Swap two windows:
vim.keymap.set('n', '<c-w>x', ':WinShift swap<CR>', { desc = '[S]wap two windows' })

-- If you don't want to use Win-Move mode you can create mappings for calling the
-- move commands directly:
vim.keymap.set('n', '<c-w>h', ':WinShift left<CR>', { desc = 'Move window Left' })
vim.keymap.set('n', '<c-w>j', ':WinShift down<CR>', { desc = 'Move window Down' })
vim.keymap.set('n', '<c-w>k', ':WinShift up<CR>', { desc = 'Move window Up' })
vim.keymap.set('n', '<c-w>l', ':WinShift right<CR>', { desc = 'Move window Right' })
