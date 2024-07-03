# Bashrc do Vitin
# Copia sim comédia
# Variável PATH
GOPATH=$HOME/go
export GOPATH
PATH=$PATH:/home/vitor/.cargo/bin:/home/vitor/wiki_scripts:/home/vitor/Documentos/shell_script:$GOPATH/bin

# Variável de ambiente do editor
export EDITOR="/usr/bin/nvim"

# Alias
alias nv='$EDITOR'
alias cl='clear; fastfetch'
alias clc='clear'
alias ls='lsd'
alias ll='lsd -lh'
alias lll='lsd -lha'
alias upd='paru; flatpak update'
alias grep='grep --color'
alias cd='cd >/dev/null'
alias hm='cd ~'
alias doc='cd ~/Documentos'
alias mx='cmatrix'
alias tempo='curl wttr.in'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias free='free -h'
alias ncs='ncspot'
alias bashrc='$EDITOR ~/.bashrc'
alias vimrc='$EDITOR ~/.vimrc'
alias ala='$EDITOR ~/.config/alacritty/alacritty.toml'
alias ilua='vifm ~/.config/nvim/'
alias wiki='wikiscript.sh'
alias tl='$EDITOR .'
alias chrome='google-chrome-stable'
alias homeserver='ssh home'
alias homeftp='sftp -oPort=2222 vitor@192.168.1.50'
alias fman='compgen -c | fzf | xargs man'
alias ftldr='compgen -c | fzf | xargs tldr'
alias zat='zathura'
alias ufms='vifm ~/Documentos/SI/SISTINF_5/'
alias calendario='dialog --calendar "Calendário" 0 0 $(date +%d) $(date +%m) $(date +%Y); clear; fastfetch'

# Executar o tmux ao iniciar o terminal (não abrir um novo painel)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
fi

# Fastfetch pelo estilo
fastfetch


# Haskell
[ -f "/home/vitor/.ghcup/env" ] && source "/home/vitor/.ghcup/env" # ghcup-env

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

umask 022

# Starship
eval "$(starship init bash)"

