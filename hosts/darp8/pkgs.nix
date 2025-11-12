{
  pkgs,
  ...
}:

{
  imports = [
    ../graphical/pkgs.nix #import shared packages
  ];

  # BEGIN PACKAGES
  home.packages = with pkgs; [
  ];

  # BEGIN PROGRAMS
  programs = {
  };
}

