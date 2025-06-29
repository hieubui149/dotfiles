-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- [[ Custom options ]]
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Turn off auto format
vim.g.autoformat = false

vim.opt.relativenumber = true
vim.opt.colorcolumn = "120"
vim.opt.encoding = "utf8"
vim.opt.confirm = true
vim.g.nopaste = true
vim.g.linespace = 1

vim.g.copilot_no_tab_map = true

-- LSP settings
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

vim.opt.scrolloff = 3 -- Keep some context when scrolling (default: 3)
vim.opt.sidescrolloff = 5 -- Context for side scrolling
vim.opt.smoothscroll = false -- 🚀 Disable any extra smooth scrolling behavior
