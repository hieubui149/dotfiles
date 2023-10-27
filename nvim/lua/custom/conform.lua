require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettier" } },
    javascriptreact = { { "prettier" } },
    typescript = { { "prettier" } },
    typescriptreact = { { "prettier" } },
    css = { { "prettier" } },
    vue = { { "prettier" } },
    scss = { { "prettier" } },
    html = { { "prettier" } },

    markdown = { { "prettier" } },

    json = { { "prettier" } },
    jsonc = { { "prettier" } },
  },
})
vim.keymap.set('n', '<leader>Cf', require'conform'.format, { desc='[C]onform [F]ormat' })
vim.keymap.set('n', '<leader>Ci', require'conform'.list_formatters, { desc='[C]onform [I]nfo' })
