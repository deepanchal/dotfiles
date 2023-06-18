## ZSH Aliases

# Replacements
alias vim="nvim"	        # neovim https://github.com/neovim/neovim
alias ls="exa --icons --git"         # exa https://github.com/ogham/exa

# Config Aliases
alias zshcfg="$EDITOR ~ZSH_CUSTOM"
alias zshrc="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias vimrc="$EDITOR ~/.vimrc"
alias srczshrc="source ~/.zshrc"

# Colored HowDoI
alias howdoi='howdoi -c -e duckduckgo'
alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'

# Common Helpers 
alias ll="ls -l"
alias la="ls -al"
alias rg="rg --hidden"

# IP Aliases
alias myip="ip addr | grep -m 1 -o '192.*.*.*' | cut -d '/' -f 1"
alias wanip="curl -s -X GET https://checkip.amazonaws.com"

# Copy/Paste
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias cpwd='pwd | xclip'
alias ppwd='cd $(pbpaste)'
alias -g CP='| pbcopy' # copy to clipboard

# Direnv Allow
direnv() { asdf exec direnv "$@"; } # asdf shortcut
alias dallow='asdf exec direnv allow'

#: Wrap tmux (see: https://github.com/direnv/direnv/wiki/Tmux)
# alias tmux='direnv exec / tmux'

## Dotdrop Dotfiles
alias dotdrop="$DOTFILES/dotdrop.sh --cfg=$DOTFILES/config.yaml"

# ZSH Time
alias zshtime='for i in $(seq 1 10); do /usr/bin/time -f "| Real: %es | User: %Us | Sys: %Ss |" zsh -i -c exit; done'

# Time a command
timeit() {
    time -f "| Real: %es | User: %Us | Sys: %Ss |" $@
}

# Disk Analyzer
alias disk-analyze="su -c baobab"

# System Info
alias sysinfo='inxi -Fxxxz'

# System Errors
alias errors="journalctl -b -p err | less"

# bat related config
alias cat="bat"                 # batcat https://github.com/sharkdp/bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias bathelp='bat --plain --language=help'
bhelp () {
    "$@" --help 2>&1 | bathelp
}

# port 
list-port () {
	sudo -v
	sudo lsof -i :$1
}

kill-port () {
	sudo -v
	sudo lsof -t -i tcp:$1 | xargs -I kill
}

# Misc
alias pj='pnpm projen'

