-- Leader must be set before lazy loads any plugin
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Load options early (before plugins)
require("config.options")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins (lazy auto-imports everything in lua/plugins/)
require("lazy").setup("plugins", {
	ui = { border = "rounded" },
})

-- Load keymaps and autocmds after plugins are set up
require("config.keymaps")
require("config.autocmds")
