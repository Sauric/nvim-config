return {
	"folke/noice.nvim",
	opts_extend = { "routes" },
	opts = {
		lsp = {
			progress = {
				throttle = 1000,
			},
		},
	},
}
