return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python          = { "black" },
				typescript      = { "prettier" },
				javascript      = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				json            = { "prettier" },
				yaml            = { "prettier" },
				markdown        = { "prettier" },
				lua             = { "stylua" },
			},
		})
	end,
}
