local map = vim.keymap.set

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = { spacing = 2, source = "if_many" },
	float = { border = "rounded", source = "always" },
	jump = { float = true },
})

require("mason").setup({ ui = { border = "rounded" } })

require("mason-lspconfig").setup({
	ensure_installed = {
		"basedpyright",
		"lua_ls",
		"oxlint",
		"ruff",
		"rust_analyzer",
		"ts_ls",
	},
	automatic_enable = {
		"basedpyright",
		"lua_ls",
		"oxlint",
		"ruff",
		"rust_analyzer",
		"ts_ls",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = { "oxfmt", "stylua", "tree-sitter-cli" },
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

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	desc = "Buffer-local LSP mappings",
	callback = function(args)
		local bufmap = function(keys, func, desc)
			map("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
		end

		bufmap("gd", vim.lsp.buf.definition, "Goto definition")
		bufmap("gD", vim.lsp.buf.declaration, "Goto declaration")
		bufmap("gy", vim.lsp.buf.type_definition, "Goto type definition")
		bufmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
		bufmap("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
		bufmap("<leader>cs", vim.lsp.buf.document_symbol, "Document symbols")
	end,
})
