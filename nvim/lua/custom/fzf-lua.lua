vim.keymap.set('n', '<leader>fg', "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true, desc = '[F]zf [G]rep' })
