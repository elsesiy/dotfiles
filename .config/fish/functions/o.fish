function o
    set loc $PWD

    if test (count $argv) -gt 0
        set loc $argv[1]
    end

    cd $loc && open .
end

