function __gocd_complete
    set -l cmd (commandline -po)
    set -e cmd[1]

    set -l gopath (realpath $GOPATH/src/)/
    set p (string join '' $gopath $cmd)

    set -l len (math (string length $gopath)+1)
    set -l items (__fish_complete_directories $p)
    for item in $items
        echo (string sub -s $len $item)
    end
end

complete -c gocd -s h -l help -d 'print this help message'
complete -c gocd -f -a "(__gocd_complete)"
