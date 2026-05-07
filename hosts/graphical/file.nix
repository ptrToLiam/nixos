{ cfg, config, context, pkgs, ... }:

let
  mkSymlinkAttrs = import ../../utils/mkSymlinkAttrs.nix {
    inherit pkgs;
    inherit (cfg) context runtimeRoot;
  };

in
{
  systemd.user.tmpfiles.rules = mkSymlinkAttrs {
    # Fonts
    ".local/share/fonts" = {
        source = ../../fonts;
        outOfStoreSymlink = true;
        recursive = true;
    };

    # Configs
    ".config/hypr" = {
      source = ../../configs/hypr;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/matugen" = {
      source = ../../configs/matugen;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/focus-editor" = {
      source = ../../configs/focus-editor;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/river" = {
      source = ../../configs/river;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/waybar" = {
      source = ../../configs/waybar;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/ghostty" = {
      source = ../../configs/ghostty;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/nvim" = {
      source = ../../configs/nvim;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/wofi" = {
      source = ../../configs/wofi;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/swaync" = {
      source = ../../configs/swaync;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/fastfetch" = {
      source = ../../configs/fastfetch;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/emacs" = {
      source = ../../configs/emacs;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".cadacama/fred" = {
      source = ../../configs/fred;
      outOfStoreSymlink = true;
      recursive = true;
    };
    ".config/git" = {
      source = ../../configs/git;
      outOfStoreSymlink = true;
      recursive = true;
    };

    ".config/user-dirs.dirs" = {
      source = ../../configs/user-dirs.dirs;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".config/user-dirs.locale" = {
      source = ../../configs/user-dirs.locale;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".bashrc" = {
      source = ../../configs/bash/bashrc;
      outOfStoreSymlink = true;
      recursive = false;
    };
    ".gnupg/gpg-agent.conf" = {
      source = ../../configs/gnupg/gpg-agent.conf;
      outOfStoreSymlink = true;
      recursive = false;
    };
  };
}
