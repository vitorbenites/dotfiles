-- Tela inicial do neovim
return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⡠⠔⠊⢉⡩⠽⠛⣛⣻⣿⣿⣿⣿⣶⣷⣎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⡴⠋⢀⡴⠊⢁⡴⠚⠉⣁⡤⠴⠚⠛⠛⠿⠿⣧⣫⣽⣶⣝⣿⣿⣿⣿⣿⡿⠿⠿⢿⣿⣿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢠⠞⠀⣐⣋⢀⠔⠁⣠⠔⠋⠀⣀⣔⡲⣶⣾⣿⣿⡯⣾⣿⣾⢻⣿⣿⣿⢏⣶⢾⣒⣾⠯⣽⣛⡿⣿⣿⣷⣶⣯⣝⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⢏⣴⣿⣿⣿⣷⡄⡼⠁⣠⢢⣾⣿⣿⣿⣿⣿⣵⣶⣦⢻⣿⣿⣾⣿⣿⣿⢸⢧⣿⣿⣿⣿⣷⣾⣽⣷⣟⣷⣾⣿⣿⣿⣷⡨⣭⣻⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣼⣿⣿⣿⣿⣿⣷⢡⣾⡟⡞⠛⢿⣿⣿⣿⣿⣿⣿⣿⡎⣿⣿⣿⣿⣿⣿⢸⢸⣿⣿⣿⣿⣿⣿⣿⣧⣿⢸⣿⣿⣿⣿⣿⣷⡹⡇⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣧⣿⣿⣧⠀⠀⢸⣿⣿⣿⠁⠀⢹⣿⢣⣝⢿⣿⣿⣿⣿⢸⢸⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣧⠃⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⡿⡿⢿⣿⢟⡻⡸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣿⡿⣛⡟⣄⣀⣾⣷⣿⣿⡆⣿⣿⣿⣿⢸⢸⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⡞⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⢟⡲⣝⢮⣅⣿⡱⣿⣮⣝⣛⡛⣭⣾⣿⣿⣿⣿⡜⠻⠿⣿⣿⠿⣿⣿⣿⣿⡿⢣⣿⣿⣿⣿⢸⣸⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⡿⣘⠷⢰⣯⣭⢻⣧⣝⡻⠿⢿⣛⣈⣛⢿⣿⣿⣿⣧⣼⣿⠿⠿⣼⣿⣿⣿⢟⣵⣿⣿⣿⣿⣿⣮⡳⣝⡿⣿⣿⣿⣿⣿⡟⣿⢸⣿⣿⣿⣿⣿⣿⣿⢣⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣷⣌⡻⠿⠿⠿⣿⣿⣿⣿⣶⣶⡽⣿⣿⣧⡍⡛⣿⠯⠭⠵⠾⠿⢟⣛⣭⣶⣿⣿⣿⣿⣿⣿⢉⣭⢭⣤⢩⣗⡫⠽⣛⣻⣽⢏⣿⣿⣿⡿⠿⢟⣫⣵⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⡿⣱⡝⠿⣿⣿⣿⣿⣇⡿⠿⣿⣏⢷⡽⢎⣿⢹⡿⣫⣴⣭⣭⣽⣛⣭⣭⣝⢛⣛⢸⣟⡽⣺⢧⣿⣩⢟⣓⣲⣶⠾⠶⠶⣶⣟⣩⣭⣛⡻⢿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⡇⣿⡇⣷⣦⠭⣩⣵⣴⣾⣿⣿⣿⣿⣿⣿⣿⡇⠱⣿⣿⣿⣿⡟⣿⠿⣿⣟⠇⢾⣙⡺⢽⣳⢾⣿⣩⠟⣳⢯⣽⣭⣭⣭⣭⣭⣿⣿⣿⣿⣶⢸⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣜⡻⢰⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡃⢦⣍⡉⠭⣵⢹⠇⣵⡙⢇⡻⣬⣽⡳⢮⣝⡺⢽⣻⢷⣿⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⢿⣿⣿⣿⣿⣿⣿⡿⣟⣻⣽⣿⠿⣛⣭⣥⣝⠻⢾⣴⡝⡻⢾⣝⡷⣭⡳⠦⢟⣓⣯⠭⣷⣛⣯⣬⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠸⢿⣿⣿⣿⣿⣿",
			-- "⣿⣿⣿⣿⣿⣿⣿⣿⢟⣫⣬⠻⣿⣿⣿⣿⣿⣾⣿⠿⣫⣵⣶⣮⡝⣿⣿⡇⣷⣭⣛⢿⣵⡩⣛⠷⣜⣭⣿⣶⢟⣯⣽⣲⣶⣝⣘⣤⣴⡣⣶⣶⣶⣶⣶⣾⣿⣿⣷⣮⣟⠿⣿⣿",
			-- "⣿⣿⣿⣿⣿⣿⣿⡏⢿⣷⣾⣥⣬⣝⣛⣛⣛⡫⠵⢾⣿⣿⣿⣿⣿⢸⣿⡇⣿⣿⣿⣷⣮⣙⠷⣽⣺⢶⣶⣶⣼⣛⣛⡓⠛⠵⠿⣿⣟⣛⣛⣻⣿⣯⣭⣭⡽⠿⠶⠶⢞⣣⣿⣿",
			-- "⣿⣿⣿⣿⣿⣿⣿⣿⣦⣭⣝⣛⣛⣛⡛⠛⠛⢛⡛⣼⣿⣿⣿⣿⡏⣼⣿⣮⠻⣿⣿⣿⣿⠿⢸⣶⣝⡃⠶⠶⠶⡛⡛⢛⣛⣛⣭⡍⣭⣭⣽⣷⡆⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣶⣶⢪⣶⣿⣿⣿⣟⣻⣕⢿⣿⣿⣧⢙⣶⣤⣭⣽⣷⣿⣿⣿⣜⠿⣿⣿⣷⣥⣪⢝⡏⡇⣿⣿⣿⣿⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣧⣭⣭⠸⣿⣿⣿⣿⣿⣿⣿⣦⢻⣿⣿⢘⣛⣛⣛⣻⣯⣭⣭⣭⣭⣿⣾⣝⡻⢿⣿⣿⡆⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣫⣽⣶⣦⡟⣛⣛⢓⡙⢿⣿⣿⣿⣿⣿⣿⢘⣛⣥⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⣿⣓⣊⣛⣃⠇⣿⣿⣿⣿⣿⣘⣳⣶⣶⣶⣤⣤⣥⣌⣿⣿",
			-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠩⡽⢹⣭⡁⣿⣿⡏⣽⣆⠝⠻⠿⠿⢟⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣵⢫⣽⣿⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⢿⣛⣛⣋⣿⣿",
		}

		function Create_file()
			local fname = vim.fn.input("File: ", "", "file")
			if fname ~= "" then
				vim.cmd("edit " .. fname)
			else
				print("No file name provided.")
			end
		end

		function Open_Wiki()
			-- Função para ir para a wiki
			local wiki_path = "/home/vitor/Documentos/Wiki"
			vim.cmd("cd " .. wiki_path)
			vim.cmd("Telescope file_browser path=%:p:h select_buffer=true")
		end

		function Open_config()
			local config_path = vim.fn.stdpath("config")
			vim.cmd("cd " .. config_path)
			vim.cmd("Telescope file_browser path=%:p:h select_buffer=true")
		end

		dashboard.section.buttons.val = {
			dashboard.button("e", "📝 > New File", ":lua Create_file()<CR>"),
			dashboard.button("w", "📖 > Wiki", ":lua Open_Wiki()<CR>"),
			dashboard.button("c", "🔧 > Config Directory", ":lua Open_config()<CR>"),
			dashboard.button("f", "📁 > File Manager", ":Telescope file_browser path=%:p:h select_buffer=true<CR>"),
			-- dashboard.button("o", "📜 > Recent Files", require("telescope.builtin").oldfiles),
			dashboard.button("q", "❌ > Quit", ":q<CR>"),
		}
		alpha.setup(dashboard.opts)
	end,
}
