require("mini.pick").setup({
	window = {
		config = function()
			return {
				width = math.min(100, math.floor(0.8 * vim.o.columns)),
				height = math.min(25, math.floor(0.7 * vim.o.lines)),
				border = "rounded",
			}
		end,
		prompt_prefix = "  ",
	},
})

local map = vim.keymap.set

map("n", "<leader>sf", function()
	MiniPick.builtin.files()
end, { desc = "[S]earch [F]iles" })

map("n", "<leader>sg", function()
	MiniPick.builtin.grep_live()
end, { desc = "[S]earch [G]rep" })

map("n", "<leader>sb", function()
	MiniPick.builtin.buffers()
end, { desc = "[S]earch [B]uffers" })

map("n", "<leader>sh", function()
	MiniPick.builtin.help()
end, { desc = "[S]earch [H]elp" })

map("n", "<leader>sd", function()
	MiniExtra.pickers.diagnostic()
end, { desc = "[S]earch [D]iagnostics" })

map("n", "<leader>sk", function()
	MiniExtra.pickers.keymaps()
end, { desc = "[S]earch [K]eymaps" })

map("n", "<leader>so", function()
	MiniExtra.pickers.oldfiles()
end, { desc = "[S]earch [O]ld files" })

map("n", "<leader>s/", function()
	MiniExtra.pickers.buf_lines({ scope = "current" })
end, { desc = "[S]earch current buffer" })

map("n", "<leader>sc", function()
	MiniExtra.pickers.commands()
end, { desc = "[S]earch [C]ommands" })

map("n", "<leader>sr", function()
	MiniPick.builtin.resume()
end, { desc = "[S]earch [R]esume" })
