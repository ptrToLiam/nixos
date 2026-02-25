{
  description = "Focus editor – binary package";

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
          hash = "sha256-rjA8TtXL+hJSmIVsv24M3wC1vBMFZURGTIVauzueaZE=";
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
            --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath buildInputs}

          # .desktop file
          mkdir -p $out/share/applications
          cat > $out/share/applications/focus.desktop <<EOF
          [Desktop Entry]
          Name=Focus
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

        meta = with pkgs.lib; {
          description = "Focus – a simple, fast, privacy-friendly text editor";
          homepage    = "https://github.com/focus-editor/focus";
          license     = licenses.gpl3Only;
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
