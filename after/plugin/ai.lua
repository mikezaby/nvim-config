local codecompanion = require("codecompanion")
local adapters = require("codecompanion.adapters")

codecompanion.setup({
	adapters = {
		anthropic = function()
			return adapters.extend("anthropic", {
				env = {
					api_key = "ANTHROPIC_API_KEY", -- This will read from environment variable
				},
			})
		end,
	},
	strategies = {
		chat = { adapter = "anthropic" },
		inline = { adapter = "anthropic" },
		cmd = { adapter = "anthropic" },
	},
})

vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<cr>", { desc = "CodeCompanion Chat" })
vim.keymap.set("v", "<leader>cc", "<cmd>CodeCompanionChat<cr>", { desc = "CodeCompanion Chat" })
vim.keymap.set("n", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Actions" })
vim.keymap.set("v", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Actions" })
vim.keymap.set("n", "<leader>ct", "<cmd>CodeCompanionToggle<cr>", { desc = "CodeCompanion Toggle" })
vim.keymap.set("n", "<leader>ce", "<cmd>CodeCompanion explain<cr>", { desc = "CodeCompanion Explain" })
vim.keymap.set("v", "<leader>ce", "<cmd>CodeCompanion explain<cr>", { desc = "CodeCompanion Explain" })
vim.keymap.set("n", "<leader>cf", "<cmd>CodeCompanion fix<cr>", { desc = "CodeCompanion Fix" })
vim.keymap.set("v", "<leader>cf", "<cmd>CodeCompanion fix<cr>", { desc = "CodeCompanion Fix" })
vim.keymap.set("n", "<leader>cr", "<cmd>CodeCompanion review<cr>", { desc = "CodeCompanion Review" })
vim.keymap.set("v", "<leader>cr", "<cmd>CodeCompanion review<cr>", { desc = "CodeCompanion Review" })
