{ cfg, config, context, pkgs, ... }:

let
  mkSymlinkAttrs = import ../../utils/mkSymlinkAttrs.nix {
    inherit pkgs;
    inherit (cfg) context runtimeRoot;
  };

in
{
  imports = [ ../graphical/file.nix ];

  systemd.user.tmpfiles.rules = mkSymlinkAttrs {
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
