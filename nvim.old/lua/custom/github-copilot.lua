-- [[ Configure Github Copilot ]]
vim.g.copilot_autostart = 1
vim.g.copilot_autostart_delay = 5
vim.g.copilot_autostart_filetypes = { "ruby", "javascript", "typescript" }

vim.keymap.set("i", "<c-j>", 'copilot#Accept("\\<CR>")', {
	desc = "Copilot#Accept()",
	expr = true,
	replace_keycodes = false,
})
-- Disable default Github Copilot <TAB> accept
vim.g.copilot_no_tab_map = true

vim.keymap.set("i", "<c-u>", function()
	vim.cmd("call copilot#Next()")
end, { desc = "Copilot#Next()", silent = true })
vim.keymap.set("i", "<c-i>", function()
	vim.cmd("call copilot#Previous()")
end, { desc = "Copilot#Previous()", silent = true })

-- Change Github Copilot highlight
vim.api.nvim_set_hl(0, "CopilotSuggestion", { ctermbg = 203, fg = "#F02E6E" })

vim.g.copilot_assume_mapped = false

-- Copilot Chat
-- require("CopilotChat").setup({
-- 	debug = false, -- Enable debugging
-- 	separator = "---",
-- 	window = {
-- 		layout = "float", -- 'vertical', 'horizontal', 'float'
-- 		-- Options below only apply to floating windows
-- 		relative = "cursor", -- 'editor', 'win', 'cursor', 'mouse'
-- 		border = "double", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
-- 		width = 1,
-- 		height = 0.4,
-- 		row = 1,
-- 		title = "Copilot Chat", -- title of chat window
-- 		footer = nil, -- footer of chat window
-- 		zindex = 1, -- determines if window is on top or below other floating windows
-- 	},
-- 	prompts = {
-- 		Summarize = { prompt = "Please summarize the following text." },
-- 		Spelling = { prompt = "Please correct any grammar and spelling errors in the following text." },
-- 		Wording = { prompt = "Please improve the grammar and wording of the following text." },
-- 		Concise = { prompt = "Please rewrite the following text to make it more concise." },
-- 	},
-- })
-- vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "CopilotChat - Toggle" })
-- vim.keymap.set(
-- 	{ "n", "v" },
-- 	"<leader>ccb",
-- 	"<cmd>CopilotChatBuffer<cr>",
-- 	{ desc = "CopilotChat - Chat with current buffer" }
-- )
-- vim.keymap.set({ "n", "v" }, "<leader>cce", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat - Explain code" })
-- vim.keymap.set({ "n", "v" }, "<leader>cct", "<cmd>CopilotChatTests<cr>", { desc = "CopilotChat - Generate tests" })
-- vim.keymap.set(
-- 	{ "n", "v" },
-- 	"<leader>ccT",
-- 	"<cmd>CopilotChatVsplitToggle<cr>",
-- 	{ desc = "CopilotChat - Toggle Vsplit" }
-- )
-- vim.keymap.set("x", "<leader>ccv", "CopilotChatVisual ", { desc = "CopilotChat - Open in vertical split" })
-- vim.keymap.set("x", "<leader>ccx", ":CopilotChatInPlace<cr>", { desc = "CopilotChat - Run in-place code" })
-- vim.keymap.set(
-- 	{ "n", "v" },
-- 	"<leader>ccf",
-- 	"<cmd>CopilotChatFixDiagnostic<cr>",
-- 	{ desc = "CopilotChat - Fix diagnostic" }
-- )
-- vim.keymap.set(
-- 	{ "n", "v" },
-- 	"<leader>ccr",
-- 	"<cmd>CopilotChatReset<cr>",
-- 	{ desc = "CopilotChat - Reset chat history and clear buffer" }
-- )
-- vim.keymap.set("n", "<leader>cch", function()
-- 	local actions = require("CopilotChat.actions")
-- 	require("CopilotChat.integrations.telescope").pick(actions.help_actions())
-- end, { desc = "CopilotChat - Help actions" })
-- vim.keymap.set("n", "<leader>ccp", function()
-- 	local actions = require("CopilotChat.actions")
-- 	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
-- end, { desc = "CopilotChat - Prompt actions" })
-- vim.keymap.set("n", "<leader>ccq", function()
-- 	local input = vim.fn.input("Quick Chat: ")
-- 	if input ~= "" then
-- 		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
-- 	end
-- end, { desc = "CopilotChat - Quick chat" })
