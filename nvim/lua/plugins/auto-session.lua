return {
	"rmagatti/auto-session",
	lazy = false,

	config = function()
		require("auto-session").setup({
			pre_restore_cmds = {
				function()
					vim.cmd("Neotree close")
				end,
			},
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
	end,
}
