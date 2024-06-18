-- Configurações do lualine
return {
	-- Plugin do tema do lualine
	"sainnhe/gruvbox-material",

	-- Plugins de linha inferior (lualine)
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox-material",
					section_separators = "",
					component_separators = "",
				},
				sections = {
					lualine_c = {
						{
							"filename",
							file_status = true, -- displays file status (readonly status, modified status)
							path = 3, -- 0 = just filename, 1 = relative path, 2 = absolute path
						},
					},
				},
			})
		end,
	},

	-- Bufferline
	-- Setup ao final de init.lua
	{
		"akinsho/bufferline.nvim",
		-- version = "*",
		branch = "main",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
}
