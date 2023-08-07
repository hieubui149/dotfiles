
vim.keymap.set({ 'n', 'v' }, '<leader>ajs', ':AnyJump<CR>', { desc = '[A]ny [J]ump [S]how' })
vim.keymap.set('n', '<leader>ajb', ':AnyJumpBack<CR>', { desc = '[A]ny [J]ump [B]ack' })
vim.keymap.set('n', '<leader>ajl', ':AnyJumpLastResults<CR>', { desc = '[A]ny [J]ump [L]ast Result' })
vim.keymap.set('n', '<leader>aja', ':AnyJumpArg ', { desc = '[A]ny [J]ump [A]rgument' })

vim.g.any_jump_window_width_ratio = 0.5
vim.g.any_jump_window_height_ratio = 0.8
vim.g.any_jump_window_top_offset = 10
