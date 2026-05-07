{
  pkgs,
  ...
}:

{
  imports = [
    ../graphical/pkgs.nix #import shared packages
  ];

  # BEGIN PER-HOST PACKAGES
  users.users.liamm.packages = with pkgs; [
    android-studio
    genymotion
    hexchat
    krita
    paper-icon-theme
    shotcut
    nvtopPackages.nvidia
  ];
}

