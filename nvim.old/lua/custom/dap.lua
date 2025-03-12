local dap = require('dap')
local dapui = require("dapui")

dapui.setup()
require("dap-ruby").setup()

vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = '[D]AP [T]oggle Breakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]AP [C]ontinue' })
vim.keymap.set('n', '<leader>dso', dap.continue, { desc = '[D]AP [S]tep [O]ver' })
vim.keymap.set('n', '<leader>dsi', dap.continue, { desc = '[D]AP [S]tep [I]nto' })

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint', {text='🔸', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='❓', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapLogPoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🚓', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🆘', texthl='', linehl='', numhl=''})

-- - `DapBreakpoint` for breakpoints (default: `B`)
-- - `DapBreakpointCondition` for conditional breakpoints (default: `C`)
-- - `DapLogPoint` for log points (default: `L`)
-- - `DapStopped` to indicate where the debugee is stopped (default: `→`)
-- - `DapBreakpointRejected` to indicate breakpoints rejected by the debug
--   adapter (default: `R`)
