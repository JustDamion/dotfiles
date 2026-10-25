local treesitter = require("nvim-treesitter")
local max_jobs = 4

treesitter.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

treesitter.install({
	"bash",
	"c",
	"css",
	"diff",
	"dockerfile",
	"git_config",
	"gitcommit",
	"gitignore",
	"html",
	"javascript",
	"json",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"rust",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}, { max_jobs = max_jobs })

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
	desc = "Start Treesitter highlighting when a parser is available",
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("UserTreesitterUpdate", { clear = true }),
	callback = function(args)
		if args.data.spec.name == "nvim-treesitter" and args.data.kind == "update" then
			if not args.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			require("nvim-treesitter").update(nil, { max_jobs = max_jobs, summary = true })
		end
	end,
})
