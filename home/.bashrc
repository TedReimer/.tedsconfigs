export SUDO_EDITOR="vim"

eval "$(zoxide init bash)"

export STARSHIP_CONFIG=~/.tedsconfigs/extras/starship.toml
eval "$(starship init bash)"

alias "ls"="ls -A --color"
alias ":q"="exit"
alias 'v'='mupdf-x11'
alias 'edit'='vim "$(fzf)"'

eval "fastfetch --config ~/.tedsconfigs/extras/tedsfetch.jsonc"
