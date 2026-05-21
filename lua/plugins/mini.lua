return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.basics").setup()
		require("mini.surround").setup()
		require("mini.icons").setup()
		require("mini.files").setup({ windows = { winblend = 0 } })
		require("mini.completion").setup()
		require("mini.snippets").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.ai").setup()
		require("mini.statusline").setup()
		require("mini.indentscope").setup()
		require("mini.notify").setup()
		require("mini.bracketed").setup()
		require("mini.move").setup()

		local ANIM_DURATION    = 50            -- ms total duration
		local ANIM_EASING      = "in-out"      -- 'in' | 'out' | 'in-out'
		local ANIM_TIMING      = "exponential" -- 'linear' | 'quadratic' | 'cubic' | 'quartic' | 'exponential'
		local ANIM_CURSOR_PATH = "line"        -- 'line' | 'angle' | 'walls' | 'spiral'
		local ANIM_WIN_EFFECT  = "wipe"        -- 'static' | 'center' | 'wipe'

		local animate     = require("mini.animate")
		local timing      = animate.gen_timing[ANIM_TIMING]({ duration = ANIM_DURATION, unit = "total", easing = ANIM_EASING })
		local cursor_path = animate.gen_path[ANIM_CURSOR_PATH]()
		local open_win    = animate.gen_winconfig[ANIM_WIN_EFFECT]({ direction = "from_edge" })
		local close_win   = animate.gen_winconfig[ANIM_WIN_EFFECT]({ direction = "to_edge" })

		animate.setup({
			cursor = { timing = timing, path = cursor_path },
			scroll = { timing = timing },
			resize = { timing = timing },
			open   = { timing = timing, winconfig = open_win },
			close  = { timing = timing, winconfig = close_win },
		})
	end,
}
