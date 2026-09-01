{ lib, ... }:
{
  services.flatpak.remotes = lib.mkOptionDefault [
    {
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }
  ];

  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = false;

  services.flatpak.packages = [
    { appId="us.zoom.Zoom";                origin = "flathub"; }
    { appId="org.kde.kdenlive";            origin = "flathub"; }
    { appId="org.signal.Signal";           origin = "flathub"; }
    { appId="org.vinegarhq.Vinegar";       origin = "flathub"; }
    { appId="com.github.tchx84.Flatseal";  origin = "flathub"; }
  ];
  services.flatpak.overrides."org.signal.Signal".Environment = {
    # SIGNAL_DISABLE_GPU_SANDBOX = "1";
    SIGNAL_PASSWORD_STORE = "gnome-libsecret";
  };
}
