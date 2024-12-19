# expand !! to the last history item
function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item

# This expands .. to cd ../, ... to cd ../../ and .... to cd ../../../ and so on.
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

# expand =foo to command path of foo
function commandpath
    set -l cmd (string replace -r '^=(.+)$' '$1' -- $argv)
    or return
    command -s $cmd
end
abbr --add --position anywhere --regex '=.*' --function commandpath commandpath

# source: https://github.com/kubermatic/fubectl/blob/master/fubectl.source#L9-L10
function _inline_fzf
    fzf --multi --ansi -i -1 --height=50% --reverse -0 --header-lines=1 --inline-info --border
end

function _inline_fzf_nh
    fzf --multi --ansi -i -1 --height=50% --reverse -0 --inline-info --border
end
