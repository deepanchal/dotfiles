# Misc

## JQ
alias -g JQ='| jq' # for jq

## ShellGPT
alias -g SG='| sgpt' # for shell gpt
function s() {
  # command sgpt "$@" | tee >(xclip -selection clipboard) | bat -l log --no-pager --plain -l markdown
  command sgpt "$@" | tee >(xclip -selection clipboard) | glow
}

