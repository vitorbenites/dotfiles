-- Indent blank line mostra uma linha no nível da indentação
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			scope = {
				show_start = false,
				show_end = false,
			},
			indent = {
				tab_char = "┃",
			},
			exclude = {
				filetypes = { "dashboard" },
			},
		})
	end,
}
