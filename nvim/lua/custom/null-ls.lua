local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.rufo.with({
            filetypes = { "rb" },
        }),
        -- null_ls.builtins.formatting.rubyfmt.with({
        --     filetypes = { "rb" },
        -- })
    },
})

vim.cmd('map <Leader>nf :lua vim.lsp.buf.format(nil, 10000)<CR>')
vim.cmd('map <Leader>nF :lua vim.lsp.buf.range_formatting()<CR>')

vim.lsp.buf.format({ timeout_ms = 2000 })
