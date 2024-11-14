-- Snipe
-- Plugin para navegação de buffers
return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"<leader><tab>",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},
	opts = {
		ui = {
			position = "center",
		},
		hints = {
			dictionary = "123456789",
		},
	},
}
