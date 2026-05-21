-- Manual format
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- File explorer
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open()
end, { desc = "Open file explorer" })
