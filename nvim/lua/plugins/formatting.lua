require("conform").setup({
	format_on_save = {
		timeout_ms = 8000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "oxfmt", "prettier", "prettierd", stop_after_first = true },
		javascriptreact = { "oxfmt", "prettier", "prettierd", stop_after_first = true },
		typescript = { "oxfmt", "prettier", "prettierd", stop_after_first = true },
		typescriptreact = { "oxfmt", "prettier", "prettierd", stop_after_first = true },
	},
})
