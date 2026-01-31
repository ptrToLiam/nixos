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
    praat
    prismlauncher
    mcpelauncher-ui-qt
  ];

  # BEGIN PER-HOST PROGRAMS
  programs = {
  };
}

