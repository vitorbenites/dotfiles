-- Configuração do Oil Nvim
return {
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			win_options = {
				signcolumn = "yes:2",
			},
			columns = {
				"icon",
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
		},
		config = true,
	},

	-- Git no Oil
	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
}
