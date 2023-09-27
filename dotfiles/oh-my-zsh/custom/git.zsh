# Git
alias lg="lazygit"
alias g="git"
alias gls="git --no-pager log --no-merges --reverse --pretty=format:'- %s (%h)' -n 100 && echo"
alias gcmsgn="git commit --no-verify --message"
alias gcpcommits="git log --no-merges --count HEAD ^$(git_main_branch) --reverse --pretty=format:%s | sed 's/^/- /' | xclip -selection clipboard"
alias glscommits="git log --no-merges --count HEAD ^$(git_main_branch) --reverse --pretty=format:%s | sed 's/^/- /'"

# list commits from HEAD to given base branch
gls_commits() {
  git log --no-merges --count HEAD ^$1 --reverse --pretty=format:'- %s'
}

glsc() {
  local previous_date=""
  local num_commits=${1:-100}
  local author=${2:-""}
  git --no-pager log --no-merges --reverse --pretty=format:'%ad%n- %s (%h)' --date=format:'%Y-%m-%d' -n $num_commits --author="$author" | while IFS= read -r line
  do
    if [[ $line != -* ]]; then
      if [[ $line != $previous_date ]]; then
        echo -e "\n\033[1;34m$line\033[0m\n"  # Print date in blue
        previous_date=$line
      fi
    else
      echo -e "\033[0;32m$line\033[0m"  # Print commit message in green
    fi
  done
}

# copy commits from HEAD to given base branch to clipboard
gcp_commits() {
  gls_commits $1 | tee >(xclip -selection clipboard)
}

# update pr description with commits from given base branch
update_pr_body() {
  gls_commits $1 | xargs -0 -I _ gh pr edit --body _
}

