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

  # Symlink per-host ddtfiles
  home.file = mkSymlinkAttrs {
    ".config/hypr/hypr-monitors.conf" = {
      source = ../../configs/hypr-desktop/hypr-monitors.conf;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".config/hypr/hypr-colors.conf" = {
      source = ../../configs/hypr-desktop/hypr-colors.conf;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".config/DankMaterialShell" = {
      source = ../../configs/dms-desktop;
      outOfStoreSymlink = true;
      recursive = true;
    };
  };
}
