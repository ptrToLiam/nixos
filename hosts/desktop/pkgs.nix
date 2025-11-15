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
  ];

  # BEGIN PER-HOST PROGRAMS
  programs = {
  };
}

