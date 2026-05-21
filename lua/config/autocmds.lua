-- Autosave: format then write after updatetime ms of inactivity
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		if
			vim.bo[buf].modified
			and vim.bo[buf].buftype == ""
			and vim.bo[buf].modifiable
			and vim.fn.expand("%") ~= ""
		then
			require("conform").format({ bufnr = buf, timeout_ms = 500, lsp_format = "fallback" })
			vim.cmd("silent! write")
		end
	end,
})
