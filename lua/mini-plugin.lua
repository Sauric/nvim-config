vim.pack.add({"https://github.com/nvim-mini/mini.nvim"})

-- mini icons ----
require("mini.icons").setup()

-- Statusline
require('mini.statusline').setup()

-- Basic Appearance (Borders, Signcolumn, etc.)
require('mini.basics').setup({
  options = {
    win_borders = 'double' -- Change to 'double' or 'solid' as desired
  }
})

-- mini files ----
require("mini.files").setup({
  options = {
    use_as_default_explorer = false,  -- Prevent auto-open on startup
  },
})

vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>-", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

---- mini notify ----
require("mini.notify").setup({
	-- only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

--- mini cmdline completion ---
require("mini.cmdline").setup({
    autocorrect = { enable = false }
})

--- mini surround ---
require("mini.surround").setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

--- mini picker ---
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup()
MiniExtra.setup()

-- opens mini.picker on startup
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require("mini.pick").builtin.files()
  end,
})

-- keymaps
vim.keymap.set("n", "<leader>pf", function() require("mini.pick").builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>ps", function() require("mini.pick").builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Grep word/Search word" })
vim.keymap.set("n", "<leader>vh", function() require("mini.pick").builtin.help() end, { desc = "Mini Help" })

vim.keymap.set("n", "<leader>xx", function() require("mini.pick").pickers.diagnostic() end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>pk", function() require("mini.pick").pickers.keymaps() end, { desc = 'Search keymaps' })

--- mini completions --- 
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})

--- mini snippets ---
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets
    },
})
MiniSnippets.start_lsp_server({ match = false })

--- mini diff and fugitive ---
local MiniDiff = require("mini.diff")
MiniDiff.setup({
	source = MiniDiff.gen_source.git({ index = false }),
})

vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<cr>", { desc = "Fugitive Full Page New Tab" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff split", })
