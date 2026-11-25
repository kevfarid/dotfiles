# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                               FISH CONFIG                                    ║
# ╚══════════════════════════════════════════════════════════════════════════════╝
# Linked to ~/.config/fish by setup/symlinks.sh. Launched by Ghostty only.
# Load order: conf.d/*.fish (00-fisher, abbr, theme…) -> this file.

# ── PATH ──────────────────────────────────────────────────────────────────────
/opt/homebrew/bin/brew shellenv | source
fish_add_path -g /opt/homebrew/opt/postgresql@15/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.opencode/bin
fish_add_path -g $HOME/.codeium/windsurf/bin

set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    set -g fish_greeting

    # ── Node (fnm, auto-switch on cd) ─────────────────────────────────────────
    if command -q fnm
        fnm env --use-on-cd --shell fish | source
    end

    # ── zoxide: `z dir`, `zi` interactive ─────────────────────────────────────
    if command -q zoxide
        zoxide init fish | source
    end

    # ── fzf.fish: bat preview, include hidden files ───────────────────────────
    set -g fzf_preview_dir_cmd eza --all --color=always --icons
    set -g fzf_fd_opts --hidden --exclude=.git
    command -q delta; and set -g fzf_diff_highlighter delta --paging=never --width=20

    # ── done: notify when a command takes >10s and Ghostty isn't focused ──────
    set -g __done_min_cmd_duration 10000

    # ── Prompt ────────────────────────────────────────────────────────────────
    starship init fish | source
end
