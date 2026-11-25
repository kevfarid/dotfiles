function gdel --description 'Delete all local branches except current, main and master'
    set -l current (git rev-parse --abbrev-ref HEAD 2>/dev/null); or return
    set -l branches (git branch --format='%(refname:short)' | string match -v -- $current | string match -v -r '^(main|master)$')
    test (count $branches) -gt 0; and git branch -D $branches
end
