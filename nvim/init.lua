vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim"
})

require("config.options")
require("plugins.mason")
require("plugins.mini")
require("nvim-treesitter").setup()
require("plugins.formatting")
