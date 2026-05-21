return {
	-- Mason: LSP/tool installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Bridge between Mason and nvim-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ts_ls" },
			})
			vim.lsp.enable({ "lua_ls", "pyright", "ts_ls" })
		end,
	},

	-- LSP configuration and keymaps
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", vim.lsp.buf.definition,   "Go to definition")
					map("gD", vim.lsp.buf.declaration,  "Go to declaration")
					map("gr", vim.lsp.buf.references,   "Go to references")
					map("K",  vim.lsp.buf.hover,        "Hover documentation")
					map("<leader>rn", vim.lsp.buf.rename,      "Rename symbol")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
					map("]d", vim.diagnostic.goto_next, "Next diagnostic")
				end,
			})
		end,
	},
}
