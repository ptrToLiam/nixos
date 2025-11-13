{
  cfg,
  hyprplugins,
  config,
  pkgs,
  lib,
  callPackage,
  inputs,
  ...
}:

{
  home.username = cfg.username;
  home.homeDirectory = cfg.homeDirectory;

  imports = [
    ./file.nix # config file out-of-store links
    ./pkgs.nix # system pkgs
    ./services.nix # system services

    # general modules
    ../../modules/home-manager/tmux.nix

    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "emacsclient";
    GIT_EDITOR = "nvim";
    NIX_SHELL_PRESERVE_PROMPT = 1;
    NIX_CONFIG_DIR = "${cfg.homeDirectory}/personal/nixos";
  };

  nix.settings.extra-trusted-substituters = [
    "https://ghostty.cachix.org"
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # ENV SETTINGS
  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
