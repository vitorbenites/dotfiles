# Bashrc do Vitin
# Copia sim comédia
# Variável PATH
export GOPATH=$HOME/go
export PATH=$PATH:/home/vitor/.cargo/bin:/home/vitor/wiki_scripts:/home/vitor/Documentos/shell_script:/home/vitor/.local/bin:$GOPATH/bin

# Variável de ambiente do editor
export EDITOR="/usr/bin/nvim"

# Cores do terminal
TERM=xterm-256color

# Key-bindings do ATAC
export ATAC_KEY_BINDINGS=/home/vitor/.config/atac/keys.toml
export ATAC_THEME=/home/vitor/.config/atac/theme.toml

# Alias
alias nv='$EDITOR'
alias cl='clear; fastfetch'
alias clc='clear'
alias ls='lsd'
alias ll='lsd -lh'
alias lll='lsd -lha'
alias upd='yay; flatpak update'
alias grep='grep --color'
alias cd='cd >/dev/null'
alias hm='cd ~'
alias doc='cd ~/Documentos'
alias ssh='TERM=xterm-256color ssh'
alias mx='cmatrix'
alias pipes='pipes.sh'
alias tempo='curl wttr.in'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias free='free -h'
alias bashrc='$EDITOR ~/.bashrc'
alias ala='$EDITOR ~/.config/alacritty/alacritty.toml'
alias chrome='google-chrome-stable'
alias fman='compgen -c | fzf | xargs man'
alias ftldr='compgen -c | fzf | xargs tldr'
alias zat='zathura'
alias ufms='vifm ~/Documentos/SI/SISTINF_6/'
alias calendario='dialog --calendar "Calendário" 0 0 $(date +%d) $(date +%m) $(date +%Y); clear; fastfetch'
alias lzg='lazygit'

# Executar o tmux ao iniciar o terminal (não abrir um novo painel)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
fi

# Fastfetch pelo estilo
fastfetch

# Haskell
# [ -f "/home/vitor/.ghcup/env" ] && source "/home/vitor/.ghcup/env" # ghcup-env

# Seção do FuzzyFinder
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix"

_fzf_compgen_path(){
	fd --hidden . "$1"
}

_fzf_compgen_dir(){
	fd --type=d --hidden . "$1"
}

# Funções 
cls() {
	echo "========================================================="
	echo "============ Docker Containers (Application) ============"
	echo "========================================================="
	if [[ $(docker ps -a | wc -l) -gt 1 ]]; then
		lsdocker
	else
		echo "Nenhum container Docker instanciado."
	fi
	echo ""
	echo "========================================================="
	echo "=============== Incus Instances (System) ================"
	echo "========================================================="
	if [[ $(incus list | wc -l) -gt 3 ]]; then
		incus list
	else 
		echo "Nenhuma instância Incus."
	fi
}

cimg(){
	echo "========================================================="
	echo "============== Docker Images (Application) =============="
	echo "========================================================="
	echo ""
	docker image ls
	echo ""
	echo "========================================================="
	echo "================ Incus Images (System) =================="
	echo "========================================================="
	incus image list
}

lsdocker(){
	VERTICAL="\nID\t{{.ID}}\nImage\t{{.Image}}\nCommand\t{{.Command}}\nCreated\t{{.RunningFor}}\nStatus\t{{.Status}}\nPorts\t{{.Ports}}\nNames\t{{.Names}}\n"

	docker container ls --all --format=$VERTICAL
}

vicd()
{
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

# Starship
eval "$(starship init bash)"
