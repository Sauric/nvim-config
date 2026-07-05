vim.g.netrw_banner = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.undofile = true

vim.opt.clipboard:append("unnamedplus")
-- vim.opt.isfname:append("@-@") -- for typescript

vim.opt.guicursor = "" -- for terminal cursor use
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"
vim.o.cmdheight = 0
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Подсвекта скопированного",
    callback = function()
        vim.hl.on_yank()
    end,
})
