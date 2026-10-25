local group = vim.api.nvim_create_augroup("User", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	desc = "Briefly highlight yanked text",
	callback = function()
		vim.hl.on_yank({ timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	group = group,
	desc = "Reload files changed outside of Neovim",
	command = "checktime",
})

vim.api.nvim_create_autocmd("VimResized", {
	group = group,
	desc = "Keep window layout balanced on resize",
	command = "tabdo wincmd =",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	desc = "Restore cursor position from the last visit",
	callback = function(args)
		local row, col = unpack(vim.api.nvim_buf_get_mark(args.buf, '"'))
		if row > 0 and row <= vim.api.nvim_buf_line_count(args.buf) then
			pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "checkhealth", "help", "lspinfo", "man", "qf" },
	desc = "Keep utility buffers out of the buffer list",
	callback = function(args)
		vim.bo[args.buf].buflisted = false
	end,
})
