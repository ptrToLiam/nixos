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
    krita
    nvtopPackages.nvidia
    paper-icon-theme
  ];
}

