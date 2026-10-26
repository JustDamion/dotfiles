local map = vim.keymap.set

-- Search and navigation
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>e", function()
	MiniFiles.open()
end, { desc = "File explorer" })

-- Files
map("n", "<leader>fw", "<cmd>write<CR>", { desc = "Write file" })
map("n", "<leader>fq", "<cmd>quit<CR>", { desc = "Quit window" })

-- Buffers
map("n", "<leader>bd", function()
	MiniBufremove.delete(0, false)
end, { desc = "Delete buffer" })

-- Window resizing
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Better scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Keep selection when indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Code
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnostics at cursor" })
map({ "n", "x" }, "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })

-- Git
map("n", "<leader>go", function()
	MiniDiff.toggle_overlay()
end, { desc = "Toggle git overlay" })
