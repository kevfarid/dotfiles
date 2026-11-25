function take --description 'mkdir -p and cd into it'
    if test -z "$argv[1]"
        echo "usage: take <dir>"
        return 1
    end
    mkdir -p $argv[1]; and cd $argv[1]
end
