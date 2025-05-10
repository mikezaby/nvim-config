-- Setup spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- Set the characters for displaying tabs and trailing spaces
vim.opt.listchars = { tab = ">-", space = "·" }
vim.opt.list = true

vim.opt.wrap = false
vim.opt.number = true
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Set vsplit buffer to right
vim.opt.splitright = true

-- UI for diagnostic
vim.diagnostic.config({
	virtual_text = true, -- inline text (set to false if you dislike it)
	signs = true, -- signs in gutter
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always", -- shows the source (e.g., eslint)
		header = "",
		prefix = "",
	},
})
