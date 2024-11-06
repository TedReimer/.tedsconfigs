{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Automatically upgrade the channel
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  networking.hostName = "tedjreimer"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ted = {
    isNormalUser = true;
    description = "Ted Reimer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #kate
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox-unwrapped # The usual firefox is a wrapped version
    librewolf-unwrapped # browser for dealing with Dad's things
    surf # Suckless simple browser
    vim
    wget
    git
    stow # dotfile manager
    gh # github CLI
    fzf
    zip
    unzip
    p7zip # for 7z files
    qmk # sweep/etc keyboard modification
    vlc # media player
    blueberry # Bluetooth manager
    dmenu # For launching programs in i3 and sway
    pcmanfm # File manager
#   lf # terminal file manager
    nnn # terminal file manager
    starship # terminal prompt
    fastfetch # enivornment fetch and display cli
    pulseaudio
    btop # terminal system monitor
    auto-cpufreq # battery life improvement
    zoxide # cd command that learns which directories you care about
    tree # Directory tree viewer
    picom # compositor for X
    mupdf # pdf viewer
    texliveFull # LaTeX
    discord
    prismlauncher # Minecraft launcher (official launcher is broken for 1.19+
    #Hyprland recommended stuff:
    kitty
#   st
    gimp # photo (screenshot) editing
    slstatus # dwm status bar
    # Programming languages
    gcc # C and C++
    lua # For nvim
    lua-language-server
    python3
    go
    gopls # Go language server
    rustup # Everything for Rust
    zig # Why not?
    guile # GNU's Scheme
    ocaml
    opam # OCaml package manager
  ];

  services.auto-cpufreq = {
      enable = true;
      settings = {
          charger = {
              governor = "performance";
              turbo = "auto";
          };

          battery = {
              governor = "powersave";
              turbo = "auto";
          };
      };
  };

  programs.steam = {
    enable = true;
    # Open firewall to multiplayer features
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    
    # platformOptimizations.enable = true; # apparently this isn't real
  };

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    nerdfonts
  ];

  programs.firefox.enable = true;

  # Hyprland
  #programs.hyprland.enable = true;

# i3
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager.startx.enable = true;

    #windowManager.i3 = {
    #    enable = true;
    #    extraPackages = with pkgs; [
    #      i3status
    #    ];
    #};
    windowManager.dwm.enable = true;
    windowManager.dwm.package = pkgs.dwm.overrideAttrs {
        src = /home/ted/.tedsconfigs/tedwm;
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      slstatus = prev.slstatus.overrideAttrs (old: {
        src = /home/ted/.tedsconfigs/slstatus;
      });
    })
  ];

   # Enable the gnome-keyring secrets vault.
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  # Enable systemd-networkd
  #systemd.network.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
