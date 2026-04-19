{ pkgs, ... }:

{
  # Emacs daemon
  systemd.user.services.emacs = {
    description = "Emacs text editor";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "notify";
      ExecStart = "${pkgs.emacs-gtk}/bin/emacs --fg-daemon";
      ExecStop = "${pkgs.emacs-gtk}/bin/emacsclient --eval '(kill-emacs)'";
      TimeoutStartSec = "10min";
      Restart = "on-failure";
    };
  };

  # Bluetooth media key proxy
  systemd.user.services.mpris-proxy = {
    description = "MPRIS proxy for Bluetooth media controls";
    wantedBy = [ "bluetooth.target" ];
    after = [ "bluetooth.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
      Restart = "on-failure";
    };
  };

  # Nextcloud desktop client
  systemd.user.services.nextcloud-client = {
    description = "Nextcloud desktop sync client";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.nextcloud-client}/bin/nextcloud --background";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

  # gnome-keyring and gpg-agent are handled at system level
}
