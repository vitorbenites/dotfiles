-- Arquivo de configurações globais do neovim
--
-- Syntax e Filetype
vim.o.syntax = "on"
vim.o.filetype = "on"
vim.o.hidden = true

-- Indentação
vim.o.autoindent = true
vim.o.smartindent = true

-- Histórico
vim.o.history = 500

-- Mostrar número e número da linhas
vim.o.number = true
vim.o.relativenumber = true

-- Destaque na linha do cursor
vim.o.cursorline = true

-- Permitir uso do mouse
vim.o.mouse = "a"

-- Tipo de folding
vim.o.foldmethod = "syntax"

-- Confirmação de salvamento
vim.o.confirm = true

-- Tipo de menu
vim.o.wildmenu = true

-- UTF8
vim.o.encoding = "utf8"

-- Espaçamento do tab
vim.o.ts = 2
vim.o.sw = 2

-- Configuração do split
vim.o.splitbelow = true
vim.o.splitright = true

-- Destacar a busca
vim.o.incsearch = true
vim.o.hlsearch = false

-- Título da janela é o título do arquivo
vim.o.title = true

-- Sempre mostrar a coluna de sinais
vim.o.signcolumn = "yes"

-- Cursor não passa de 5 linhas acima ou abaixo
vim.o.scrolloff = 5

-- Neovim compartilhar área de transferência com o SO
vim.o.clipboard = "unnamedplus"

-- Quebra de indentação
vim.o.breakindent = true

-- Salvar as alterações de undo
vim.o.undofile = true

-- Ignorar maiúscula e minúscula
vim.o.ignorecase = true
vim.o.smartcase = true

-- Escrita do arquivo de swap
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Opções de autocomplete
vim.o.completeopt = "menuone,noselect"

-- Mostrar whitespaces
vim.opt.list = true
vim.opt.listchars = { tab = " »", trail = "·", nbsp = "␣", eol = "↵" }

vim.loader.enable()

-- Definição de leader key
vim.g.mapleader = "ç"
vim.g.maplocalleader = "\\"

-- Abreviações
vim.cmd([[
iabbrev nomev Vitor de Freitas Benites
iabbrev rgav 202219070392
iabbrev @@ vitor.benites88@gmail.com
]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
	-- Use the current buffer's path as the starting point for the git search
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir
	local cwd = vim.fn.getcwd()
	-- If the buffer is not associated with a file, return nil
	if current_file == "" then
		current_dir = cwd
	else
		-- Extract the directory from the current file's path
		current_dir = vim.fn.fnamemodify(current_file, ":h")
	end

	-- Find the Git root directory from the current file's path
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		print("Not a git repository. Searching on current working directory")
		return cwd
	end
	return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
	local git_root = find_git_root()
	if git_root then
		require("telescope.builtin").live_grep({
			search_dirs = { git_root },
		})
	end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

-- Alpha no último buffer
vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BDeletePre *",
	group = "alpha_on_empty",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local name = vim.api.nvim_buf_get_name(bufnr)

		if name == "" then
			vim.cmd([[:Alpha | bd#]])
		end
	end,
})

-- Autoformat json
vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		vim.bo.formatprg = "jq"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    vim.treesitter.start(args.buf)
    vim.wo.conceallevel = 0 -- desativa conceal, que é onde o bug se manifesta
  end,
})
