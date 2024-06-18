-- Configurações de temas para o neovim
vim.opt.termguicolors = true
vim.o.background = "dark"
-- Definição do tema de cores
vim.cmd([[colorscheme gruvbox]])
-- Setup do bufferline só funciona se for aqui
require("bufferline").setup({})
