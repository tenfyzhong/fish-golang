function gocd --description 'cd to the repository path in $GOPATH'
    argparse -X 1 -i 'h/help' -- $argv 2>/dev/null

    if test $status -ne 0
        _gocd_help
        return 1
    end

    if set -q _flag_help
        _gocd_help
        return 0
    end

    if test -z "$argv"
        _gocd_help
        return 2
    end

    set -f remote "$argv"
    set -f raw $(string replace -r '.git$' '' $remote)
    set -f raw $(string replace -r '^(?:git@|https?:\/\/)([^/:]+)[:/](.*)' '$1\/$2' $raw)

    set -f url $(string replace '/' ':' $raw)
    set -f url "git@$url.git"

    set -f dir "$GOPATH/src/$raw"
    cd "$dir"
end

function _gocd_help
    printf %s\n \
        'gocd: cd to the repository in $GOPATH' \
        'Usage: gocd [options] <repository>' \
        '' \
        'Options:' \
        '  -h/--help  print this help message'
end
