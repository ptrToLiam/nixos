{
  pkgs,
  ...
}:

{
  imports = [
    ../graphical/pkgs.nix #import shared packages
  ];

  # BEGIN PER-HOST PACKAGES
  home.packages = with pkgs; [
    adw-gtk3
    android-studio
    genymotion
    fred
    hexchat
    krita
    kdePackages.qt6ct
    libsForQt5.qt5ct
    paper-icon-theme
    # papirus-icon-theme
    shotcut
    tela-icon-theme
    tela-circle-icon-theme
    nvtopPackages.nvidia
    prismlauncher
  ];

  # BEGIN PER-HOST PROGRAMS
  programs = {
  };
}

