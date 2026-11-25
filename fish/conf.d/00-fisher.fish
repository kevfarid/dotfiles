# Keep fisher-installed plugins in fish/plugins/ (gitignored) instead of mixing
# them into functions/ and conf.d/. The plugin list is fish/fish_plugins.
set -g fisher_path $__fish_config_dir/plugins

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]

for file in $fisher_path/conf.d/*.fish
    source $file
end
