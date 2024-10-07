export SUDO_EDITOR="vim"

eval "$(zoxide init bash)"

export STARSHIP_CONFIG=~/.tedsconfigs/extras/starship.toml
eval "$(starship init bash)"

alias "ls"="ls -A --color"
alias ":q"="exit"
alias "rebuild-nix"="sudo cp ~/.tedsconfigs/nix/configuration.nix /etc/nixos/configuration.nix && sudo nixos-rebuild switch -I nixos-config=/etc/nixos/configuration.nix"
#alias "upgrade-nix"="sudo nixos-rebuild switch --upgrade --flake ~/.tedsenv/nixflake"

eval "fastfetch --config ~/.tedsconfigs/extras/tedsfetch.jsonc"
