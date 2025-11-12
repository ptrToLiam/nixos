{ cfg, config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../graphical/configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "darp8";

  time.timeZone = "Europe/Dublin";
  # time.timeZone = "America/New_York";

  services.tailscale.enable = false;

  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs;[
        intel-compute-runtime
        intel-media-driver
      ];
    };
    system76.enableAll = true;
  };

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; inherit cfg; };
    users = {
      "${cfg.username}" = import ./home.nix;
    };
    backupFileExtension = ".bak";
  };
 
  # This option defines the first version of NixOS you have installed on this particular machine
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
