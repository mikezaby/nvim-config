require("tsc").setup({
	auto_open_qflist = true,
	auto_close_qflist = true,
	auto_start_watch_mode = true,
	use_trouble_qflist = true,
	flags = {
		noEmit = true,
		project = function()
			return utils.find_nearest_tsconfig()
		end,
	},

	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "*.ts", "*.tsx" },
		callback = function()
			vim.cmd("TSC")
		end,
	}),
})
