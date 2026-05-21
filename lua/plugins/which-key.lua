return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 500,
		defaults = {},
	},
	keys = {
		{ "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer keymaps (which-key)" },
	},
}
