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
  swapDevices = [ {
    device = "/var/swapfile";
    size = 24 * 1024;
  } ];

  boot.resumeDevice = "/dev/disk/by-uuid/c7704142-d0b9-4a85-af1c-ce776b895c0f";
  boot.kernelParams = [
    "resume_offset=13629440"
    "mem_sleep_default=deep"
  ];
  boot.initrd.postMountCommands = lib.mkAfter ''
    swapon /mnt-root/var/swapfile
  '';

  services.system76-scheduler.enable = true;
  services.tailscale.enable = false;
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = false;
  services.thermald.enable = true;

  systemd.services.charge-thresholds = {
    description = "Set System76 battery charge thresholds";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];  # Ensure daemon is ready
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.system76-power}/bin/system76-power charge-thresholds --profile balanced";
      RemainAfterExit = true;
    };
  };
  services.logind.lidSwitch = "suspend-then-hibernate";
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=20m
    SuspendState=mem
  '';

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
