eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# fnm
FNM_PATH="/Users/kev/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/kev/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

eval "$(fnm env --use-on-cd --shell zsh)"

eval "$(starship init zsh)"

p(){
    declare pm="npm"
    declare dir="."

    for i in {1..3}; do
        if [ -f "$dir/pnpm-lock.yaml" ]; then
            pm="pnpm"
            break
        elif [ -f "$dir/yarn.lock" ]; then
            pm="yarn"
            break
        elif [ -f "$dir/bun.lock" ]; then
            pm="bun"
            break
        fi
        dir="$dir/.."
    done

    print -P "%F{yellow}Using package manager: %F{green}$pm%f"

    "$pm" "$@"
}


# GIT alias
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias glog="git log --oneline --graph --decorate --all"
alias gb="git branch"
alias config-stop="~/.dotfiles/scripts/stop.sh"

gpsup() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || {
    echo "❌ No current branch found."
    return 1
  }

  git push --set-upstream origin "$branch"
}

gdel() {
  local current_branch
  current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return

  git branch | grep -v "$current_branch" | grep -v "main" | grep -v "master" | xargs git branch -D
}


take() {
    if [ -z "$1" ]; then
    fi

    mkdir -p "$1" && cd "$1"
}

# Added by Windsurf
export PATH="/Users/kev/.codeium/windsurf/bin:$PATH"

# Added by Windsurf
export PATH="/Users/kev/.codeium/windsurf/bin:$PATH"

# Added by Windsurf
export PATH="/Users/kev/.codeium/windsurf/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/Users/kev/.opencode/bin:$PATH

alias claude-mem='bun "/Users/kev/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
