require('hlchunk').setup({
  context = {
    use_treesitter = true,
    chars = { "│", "¦", "┆", "┊", },
    support_filetypes = {
      "*.lua",
      "*.js",
      "*.ts",
      "*.rb",
    },
  },
  blank = {
    enable = false,
    use_treesitter = false,
    chars = { "│", "¦", "┆", "┊", },
    support_filetypes = {
      "*.lua",
      "*.js",
      "*.ts",
      "*.rb",
    },
  },
  indent = {
    enable = true,
    use_treesitter = false,
    chars = { "│", "¦", "┆", "┊", },
    style = {
      { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") }
    },
    support_filetypes = {
      "*.lua",
      "*.js",
      "*.ts",
      "*.rb",
    },
  },
  chunk = {
    enable = true,
    use_treesitter = true,
    support_filetypes = {
      "*.lua",
      "*.js",
      "*.ts",
      "*.rb",
    },
    chars = {
      horizontal_line = "━",
      vertical_line = "┃",
      left_top = "┏",
      left_bottom = "┗",
      right_arrow = "▶",
    },
    -- style = "#82aaff",
    style = "#A7C080",
    error_sign = true,
    textobject = "",
    max_file_size = 1024 * 1024,
  },
  line_num = {
    enable = true,
    use_treesitter = true,
    -- style = "#82aaff",
    style = "#A7C080",
    support_filetypes = {
      "*.lua",
      "*.js",
      "*.ts",
      "*.rb",
    },
  },
})
