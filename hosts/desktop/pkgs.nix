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
    genymotion
    android-studio
  ];

  # BEGIN PER-HOST PROGRAMS
  programs = {
  };
}

