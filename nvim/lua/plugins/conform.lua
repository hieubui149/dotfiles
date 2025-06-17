return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {
      rubocop = {
        meta = {
          url = "https://github.com/rubocop/rubocop",
          description = "Ruby static code analyzer and formatter, based on the community Ruby style guide.",
        },
        command = "bundle",
        args = {
          "exec",
          "rubocop",
          "--server",
          "-a",
          "-f",
          "quiet",
          "--stderr",
          "--stdin",
          "$FILENAME",
        },
        exit_codes = { 0, 1 },
      },
    },
  },
}
