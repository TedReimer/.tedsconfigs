set fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(zoxide init fish)"
    alias "ls" "ls -A --color"
    alias ":q" "exit"
    #alias "v" "mupdf-x11"
    alias "edit" 'vim "$(fzf)"'

    eval "fastfetch --config ~/.tedsconfigs/extras/tedsfetch.jsonc"

    set STARSHIP_CONFIG ~/.config/starship.toml
    starship init fish | source
end

function v
    mupdf-x11 $argv &
    disown
end
