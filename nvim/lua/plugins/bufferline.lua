return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      indicator = {
        -- icon = "▎",
        -- style = "underline",
      },
      diagnostics = "nvim_lsp",
      -- separator_style = "slant",
    },
    highlights = {
      buffer_selected = {
        -- underline = true,
        undercurl = false,
        fg = "#15d69e",
      },
      indicator_selected = {
        fg = "#15d69e",
        -- underline = true,
      },
    },
  },
}
