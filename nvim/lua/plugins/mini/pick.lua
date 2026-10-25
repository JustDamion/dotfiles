require("mini.pick").setup({
	window = {
		config = {
			width = 60,
			height = 15,
			border = "rounded",
		},
		prompt_prefix = "> ",
	},
})

vim.keymap.set("n", "<leader>sh", function()
	MiniPick.builtin.help()
end, { silent = true })

vim.keymap.set("n", "<leader>sf", function()
	MiniPick.builtin.files({ tool = "rg" })
end)
