# Original taken from: https://github.com/urob/dotfiles/blob/main/lib/mkSymlinkAttrs.nix

# Rewritten for systemd.user.tmpfiles.rules — no home-manager dependency.
# Output: flat list of tmpfiles rule strings, assign to systemd.user.tmpfiles.rules
#
# Usage (unchanged from before):
#   systemd.user.tmpfiles.rules = mkSymlinkAttrs {
#     ".config/hypr" = { source = ./configs/hypr; outOfStoreSymlink = true; recursive = true; };
#     ".config/ghostty/config" = { source = ./configs/ghostty/config; outOfStoreSymlink = true; };
#   };

{ pkgs, context, runtimeRoot, ... }:

let
  inherit (pkgs) lib;

  # Quote a path if it contains spaces so tmpfiles.d parses it as a single token
  q = p: if builtins.match ".* .*" p != null then "\"${p}\"" else p;

  # Translate a store path back to its runtimeRoot equivalent
  runtimePath = path:
    let
      rootStr = toString context;
      pathStr = toString path;
    in
    assert lib.assertMsg (lib.hasPrefix rootStr pathStr)
      "${pathStr} does not start with ${rootStr}";
    runtimeRoot + lib.removePrefix rootStr pathStr;

  rule = dest: src: "L+ ${q dest} - - - - ${q src}";

in fileAttrs:
  lib.flatten (lib.mapAttrsToList
    (name: value:
      if value.outOfStoreSymlink or false
      then
        if value.recursive or false
        then
          map (file:
            let rel = lib.removePrefix (toString value.source) (toString file);
            in rule "%h/${name}${rel}" (runtimePath file)
          ) (lib.filesystem.listFilesRecursive value.source)
        else
          [ (rule "%h/${name}" (runtimePath value.source)) ]
      else
        lib.warn "mkSymlinkAttrs: ${name} is not outOfStoreSymlink, skipping" []
    )
    fileAttrs)
