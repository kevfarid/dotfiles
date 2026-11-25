function gpsup --description 'Push current branch and set upstream'
    set -l branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    or begin
        echo "❌ No current branch found."
        return 1
    end
    git push --set-upstream origin $branch
end
