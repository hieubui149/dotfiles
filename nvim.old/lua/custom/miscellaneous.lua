local autocmd = vim.api.nvim_create_autocmd   -- Create autocommands

-- [[ Configure Surround ]]
-- Doc :help nvim-surround
require("nvim-surround").setup()

-- [[ Configure vim-move ]]
vim.g.move_key_modifier = 'C'

-- vim.api.nvim_command('syntax on')
-- vim.api.nvim_command('filetype on')
-- vim.api.nvim_command('filetype plugin on')
-- vim.api.nvim_command('filetype indent on')

-- [[ Configure space stop by language ]]
autocmd('Filetype', { pattern = 'go', command = 'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4' })
autocmd('Filetype', { pattern = 'python', command = 'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4' })
autocmd('Filetype', { pattern = 'sql', command = 'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4' })
autocmd('Filetype', { pattern = 'lua', command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2' })
autocmd('Filetype', { pattern = 'ruby', command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2' })
autocmd('Filetype', { pattern = 'typescript', command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 formatprg=prettier\\ --parser\\ typescript' })
autocmd('Filetype', { pattern = 'typescript.tsx', command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 formatprg=prettier\\ --parser\\ typescript' })
autocmd('Filetype', { pattern = 'javascript', command = 'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 formatprg=prettier\\ --parser\\ javascript' })

-- [[ Configure lazygit ]]
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
-- vim.g.lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] -- customize lazygit popup window corner characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 0 -- fallback to 0 if neovim-remote is not installed

vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Open [L]azy[G]it' })
vim.keymap.set('n', '<leader>lgc', ':LazyGitConfig<CR>', { desc = 'Open [L]azy[G]it [C]onfig' })

-- Map paste to register 0
-- vim.keymap.set({ 'n', 'v' }, 'p', '"0p', { desc = '[P]aste from register 0', expr = true, silent = true })

-- [[ Common configuration ]]
autocmd('BufWritePre', { pattern = '*', command = "%s/\\s\\+$//e" })

-- [[ Common keymaps ]]
-- Paste without overriding register
-- vim.keymap.set({ 'n', 'v' }, 'p', 'pgvy', { desc = '[P]aste without overriding register' })

-- Configure util movements
vim.keymap.set({ 'n', 'v' }, '<Space>jh', '<c-w><c-h>', { desc = '[J]ump to Left Pane' })
vim.keymap.set({ 'n', 'v' }, '<Space>jj', '<c-w><c-j>', { desc = '[J]ump to Bottom Pane' })
vim.keymap.set({ 'n', 'v' }, '<Space>jk', '<c-w><c-k>', { desc = '[J]ump to Top Pane' })
vim.keymap.set({ 'n', 'v' }, '<Space>jl', '<c-w><c-l>', { desc = '[J]ump to Right Pane' })

-- Delay hjkl scroll but allow to single press
-- local last_press = 0
-- local cooldown = 100  -- 200ms delay

-- local function slow_move(key)
--   local now = vim.loop.now()
--   if now - last_press > cooldown then
--     last_press = now
--     return key
--   end
--   return ""
-- end
-- vim.keymap.set("n", "h", function() return slow_move("h") end, { expr = true, noremap = true, silent = true })
-- vim.keymap.set("n", "j", function() return slow_move("j") end, { expr = true, noremap = true, silent = true })
-- vim.keymap.set("n", "k", function() return slow_move("k") end, { expr = true, noremap = true, silent = true })
-- vim.keymap.set("n", "l", function() return slow_move("l") end, { expr = true, noremap = true, silent = true })

-- Copy file name / relative path / full path
vim.keymap.set('n', '<Space>cr', ':let @+=expand("%")<CR>', { desc = '[C]opy [R]elative path' })
vim.keymap.set('n', '<Space>cf', ':let @+=expand("%:p")<CR>', { desc = '[C]opy [F]ull path' })
vim.keymap.set('n', '<Space>cn', ':let @+=expand("%:t")<CR>', { desc = '[C]opy File [N]ame' })

-- Configure custom development keys
vim.keymap.set('v', '<c-c>', '"*y', { desc = 'Copy to clipboard registry' })
vim.keymap.set('n', 'Y', 'y$', { desc = '[Y]ank to the End of line' })
vim.keymap.set('n', 'v$', 'v$h', { desc = '[V]isual to the last character of line' })
vim.keymap.set('n', '<c-a>', 'ggVG', { desc = '[V]isual all textes of the current buffer' })
vim.keymap.set('n', '<S-j>n', 'i<CR><ESC>', { desc = 'Break cursor to a new line' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Keeping centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Keeping centered' })
vim.keymap.set('n', '<leader>\\', '<c-^>', { desc = 'Switch between the last two buffers' })
vim.keymap.set('n', '<leader>zi', "<c-w>|", { desc = '[Z]oom In' })
vim.keymap.set('n', '<leader>zo', "<c-w>=", { desc = '[Z]oom [O]ut' })
vim.keymap.set('n', '<c-e>', 'A<ESC>', { desc = '[J]ump to the end of line' })
vim.keymap.set('n', '<c-i>', 'I<ESC>', { desc = '[J]ump to the start of line' })
vim.keymap.set('n', '<CR>', '<ESC>:noh<CR>', { desc = 'Clear console', silent = true })

-- Configure quick switch buffer format
vim.keymap.set('n', '<S-f><S-r>', ':set ft=ruby<ESC>', { desc = '[F]ormat [R]uby current buffer' })
vim.keymap.set('n', '<S-f><S-j>', ':set ft=json<ESC>', { desc = '[F]ormat [J]ON current buffer' })
vim.keymap.set('n', '<S-f><S-m>', ':set ft=markdown<ESC>', { desc = '[F]ormat [M]arkdown current buffer' })

-- Configure quick show/hide line number
vim.keymap.set('n', '<c-l><c-l>', ':set invrelativenumber<CR>', { desc = 'Show [L]ine Inv Relative Number' })
vim.keymap.set('n', '<c-l><c-n>', ':set number<CR>', { desc = 'Show [L]ine [N]umber' })
vim.keymap.set('n', '<c-l><c-o>', ':set nonumber<CR>', { desc = 'Hide [L]ine Number' })

-- Vim config easy access
vim.keymap.set('n', '<c-v><c-o>', ':vnew ~/.config/nvim/init.lua<CR>', { desc = 'Open n[V]im config in vertical pane' })
vim.keymap.set('n', '<c-v><c-i>', ':source ~/.config/nvim/init.lua<CR>', { desc = 'Reload n[V]im config in vertical pane' })

-- Format JSON file
vim.keymap.set('n', '<leader>CFJ', ':%!jq .<CR>', { desc = '[F]ormat [J]SON' })

-- Config folding
vim.keymap.set("n", "<leader>fi", "zMzvzz", { desc = "Fold at current indentation level" })
vim.keymap.set("n", "<leader>ui", "zRzvzz", { desc = "Unfold at current indentation level" })
