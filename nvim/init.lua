vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
})

require("config")
require("nvim-treesitter").setup()
require("plugins.mason")
require("plugins.mini")
require("plugins.formatting")
require("plugins.blink")
