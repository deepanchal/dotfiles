# Git
alias lg="lazygit"
alias g="git"
alias gls="git log --no-merges --reverse --pretty=format:'- %s (%h)' | tail -n 100 && echo"
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

