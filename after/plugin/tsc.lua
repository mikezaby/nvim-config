require("tsc").setup({
	auto_open_qflist = true,
	use_trouble_qflist = false,

	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "*.ts", "*.tsx" },
		callback = function()
			vim.cmd("TSC")
		end,
	}),
})
