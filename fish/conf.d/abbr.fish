status is-interactive; or return

# ── Git (abbreviations expand on space, so you see the full command) ─────────
abbr -a g git
abbr -a gs git status
abbr -a ga git add
abbr -a gaa git add --all
abbr -a gc git commit
abbr -a gca git commit --amend
abbr -a gp git push
abbr -a gpf git push --force-with-lease
abbr -a gl git pull
abbr -a gco git checkout
abbr -a gcb git checkout -b
abbr -a glog git log --oneline --graph --decorate --all
abbr -a gb git branch

# ── Misc ─────────────────────────────────────────────────────────────────────
abbr -a n nvim
abbr -a config-stop ~/.dotfiles/scripts/stop.sh
alias claude-mem 'bun "$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'

# ── Modern replacements (only if installed) ──────────────────────────────────
if command -q eza
    alias ls 'eza --icons --group-directories-first'
    alias ll 'eza -l --icons --git --group-directories-first'
    alias la 'eza -la --icons --git --group-directories-first'
    alias lt 'eza --tree --level=2 --icons'
end
if command -q bat
    alias cat 'bat --paging=never --style=plain'
end
