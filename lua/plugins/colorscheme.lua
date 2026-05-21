return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
		-- Make all floating windows match the editor background
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatTitle",  { link = "Title" })
	end,
}
