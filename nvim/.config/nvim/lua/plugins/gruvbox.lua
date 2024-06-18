-- Configuração do tema gruvbox
return {
	-- Plugin de tema de cores
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			terminal_colors = true,
			transparent_mode = true,
		},
		config = true,
	},
}
