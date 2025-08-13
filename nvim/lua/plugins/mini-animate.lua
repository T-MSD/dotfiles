return {
	"echasnovski/mini.animate",
	version = "*",
	config = function()
		require("mini.animate").setup({
			cursor = { enable = false },
			scroll = { enable = true },
			resize = { enable = true },
			open = { enable = true },
			close = { enable = true },
		})
	end,
}
