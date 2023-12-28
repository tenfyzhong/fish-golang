function goclone --description 'Clone repository to $GOPATH'
    argparse -X 1 -i 'c/cd' 'h/help' -- $argv 2>/dev/null

    if test $status -ne 0
        _goclone_help
        return 1
    end

    if set -q _flag_help
        _goclone_help
        return 0
    end

    if test -z "$argv"
        _goclone_help
        return 2
    end

    set -f remote "$argv"
    set -f raw $(string replace -r '.git$' '' $remote)
    set -f raw $(string replace -r '^(?:git@|https?:\/\/)([^/:]+)[:/](.*)' '$1\/$2' $raw)

    set -f url $(string replace '/' ':' $raw)
    set -f url "git@$url.git"

    set -f dir "$GOPATH/src/$raw"

    echo "git clone $url $dir"
    git clone "$url" "$dir"

    if set -q _flag_cd
        cd "$dir"
    end
end

function _goclone_help
    printf %s\n \
        'goclone: Clone repository to $GOPATH' \
        'Usage: goclone [options] <repository>' \
        '' \
        'Options:' \
        '  -c/--cd    cd to the repository path' \
        '  -h/--help  print this help message'
end
