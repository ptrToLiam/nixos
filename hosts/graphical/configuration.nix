{ cfg, config, lib, pkgs, inputs, ... }:
{
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
      allowedTCPPorts = [ 21 22 80 443 4070 5037 ];
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
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };

    greetd = {
      enable = true;
      restart = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland";
        };
      };
    };

    libinput.enable = true;
    blueman.enable = true;
    gvfs.enable = true;

    pulseaudio.enable = false;
    upower.enable = true;
  };

  security.pam.services.hyprlock = {};
  environment = {
    etc = {
      "greetd/environments".text = ''
        Hyprland
        river
      '';
    };
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      liberation_ttf
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
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
  };

  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
  };
  nix.optimise = {
    automatic = true;
    dates = [ "00:00" ];
  };

  users.users.liamm = {
    isNormalUser = true;
    description = "liamm";
    extraGroups = [ "networkmanager" "wheel" "disk" "power" "video" "davfs2" "input" ];
  };

  programs = {
    steam = {
      enable = true;
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

    river-classic = {
      enable = true;
      xwayland.enable = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    hyprlock.enable = true;
    dconf.enable = true;
    nix-ld.enable = true;
    mtr.enable = true;
  };

  lib.inputMethod.fcitx5.waylandFrontend = true;

  environment.systemPackages = with pkgs; [
    bat
    bolt
    discord
    fd
    file
    ghostty
    glib
    gnome-keyring
    libdrm
    libnotify
    mesa
    neovim
    ripgrep
    spotify
    unzip
    usbutils
    uxplay
    vim
    waypipe
    wget
    wl-clipboard
    xdg-user-dirs
    zip
  ];
 
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  xdg = {
    mime.enable = true;
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs;[ 
        xdg-desktop-portal-gtk 
        xdg-desktop-portal-wlr
      ];
      config = {
        common = {
          default = [ "gtk" ];
        };
      };
    };
  };

}
