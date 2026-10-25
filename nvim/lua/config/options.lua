vim.loader.disable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true
vim.o.inccommand = "split"
vim.o.cursorline = false
vim.o.scrolloff = 12
vim.o.confirm = true

vim.opt.listchars = { tab = "» ", trail = ".", nbsp = "␣" }
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

require("tokyonight").setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})
vim.cmd([[colorscheme tokyonight]])
