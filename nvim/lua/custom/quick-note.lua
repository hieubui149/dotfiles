-- [[ Config quick note ]]

local map = vim.api.nvim_set_keymap
map("n", "<leader>tlG", "<CMD>:lua require('quicknote').ListNotesForGlobal()<CR>", { desc = 'Quick [N]ote [L]ist at [G]lobal' })
map("n", "<leader>tnG", "<CMD>:lua require('quicknote').NewNoteAtGlobal()<CR>", { desc = 'Quick [N]ote [N]ew at [G]lobal' })
map("n", "<leader>toG", "<CMD>:lua require('quicknote').OpenNoteAtGlobal()<CR>", { desc = 'Quick [N]ote [O]pen at [G]lobal' })
map("n", "<leader>tdG", "<CMD>:lua require('quicknote').DeleteNoteAtGlobal()<CR>", { desc = 'Quick [N]ote [D]elete at [G]lobal' })

map("n", "<leader>tlC", "<CMD>:lua require('quicknote').ListNotesForCWD()<CR>", { desc = 'Quick [N]ote [L]ist at [C]urrent Directory' })
map("n", "<leader>tnC", "<CMD>:lua require('quicknote').NewNoteAtCWD()<CR>", { desc = 'Quick [N]ote [N]ew at [C]urrent Directory' })
map("n", "<leader>toC", "<CMD>:lua require('quicknote').OpenNoteAtCWD()<CR>", { desc = 'Quick [N]ote [O]pen at [C]urrent Directory' })
map("n", "<leader>tdC", "<CMD>:lua require('quicknote').DeleteNoteAtCWD()<CR>", { desc = 'Quick [N]ote [O]pen at [C]urrent Directory' })
