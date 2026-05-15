vim.treesitter.language.register("markdown", { "mdx" })

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if lang then
			pcall(vim.treesitter.install, { lang })
		end
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(ev)
		local max_filesize = 100 * 1024
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
		if ok and stats and stats.size > max_filesize then
			vim.treesitter.stop(ev.buf)
		end
	end,
})
