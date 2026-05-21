return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = "ToggleTerm",
	keys = {
		{ "<C-_>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle terminal" },
	},
	config = function()
		require("toggleterm").setup({
			direction = "horizontal",
			size = 15,
			start_in_insert = true,
			persist_mode = true,
		})
	end,
}
