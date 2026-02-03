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
    android-studio
    genymotion
    nvtopPackages.nvidia
  ];

  # BEGIN PER-HOST PROGRAMS
  programs = {
  };
}

