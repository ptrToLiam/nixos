{ cfg, config, context, pkgs, ... }:

let
  inherit (config.home) username homeDirectory;

  mkSymlinkAttrs = import ../../utils/mkSymlinkAttrs.nix {
    inherit pkgs;
    inherit (cfg) context runtimeRoot;
    hm = config.lib; # same as: cfg.context.inputs.home-manager.lib.hm;
  };

in
{
  imports = [
    ../graphical/file.nix # import shared configs
  ];

  # Symlink per-host dotfiles
  home.file = mkSymlinkAttrs {
    ".config/hypr/hypr-monitors.conf" = {
      source = ../../configs/hypr-darp8/hypr-monitors.conf;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".config/hypr/hypr-colors.conf" = {
      source = ../../configs/hypr-darp8/hypr-colors.conf;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".config/hypr/monitors.conf" = {
      source = ../../configs/hypr-darp8/monitors.conf;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".config/hypr/workspaces.conf" = {
      source = ../../configs/hypr-darp8/workspaces.conf;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".config/DankMaterialShell" = {
      source = ../../configs/dms-darp8;
      outOfStoreSymlink = true;
      recursive = true;
    };
  };
}
