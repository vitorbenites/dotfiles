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
			"⣿⣿⣿⣿⣿⣿⣿⣿⢟⣫⣬⠻⣿⣿⣿⣿⣿⣾⣿⠿⣫⣵⣶⣮⡝⣿⣿⡇⣷⣭⣛⢿⣵⡩⣛⠷⣜⣭⣿⣶⢟⣯⣽⣲⣶⣝⣘⣤⣴⡣⣶⣶⣶⣶⣶⣾⣿⣿⣷⣮⣟⠿⣿⣿",
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

		function New_project()
			-- Solicitar ao usuário o nome do projeto
			local project_name = vim.fn.input("Enter project name: ")

			-- Solicitar ao usuário a linguagem do projeto
			local languages = { "Python", "JavaScript", "Go", "Lua" }
			local language =
				vim.fn.inputlist({ "Choose project language:", "1. Python", "2. JavaScript", "3. Go", "4. Lua" })

			-- Mapear linguagens para comandos
			local commands = {
				python = "python -m venv .", -- Python
				javascript = "npm init -y", -- JavaScript
				go = "go mod init", -- Go
				c = "", -- C (não precisa de comando inicial)
			}

			-- Mapear linguagens para arquivos iniciais
			local init_files = {
				python = "main.py",
				javascript = "main.js",
				go = "main.go",
				c = "main.c",
			}

			-- Se o nome do projeto não estiver vazio e a linguagem for válida
			if project_name ~= "" and language >= 1 and language <= #languages then
				-- Criar o diretório do projeto
				vim.fn.mkdir(project_name, "p")

				-- Mudar para o diretório do projeto
				vim.cmd("cd " .. project_name)

				-- Criar o arquivo inicial
				local init_file = init_files[languages[language]:lower()]
				vim.cmd("edit " .. init_file)

				-- Executar o comando correspondente à linguagem no terminal, se houver
				local command = commands[languages[language]:lower()]
				if command ~= "" then
					vim.fn.system(command)
				end
			else
				print("Invalid project name or language choice")
			end
		end

		dashboard.section.buttons.val = {
			dashboard.button("e", "📝 > New File", ":lua Create_file()<CR>"),
			dashboard.button("p", "🗂️ > New Project", ":lua New_project()<CR>"),
			dashboard.button("f", "📁 > File Manager", ":Telescope file_browser path=%:p:h select_buffer=true<CR>"),
			dashboard.button("o", "📜 > Recent Files", require("telescope.builtin").oldfiles),
			dashboard.button("q", "❌ > Quit", ":q<CR>"),
		}
		alpha.setup(dashboard.opts)
	end,
}
