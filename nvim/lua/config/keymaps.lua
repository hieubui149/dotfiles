-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- LSP keymaps
-- Jump to the definition of the word under your cursor.
-- in a new vertical split
vim.keymap.set("n", "gv", function()
  vim.cmd("vsplit")
  vim.lsp.buf.definition()
end, { desc = "LSP: [G]oto [D]efinition [V]split" })
-- in a new horizontal split
vim.keymap.set("n", "gh", function()
  vim.cmd("split")
  vim.lsp.buf.definition()
end, { desc = "LSP: [G]oto [D]efinition [H]split" })

-- Utils for pane movement
vim.keymap.set({ "n", "v" }, "<Space>jh", "<c-w><c-h>", { desc = "[J]ump to Left Pane" })
vim.keymap.set({ "n", "v" }, "<Space>jj", "<c-w><c-j>", { desc = "[J]ump to Bottom Pane" })
vim.keymap.set({ "n", "v" }, "<Space>jk", "<c-w><c-k>", { desc = "[J]ump to Top Pane" })
vim.keymap.set({ "n", "v" }, "<Space>jl", "<c-w><c-l>", { desc = "[J]ump to Right Pane" })

-- Copy file name / relative path / full path
vim.keymap.set("n", "<Space>cp", ':let @+=expand("%")<CR>', { desc = "[C]opy [R]elative [P]ath" })
vim.keymap.set("n", "<Space>cf", ':let @+=expand("%:p")<CR>', { desc = "[C]opy [F]ull path" })
vim.keymap.set("n", "<Space>cn", ':let @+=expand("%:t")<CR>', { desc = "[C]opy File [N]ame" })

-- Utils for editing
vim.keymap.set("v", "<c-c>", '"*y', { desc = "Copy to clipboard registry" })
vim.keymap.set("n", "Y", "y$", { desc = "[Y]ank to the End of line" })
vim.keymap.set("n", "v$", "v$h", { desc = "[V]isual to the last character of line" })
vim.keymap.set("n", "<c-a>", "ggVG", { desc = "[V]isual all textes of the current buffer" })
vim.keymap.set("n", "<S-j>n", "i<CR><ESC>", { desc = "Break cursor to a new line" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keeping centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keeping centered" })
vim.keymap.set("n", "<leader>\\", "<c-^>", { desc = "Switch between the last two buffers" })
vim.keymap.set("n", "<leader>zi", "<c-w>|", { desc = "[Z]oom In" })
vim.keymap.set("n", "<leader>zo", "<c-w>=", { desc = "[Z]oom [O]ut" })
vim.keymap.set("n", "<c-e>", "A<ESC>", { desc = "[J]ump to the end of line" })
vim.keymap.set("n", "<c-i>", "I<ESC>", { desc = "[J]ump to the start of line" })
vim.keymap.set("n", "<CR>", "<ESC>:noh<CR>", { desc = "Clear console", silent = true })

-- Quick switch buffer format
vim.keymap.set("n", "<S-f><S-r>", ":set ft=ruby<ESC>", { desc = "[F]ormat [R]uby current buffer" })
vim.keymap.set("n", "<S-f><S-j>", ":set ft=json<ESC>", { desc = "[F]ormat [J]ON current buffer" })
vim.keymap.set("n", "<S-f><S-m>", ":set ft=markdown<ESC>", { desc = "[F]ormat [M]arkdown current buffer" })

-- Vim config easy access
vim.keymap.set("n", "<c-v><c-o>", ":vnew ~/.config/nvim/init.lua<CR>", { desc = "Open n[V]im config in vertical pane" })
vim.keymap.set(
  "n",
  "<c-v><c-i>",
  ":source ~/.config/nvim/init.lua<CR>",
  { desc = "Reload n[V]im config in vertical pane" }
)

-- Format JSON file
vim.keymap.set("n", "<leader>CFJ", ":%!jq .<CR>", { desc = "[F]ormat [J]SON" })

-- Config folding
vim.keymap.set("n", "<leader>fi", "zMzvzz", { desc = "Fold at current indentation level" })
vim.keymap.set("n", "<leader>ui", "zRzvzz", { desc = "Unfold at current indentation level" })

-- Grep with FZF
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true, desc = "[F]zf [G]rep" })

-- Github Copilot
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-u>", "<Cmd>call copilot#Next()<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-i>", "<Cmd>call copilot#Previous()<CR>", { silent = true })

-- Remap <Tab> to smarter tab completion to prioritize indentation but fall back to completion
-- or just tabbing if there is no completion available
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>" -- Select next item in completion menu
  elseif vim.fn.col(".") > 1 and string.match(vim.fn.getline("."):sub(1, vim.fn.col(".") - 1), "%S") then
    return "<C-n>" -- Trigger completion
  else
    return "<Tab>" -- Insert tab
  end
end, { expr = true })
