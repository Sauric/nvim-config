return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		opts = {
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			{
				-- transparent = false,
				theme = "dragon",
			},
		},
	},
	{
		"shaunsingh/nord.nvim",
		priority = 1000,
	},
	{ "ellisonleao/gruvbox.nvim" },
	{

		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},
}
