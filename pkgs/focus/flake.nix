{
  description = "Focus editor – binary package (stable + nightlies)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) lib;

      # ---------------------------------------------------------------------------
      # Shared derivation for a prebuilt Focus binary
      # ---------------------------------------------------------------------------
      mkFocus = {
        version,
        url,
        hash,
        desktopName ? "Focus",
        extraMeta ? { },
      }:
        pkgs.stdenv.mkDerivation rec {
          pname = "focus";
          inherit version;

          src = pkgs.fetchurl {
            inherit url hash;
            executable = true;
          };

          nativeBuildInputs = with pkgs; [ autoPatchelfHook makeWrapper ];

          buildInputs = with pkgs; [
            fontconfig
            libxkbcommon
            libxcb
            libX11
            libXcursor
            libXrandr
            libXi
            libGL
            vulkan-loader
            wayland
          ];

          unpackPhase = "true";

          installPhase = ''
            mkdir -p $out/bin
            cp $src $out/bin/focus
            chmod +x $out/bin/focus

            wrapProgram $out/bin/focus \
              --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath buildInputs}

            mkdir -p $out/share/applications
            cat > $out/share/applications/focus.desktop <<EOF
            [Desktop Entry]
            Name=${desktopName}
            Comment=A simple, fast, privacy-friendly text editor
            Exec=$out/bin/focus %F
            Icon=focus
            Terminal=false
            Type=Application
            Categories=Utility;TextEditor;
            MimeType=text/plain;text/markdown;text/x-rust;text/x-python;text/x-c;text/x-c++;text/x-zig;
            StartupWMClass=focus
            EOF

            # icon install (image is 1024x1024, but conventions are 256, 512)
            for size in 256 512; do
              mkdir -p $out/share/icons/hicolor/''${size}x''${size}/apps
              install -Dm644 ${./focus.png} $out/share/icons/hicolor/''${size}x''${size}/apps/focus.png
            done

            runHook postInstall
          '';

          meta = with lib; {
            description = "Focus – a simple, fast, privacy-friendly text editor";
            homepage    = "https://github.com/focus-editor/focus";
            license     = licenses.gpl3Only;
            platforms   = platforms.linux;
            mainProgram = "focus";
          } // extraMeta;
        };

      # ---------------------------------------------------------------------------
      # Stable release (GitHub)
      # ---------------------------------------------------------------------------
      focus = mkFocus {
        version = "0.3.8";
        url     = "https://github.com/focus-editor/focus/releases/download/0.3.8/focus-linux";
        hash    = "sha256-rjA8TtXL+hJSmIVsv24M3wC1vBMFZURGTIVauzueaZE=";
      };

      # ---------------------------------------------------------------------------
      # Nightlies from https://ileonte.dev/focus-builds/Linux/nightly/x86_64/
      #
      # To add a new build:
      #   1. Note the filename focus-linux-nightly-<rev>
      #   2. nix hash file /path/to/downloaded-binary
      #      (or: nix-prefetch-url URL --type sha256  → then nix hash to-sri)
      #   3. Insert an attr below. Put the newest rev first / set latestNightly.
      # ---------------------------------------------------------------------------
      nightlyIndex = {
        "7f9a242" = { date = "2026-08-29";
                      hash = "sha256-U7yr6Uu2VpmAv6mUx/uh5XZeCNsWrD9NmPonEMokG0Y="; };
        "c602004" = { date = "2026-08-19";
                      hash = "sha256-1+qvuy5jTzAC6Ri6IwQ0dtPn2sJ4Xeb17kfsQ/RESzI="; };
        "539b4c4" = { date = "2026-08-03";
                      hash = "sha256-+q4Wuj8BcWIOXkF8PpVVjki2jf+Xhf25Z7GNWl1SNYM="; };
        "8c14874" = { date = "2026-07-27";
                      hash = "sha256-l09M68++2Gf4wSZ4IXreXkLayhY4sY1NOxHYdmojMBc="; };
        "a651849" = { date = "2026-06-28";
                      hash = "sha256-ZcMrFBJr17PINCkNVHYkaXKPvQ0ikipzyo+J/9M4G/w="; };
      };

      latestNightly = "7f9a242";

      nightlyUrl = rev:
        "https://ileonte.dev/focus-builds/Linux/nightly/x86_64/focus-linux-nightly-${rev}";

      mkNightly = rev: info:
        mkFocus {
          version      = "nightly-${rev}";
          url          = nightlyUrl rev;
          hash         = info.hash;
          desktopName  = "Focus (nightly ${rev})";
          extraMeta    = {
            description = "Focus editor nightly ${rev} (${info.date})";
          };
        };

      # attrset: { "7f9a242" = <drv>; ... }
      nightlies = lib.mapAttrs mkNightly nightlyIndex;

      # packages named focus-nightly-<rev>
      nightlyPackages =
        lib.mapAttrs' (rev: pkg: lib.nameValuePair "focus-nightly-${rev}" pkg) nightlies;
    in {
      packages.${system} = {
        default       = focus;
        focus         = focus;
        focus-nightly = nightlies.${latestNightly}; # newest pinned nightly
      } // nightlyPackages;

      # Convenience: nix run .#focus-nightly
      apps.${system} = {
        default = {
          type    = "app";
          program = "${focus}/bin/focus";
        };
        focus-nightly = {
          type    = "app";
          program = "${nightlies.${latestNightly}}/bin/focus";
        };
      };

      # So you can inspect available nightlies without building:
      #   nix eval .#legacyPackages.x86_64-linux --raw  (not used)
      # Better: look at packages.* or:
      overlays.default = final: prev: {
        focus         = focus;
        focus-nightly = nightlies.${latestNightly};
      };
    };
}
