eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm
FNM_PATH="/Users/kev/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/kev/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

eval "$(fnm env --use-on-cd --shell zsh)"

eval "$(starship init zsh)"

p(){
    declare pm="pnpm"
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
alias gpl="git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gl="git log --oneline --graph --decorate --all"
alias gb="git branch"
alias gpsup="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"

alias gdel="git branch | grep -v \"$(git rev-parse --abbrev-ref HEAD)\" | grep -v \"main\" | grep -v \"master\" | xargs git branch -D"


take() {
    if [ -z "$1" ]; then
    fi

    mkdir -p "$1" && cd "$1"
}
