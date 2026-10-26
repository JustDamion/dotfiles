local map = vim.keymap.set

require("mini.icons").setup()

local notify = require("mini.notify")
notify.setup({ window = { config = { border = "rounded" } } })
vim.notify = notify.make_notify()

require("mini.ai").setup({ n_lines = 500 })
require("mini.bracketed").setup()
require("mini.bufremove").setup()
require("mini.cursorword").setup()
require("mini.diff").setup()
require("mini.git").setup()

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		hex = hipatterns.gen_highlighter.hex_color(),
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
	},
})

require("mini.indentscope").setup({ symbol = "│" })
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.surround").setup()

local starter = require("mini.starter")
starter.setup({
	header = [[
		   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
		   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
		   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
		   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
		   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
		   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]],
	items = {
		{ name = "Find file", action = "lua MiniPick.builtin.files()", section = "Pick" },
		{ name = "Live grep", action = "lua MiniPick.builtin.grep_live()", section = "Pick" },
		{ name = "Recent files", action = "lua MiniExtra.pickers.oldfiles()", section = "Pick" },
		{ name = "Update plugins", action = "lua vim.pack.update()", section = "Actions" },
		starter.sections.builtin_actions(),
	},
	footer = "",
})

require("mini.statusline").setup()
require("mini.tabline").setup()
require("plugins.mini.files")
require("plugins.mini.pick")
require("mini.extra").setup()
require("plugins.mini.clue")

map("n", "<leader>e", function()
	local name = vim.api.nvim_buf_get_name(0)
	if name == "" or vim.bo.buftype ~= "" then
		MiniFiles.open()
		return
	end
	MiniFiles.open(name)
end, { desc = "File explorer" })

map("n", "<leader>go", function()
	MiniDiff.toggle_overlay()
end, { desc = "Toggle git overlay" })
