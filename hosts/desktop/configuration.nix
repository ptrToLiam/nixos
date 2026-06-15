{ cfg, config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../graphical/configuration.nix
    ./file.nix
    ./pkgs.nix
    ./services.nix
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

    	open = false;
    	nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };


  services = {
    flatpak.enable = true;
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

  # This option defines the first version of NixOS you have installed on this particular machine
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
