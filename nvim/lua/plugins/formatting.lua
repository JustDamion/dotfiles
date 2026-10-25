require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		rust = { "rustfmt" },

		javascript = { "oxfmt" },
		javascriptreact = { "oxfmt" },
		typescript = { "oxfmt" },
		typescriptreact = { "oxfmt" },
		vue = { "oxfmt" },

		json = { "oxfmt" },
		jsonc = { "oxfmt" },
		yaml = { "oxfmt" },
		markdown = { "oxfmt" },
		css = { "oxfmt" },
		scss = { "oxfmt" },
		html = { "oxfmt" },
	},
	format_on_save = {
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})
