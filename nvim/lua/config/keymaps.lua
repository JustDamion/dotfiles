local map = vim.keymap.set

-- Search
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Files and windows
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Write file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>bd", function()
	MiniBufremove.delete(0, false)
end, { desc = "Delete buffer" })

-- Window navigation
for _, key in ipairs({ "h", "j", "k", "l" }) do
	map("n", "<C-" .. key .. ">", "<C-w>" .. key, { desc = "Go to window " .. key })
end

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

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostics at cursor" })

-- Formatting
map({ "n", "x" }, "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
