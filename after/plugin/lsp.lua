local lsp = require("lsp-zero")
local plainLsp = require("lspconfig")
local cmp = require("cmp")
local mason = require("mason")
local masonLsp = require("mason-lspconfig")

-- Setup Mason
mason.setup({})

-- Setup Mason-LSP with lsp-zero's handler
masonLsp.setup({
	ensure_installed = {
		"ts_ls",
		"eslint",
		"stylelint_lsp",
		"rust_analyzer",
		"ltex",
		"kotlin_language_server",
		"marksman",
	},
	automatic_enable = true,
})

-- Custom LSP servers not managed by mason
plainLsp.stylelint_lsp.setup({
	filetypes = {
		"astro",
		"css",
		"html",
		"less",
		"scss",
		"sugarss",
		"vue",
		"wxss",
		"javascriptreact",
		"typescriptreact",
	},
	settings = {},
})

plainLsp.gleam.setup({})

-- CMP setup
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float(nil, { border = "rounded" })
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>r", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})
