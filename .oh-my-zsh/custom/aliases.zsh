## ZSH Aliases

# Replacements
alias vim="nvim"	# neovim
alias cat='batcat'      # Bat
alias p='pnpm'

# Config Aliases
alias zshcfg="$EDITOR ~ZSH_CUSTOM"
alias zshrc="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias vimrc="$EDITOR ~/.vimrc"

# Colored HowDoI
alias howdoi='howdoi -c -e duckduckgo'
alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'

# Common Helpers 
alias ll="ls -l"
alias la="ls -al"

# IP Aliases
alias myip="ip addr | grep -m 1 -o '192.*.*.*' | cut -d '/' -f 1"
alias wanip="curl -s -X GET https://checkip.amazonaws.com"

# Copy/Paste PWD
alias cpwd='pwd | xclip'
alias ppwd='cd $(xclip -o)'

# ZSH Time
alias zshtime='for i in $(seq 1 10); do /usr/bin/time -f "| Real: %es | User: %Us | Sys: %Ss |" zsh -i -c exit; done'

# Time a command
timeit() {
    /usr/bin/time -f "| Real: %es | User: %Us | Sys: %Ss |" $@
}

# Disk Analyzer
alias disk-analyze="su -c baobab"

# System Info
alias sysinfo='inxi -Fxxxz'

# Direnv Allow
direnv() { asdf exec direnv "$@"; } # asdf shortcut
alias dallow='asdf exec direnv allow'

#: Wrap tmux (see: https://github.com/direnv/direnv/wiki/Tmux)
# alias tmux='direnv exec / tmux'

# System Errors
# alias errors="journalctl -b -p err|less"

# Git
alias g="git"

# Kubernetes
alias mk='minikube'
alias kctx='kubectx'
alias kctl='kubectl'
alias kspy='kubespy'
alias kevents="k get events --sort-by=.metadata.creationTimestamp"

# Android (ADB)
adb_all () {
  # execute adb command on all connected devices.
  adb devices | tail -n +2 | cut -sf -1 | xargs -I X adb -s X $@
}
alias adba=adb_all
alias adba-clear="adb_all shell pm clear ${ANDROID_PKG:-$1}"
alias adba-start="adba shell am start ${ANDROID_PKG:-$1}/.MainActivity"
alias adba-rm="adba shell uninstall ${ANDROID_PKG:-$1}"
alias adba-ls="adb_all shell list packages -3"


