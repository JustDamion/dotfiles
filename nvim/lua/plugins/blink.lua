local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
	keymap = { preset = "default" },
	appearance = { nerd_font_variant = "mono" },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 300 },
		ghost_text = { enabled = true },
	},
	signature = { enabled = true },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
})
