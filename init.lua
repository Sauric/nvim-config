vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "

vim.pack.add({ 
	'https://github.com/nvim-mini/mini.nvim' ,
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/folke/which-key.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})
vim.cmd.colorscheme("catppuccin-mocha")
require('mini.basics').setup()
require('mini.surround').setup()
require('mini.icons').setup()
require('mini.files').setup({
  windows = {
    -- Adjust transparency if needed (0-100)
    winblend = 100,
  },
})
require('mini.completion').setup()
require('mini.snippets').setup()
require('which-key').setup({
	preset = "modern",
      defaults = {},
})
require('nvim-treesitter').setup()

vim.lsp.enable({ 'lua_ls' })

vim.keymap.set({'n', 'v'}, '<leader>?', function() require("which-key").show({ global = false}) end )
vim.keymap.set({'n'}, '<leader>e', function() require('mini.files').open() end, { desc = 'Opens mini.files' })

