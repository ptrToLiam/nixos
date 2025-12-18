{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    focus-editor = {
      url = "path:./pkgs/focus";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
      inputs.systems.follows = "hyprland/systems";
    };
    hyprpwcenter = {
      url = "github:hyprwm/hyprpwcenter";
      inputs.hyprgraphics.follows = "hyprland/hyprgraphics";
      inputs.aquamarine.follows = "hyprland/aquamarine";
      inputs.hyprutils.follows = "hyprland/hyprutils";
      inputs.systems.follows = "hyprland/systems";
    };

    quickshell = {
      follows = "dms/quickshell";
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
              focus = inputs.focus-editor.packages.${system}.focus;
              hyprland = inputs.hyprland.packages.${system}.hyprland;
              hyprsysteminfo = inputs.hyprsysteminfo.packages.${system}.hyprsysteminfo;
              hyprpwcenter = inputs.hyprpwcenter.packages.${system}.hyprpwcenter;
              hyprPluginPkgs = inputs.hyprland-plugins.packages.${system};
              quickshell = inputs.quickshell.packages.${system}.quickshell;
              xdg-desktop-portal-hyprland = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
            })
          ];
      };

      hypr-plugin-dir = pkgs.symlinkJoin {
        name = "hyprland-plugins";
        paths = with pkgs.hyprPluginPkgs; [
          hyprexpo
          hyprscrolling
        ];
      };

      defaultCfg = rec {
        username = "liamm";
        homeDirectory = "/home/${username}";
        runtimeRoot = "${homeDirectory}/personal/nixos";
        context = self;
      };
    in
    {
      nixosConfigurations = {
        darp8 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; cfg = defaultCfg; hypr-plugin-dir = hypr-plugin-dir; };
          modules = [
            hyprland.nixosModules.default
            ./hosts/darp8/configuration.nix
            { nixpkgs.pkgs = pkgs; }
          ];
        };
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; cfg = defaultCfg; hypr-plugin-dir = hypr-plugin-dir; };
          modules = [
            hyprland.nixosModules.default
            ./hosts/desktop/configuration.nix
            { nixpkgs.pkgs = pkgs; }
          ];
        };
      };
    };
}
