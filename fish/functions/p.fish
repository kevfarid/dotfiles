function p --description 'Run npm/pnpm/yarn/bun based on the nearest lockfile'
    set -l pm npm
    set -l dir .
    for i in (seq 3)
        if test -f $dir/pnpm-lock.yaml
            set pm pnpm; break
        else if test -f $dir/yarn.lock
            set pm yarn; break
        else if test -f $dir/bun.lock; or test -f $dir/bun.lockb
            set pm bun; break
        end
        set dir $dir/..
    end
    echo (set_color yellow)"Using package manager: "(set_color green)$pm(set_color normal)
    command $pm $argv
end
