set fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(zoxide init fish)"
    alias "ls" "ls -A --color"
    alias ":q" "exit"
    #alias "v" "mupdf-x11"
    alias "edit" 'vim "$(fzf)"'

    eval "fastfetch --config ~/.tedsconfigs/extras/tedsfetch.jsonc"

	set -x MANPAGER "vim +MANPAGER --not-a-term -"
    set EDITOR vim
    set SUDO_EDITOR vim

    set STARSHIP_CONFIG ~/.config/starship.toml
    starship init fish | source
end

function v
    mupdf-x11 $argv &
    disown
end

function prnt
    sudo mount /dev/sda1 /media/usb/
    sudo rm /media/usb/*
    sudo mv ~/Downloads/* /media/usb/
    sudo umount /media/usb
end
