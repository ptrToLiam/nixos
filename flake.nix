{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dank-greeter = {
      url = "github:AvengeMedia/dank-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    focus-editor = {
      url = "path:./pkgs/focus";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lmpkgs = {
      url = "git+ssh://git@ssh.git.ptrtoliam.dev:2222/liam/nix-pkgs.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpwcenter = {
      url = "github:hyprwm/hyprpwcenter";
      inputs.hyprgraphics.follows = "hyprland/hyprgraphics";
      inputs.aquamarine.follows = "hyprland/aquamarine";
      inputs.hyprutils.follows = "hyprland/hyprutils";
      inputs.systems.follows = "hyprland/systems";
    };
  };

  outputs = { self, nixpkgs, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (final: prev: {
              ark = inputs.lmpkgs.packages.${system}.ark;
              ark-cli = inputs.lmpkgs.packages.${system}.ark-cli;
              dank-greeter = inputs.dank-greeter.nixosModules.default;
              fred = inputs.lmpkgs.packages.${system}.fred;
              focus = inputs.focus-editor.packages.${system}.focus;
              hyprland = inputs.hyprland.packages.${system}.hyprland;
              hyprpwcenter = inputs.hyprpwcenter.packages.${system}.hyprpwcenter;
              xdg-desktop-portal-hyprland = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
            })
          ];
      };

      defaultCfg = rec {
        username = "liamm";
        homeDirectory = "/home/${username}";
        runtimeRoot = "${homeDirectory}/nixos";
        context = self;
      };
    in
    {
      nixosConfigurations = {
        darp8 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; cfg = defaultCfg; };
          modules = [
            hyprland.nixosModules.default
            ./hosts/darp8/configuration.nix
            { nixpkgs.pkgs = pkgs; }
          ];
        };
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; cfg = defaultCfg; };
          modules = [
            hyprland.nixosModules.default
            ./hosts/desktop/configuration.nix
            { nixpkgs.pkgs = pkgs; }
          ];
        };
      };
    };
}
