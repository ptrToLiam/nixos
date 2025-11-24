{ cfg, config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../graphical/configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "lmdesktop";

  time.timeZone = "Europe/Dublin";

  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
    };
    nvidia = {
    	modesetting.enable = true;
    	powerManagement.enable = true;

    	open = true;
    	nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };


  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = false;
    pulseaudio.enable = false;
    upower.enable = true;

    xserver.videoDrivers = [ "nvidia" ];
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };

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
  system.stateVersion = "24.11"; # Did you read the comment?
}
