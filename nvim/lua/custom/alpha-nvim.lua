local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
dashboard.section.header.val = {
  [[                                              ]],
  [[                                              ]],
  [[    |_   _|__  _ __ ___   __ _ ___  |___  |   ]],
  [[      | |/ _ \| '_ ` _ \ / _` / __|    / /    ]],
  [[      | | (_) | | | | | | (_| \__ \   / /     ]],
  [[      |_|\___/|_| |_| |_|\__,_|___/  /_/      ]]
}
dashboard.section.buttons.val = {
  dashboard.button("-", "  Git Status", "<cmd>Telescope git_status <CR>"),
  dashboard.button("-", "  Find text", "<cmd>Telescope live_grep <CR>"),
  dashboard.button("-", "  Recent files", "<cmd>Telescope oldfiles <CR>"),
  dashboard.button("-", "󰑶  Mason (Manage LSP / Linters)", "<cmd>Mason<CR>"),
  dashboard.button("q", "  Quit NVIM" , ":qa<CR>"),
}
local handle = io.popen('fortune')
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune

dashboard.config.opts.noautocmd = true

vim.cmd[[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.config)

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
    pcall(vim.cmd.AlphaRedraw)
  end,
})
