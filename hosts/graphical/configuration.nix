{ cfg, config, lib, pkgs, inputs, ... }:
{
  imports = [
    # inputs.dms.nixosModules.greeter
    inputs.dms.nixosModules.dank-material-shell
    inputs.dank-greeter.nixosModules.default
    inputs.nix-flatpak.nixosModules.nix-flatpak
    ./flatpak.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
  };

  networking = {
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;

      # Open ports in the firewall.
      allowedTCPPorts = [ 22 80 443 4070 5037 ];
      allowedUDPPorts = [ 4070 ];

      allowedTCPPortRanges = [
        { from = 8000; to = 8010; }
      ];

      allowPing = true;
    };
  };

  i18n= {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
          qt6Packages.fcitx5-chinese-addons
        ];
      };
    };
  };

  services = {
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;


    libinput.enable = true;
    blueman.enable = true;
    gvfs.enable = true;

    pulseaudio.enable = false;
    upower.enable = true;
  };

  security.pam.services.hyprlock = {};
  security.pam.services.login.enableGnomeKeyring = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      mplus-outline-fonts.githubRelease
    ];

    fontconfig = {
      enable = true;
      includeUserConf = true;
    };
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    trusted-users = [ "root" "@wheel" ];
    allowed-users = [ "root" "@wheel" ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
  };
  nix.optimise = {
    automatic = true;
    dates = [ "00:00" ];
  };

  users.users.liamm = {
    isNormalUser = true;
    description = "liamm";
    extraGroups = [
      "networkmanager" "wheel" "disk" "power"
      "video" "davfs2" "input" "greeter"
    ];
  };

  programs = {
    bash = {
      completion.enable = true;
      promptInit = ''
        if [[ -z $ORIG_SHLVL ]]; then
          export ORIG_SHLVL=$SHLVL
        fi
        
        if [[ $SHLVL -gt $ORIG_SHLVL ]]; then
          export PS1='\[\e[1;m\e[1;33m\e[1;m\] ($(($SHLVL - $ORIG_SHLVL))) \W\[\e[m\e[m\] 🐧 \[\e[1;32m\]~> \[\e[m\e[m\]'
        else
          export PS1='\[\e[1;m\e[1;33m\e[1;m\] \W\[\e[m\e[m\] 🐧 \[\e[1;32m\]~> \[\e[m\e[m\]'
        fi
      '';
    };

    dms-greeter = {
      enable = true;
      compositor.name = "hyprland";
      configHome = "/home/liamm";
    };

    gamemode = {
      enable = true;
      enableRenice = true;

      settings = {
        general = {
          softrealtime = "auto";
          renice = 10;
        };
      };
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
      withUWSM = true;
      plugins = [ ];
    };

    dank-material-shell = {
      enable = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    # hyprlock.enable = true;
    dconf.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        fontconfig
        libxkbcommon
        vulkan-loader
      ];
    };
    mtr.enable = true;
  };

  # maybe delete?
  lib.inputMethod.fcitx5.waylandFrontend = true;

  environment.systemPackages = with pkgs; [
    bat
    discord
    fd
    file
    ghostty
    git
    glib
    gnome-keyring
    libdrm
    libnotify
    mesa
    neovim
    ripgrep
    spotify
    unzip
    vim
    # waypipe -- temporarily broken
    wget
    wl-clipboard
    xdg-user-dirs
    zip
  ];

  environment.sessionVariables = {
    EDITOR = "focus";
    GIT_EDITOR = "nvim";
    NIX_SHELL_PRESERVE_PROMPT = "1";
    NIX_CONFIG_DIR = "/home/liamm/nixos";
  };
 
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  xdg = {
    mime.enable = true;
    portal = {
      enable = true;
      # wlr.enable = true;
      extraPortals = with pkgs;[ 
        xdg-desktop-portal-gtk 
        # xdg-desktop-portal-wlr
      ];
      config = {
        common = {
          default = [ "gtk" ];
        };
      };
    };
  };

}
