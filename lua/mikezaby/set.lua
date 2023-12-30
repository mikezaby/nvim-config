-- Setup spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- Set the characters for displaying tabs and trailing spaces
vim.opt.listchars = { tab = '>-', space = '·' }
-- Enable displaying the listchars
vim.opt.list = true
-- Disable line wrapping
vim.opt.wrap = false
