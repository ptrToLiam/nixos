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
