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
    nvtopPackages.nvidia
    paper-icon-theme
    shotcut
  ];
}

