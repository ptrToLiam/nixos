{
  description = "Focus editor – binary flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      focus = pkgs.stdenv.mkDerivation rec {
        pname = "focus";
        version = "0.3.8";

        src = pkgs.fetchurl {
          url = "https://github.com/focus-editor/focus/releases/download/${version}/focus-linux";
          # Run once → Nix will tell you the correct hash and you paste it here
          hash = "sha256-rjA8TtXL+hJSmIVsv24M3wC1vBMFZURGTIVauzueaZE=";
          executable = true;
        };

        nativeBuildInputs = with pkgs; [ autoPatchelfHook makeWrapper ];

        buildInputs = with pkgs; [
          libxkbcommon
          xorg.libxcb
          xorg.libX11
          xorg.libXcursor
          xorg.libXrandr
          xorg.libXi
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
            --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath buildInputs}

          # .desktop file
          mkdir -p $out/share/applications
          cat > $out/share/applications/focus-editor.desktop <<EOF
          [Desktop Entry]
          Name=Focus
          Comment=A simple, fast, privacy-friendly text editor
          Exec=$out/bin/focus %F
          Icon=focus
          Terminal=false
          Type=Application
          Categories=Utility;TextEditor;
          MimeType=text/plain;text/markdown;text/x-rust;text/x-python;text/x-c;text/x-c++;
          StartupWMClass=focus
          EOF

          # Icon (Focus ships a 256×256 PNG inside the binary as a resource, but also includes one in the repo)
          # We'll just extract the embedded one at runtime or ship a fallback.
          # Easiest: download the official icon once and install it.
          install -Dm644 ${./focus.png} $out/share/icons/hicolor/256x256/apps/focus.png
          install -Dm644 ${./focus.png} $out/share/icons/hicolor/512x512/apps/focus.png
        '';

        meta = with pkgs.lib; {
          description = "Focus – a simple, fast, privacy-friendly text editor";
          homepage    = "https://github.com/focus-editor/focus";
          license     = licenses.mit;
          platforms   = platforms.linux;
          mainProgram = "focus";
        };
      };
    in {
      packages.${system} = {
        default = focus;
        focus   = focus;
      };
    };
}
