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
		"tailwindcss",
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

plainLsp.tsserver.setup({
	root_dir = require("lspconfig.util").find_git_ancestor,
})

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

		-- Got to definition, open to new tab or go to already opened file
		vim.keymap.set("n", "gd", function()
			local params = vim.lsp.util.make_position_params()
			vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
				if not result or vim.tbl_isempty(result) then
					vim.notify("No definition found", vim.log.levels.INFO)
					return
				end
				local def = result[1]
				local uri = def.uri or def.targetUri
				local range = def.range or def.targetRange
				local fname = vim.uri_to_fname(uri)

				-- Check if buffer is open in any tab
				for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
					for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
						local bufnr = vim.api.nvim_win_get_buf(win)
						if vim.api.nvim_buf_get_name(bufnr) == fname then
							vim.api.nvim_set_current_tabpage(tab)
							vim.api.nvim_set_current_win(win)
							-- Jump to location
							vim.api.nvim_win_set_cursor(win, { range.start.line + 1, range.start.character })
							return
						end
					end
				end

				-- Not found, open in new tab
				vim.cmd("tabnew " .. fname)
				local win = vim.api.nvim_get_current_win()
				vim.api.nvim_win_set_cursor(win, { range.start.line + 1, range.start.character })
			end)
		end, { desc = "Go to LSP definition (reuse tab if open, else new tab)" })

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
