## ZSH Aliases

# Replacements
alias vim="nvim"	        # neovim https://github.com/neovim/neovim
alias cat="bat"                 # batcat https://github.com/sharkdp/bat
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
alias -g JQ='| jq' # for jq
alias -g SG='| sgpt' # for shell gpt

# Dotdrop Dotfiles
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

# Direnv Allow
direnv() { asdf exec direnv "$@"; } # asdf shortcut
alias dallow='asdf exec direnv allow'

#: Wrap tmux (see: https://github.com/direnv/direnv/wiki/Tmux)
# alias tmux='direnv exec / tmux'

# System Errors
alias errors="journalctl -b -p err | less"

# Git
alias lg="lazygit"
alias g="git"
alias gcpcommits="git log --no-merges --count HEAD ^$(git_main_branch) --reverse --pretty=format:%s | sed 's/^/- /' | xclip -selection clipboard"
alias glscommits="git log --no-merges --count HEAD ^$(git_main_branch) --reverse --pretty=format:%s | sed 's/^/- /'"

# list commits from HEAD to given base branch
gls_commits() {
  git log --no-merges --count HEAD ^$1 --reverse --pretty=format:'- %s'
}

# copy commits from HEAD to given base branch to clipboard
gcp_commits() {
  gls_commits $1 | tee >(xclip -selection clipboard)
}

# update pr description with commits from given base branch
update_pr_body() {
  gls_commits $1 | xargs -0 -I _ gh pr edit --body _
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

# Misc
function s() {
  # command sgpt "$@" | tee >(xclip -selection clipboard) | bat -l log --no-pager --plain -l markdown
  command sgpt "$@" | tee >(xclip -selection clipboard) | glow
}

