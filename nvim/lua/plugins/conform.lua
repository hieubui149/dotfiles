return {
  "stevearc/conform.nvim",
  opts = {
    notify_no_formatters = true,
    formatters_by_ft = {
      -- lua = { "stylua", },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },

      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
      ruby = { "rubyfmt", lsp_format = "never" },
    },
  },
}
