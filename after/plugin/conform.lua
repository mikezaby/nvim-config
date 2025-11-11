local conform = require("conform")

conform.setup({
	formatters = {
		prettier = {
			require_cwd = true,
		},
	},
	formatters_by_ft = {
		rust = { "rustfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier", "stylelint" },
		typescriptreact = { "prettier", "stylelint" },
		svelte = { "prettier" },
		css = { "prettier", "stylelint" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		mdx = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
		nix = { "nixfmt" },
		kotlin = { "ktlint" },
	},
	format_on_save = {
		lsp_fallback = false,
		async = false,
		timeout_ms = 2000,
	},
})
