require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"stylua",
		"oxfmt",
		"oxlint",
	},
	automatic_enable = {
		"lua_ls",
		"ts_ls",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "[H]over" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
