status is-interactive; or return

# Rosé Pine syntax colors (matches Ghostty / nvim / tmux)
set -l text e0def4
set -l subtle 908caa
set -l muted 6e6a86
set -l love eb6f92
set -l gold f6c177
set -l rose ebbcba
set -l pine 31748f
set -l foam 9ccfd8
set -l iris c4a7e7
set -l hl 403d52

set -g fish_color_normal $text
set -g fish_color_command $foam
set -g fish_color_keyword $pine
set -g fish_color_quote $gold
set -g fish_color_redirection $iris
set -g fish_color_end $subtle
set -g fish_color_error $love
set -g fish_color_param $rose
set -g fish_color_option $iris
set -g fish_color_comment $muted
set -g fish_color_operator $subtle
set -g fish_color_escape $pine
set -g fish_color_autosuggestion $muted
set -g fish_color_valid_path --underline
set -g fish_color_selection --background=$hl
set -g fish_color_search_match --background=$hl
set -g fish_color_cancel $love
set -g fish_pager_color_progress $muted
set -g fish_pager_color_prefix $foam --bold
set -g fish_pager_color_completion $text
set -g fish_pager_color_description $muted
set -g fish_pager_color_selected_background --background=$hl

# fzf colors
set -gx FZF_DEFAULT_OPTS "--color=fg:#$subtle,bg:-1,hl:#$rose,fg+:#$text,bg+:#26233a,hl+:#$rose,border:#$hl,header:#$pine,gutter:-1,spinner:#$gold,info:#$foam,pointer:#$iris,marker:#$love,prompt:#$subtle --layout=reverse --border=rounded"
