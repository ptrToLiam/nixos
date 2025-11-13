{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprsysteminfo = {
      url = "github:hyprwm/hyprsysteminfo";
    };
    hyprpwcenter = {
      url = "github:hyprwm/hyprpwcenter";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
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
              hyprland = inputs.hyprland.packages.${system}.hyprland;
              hyprsysteminfo = inputs.hyprsysteminfo.packages.${system}.hyprsysteminfo;
              hyprpwcenter = inputs.hyprpwcenter.packages.${system}.hyprpwcenter;
              xdg-desktop-portal-hyprland = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
              quickshell = inputs.quickshell.packages.${system}.quickshell;
            })
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
