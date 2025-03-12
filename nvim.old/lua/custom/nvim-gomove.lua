-- [[ Configure nvim-gomove ]] ]]

local map = vim.api.nvim_set_keymap
map( "n", "<C-j>", "<Plug>GoNSMDown", {} )
map( "n", "<C-k>", "<Plug>GoNSMUp", {} )
map( "x", "<C-j>", "<Plug>GoVSMDown", {} )
map( "x", "<C-k>", "<Plug>GoVSMUp", {} )
