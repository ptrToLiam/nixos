{
  pkgs,
  ...
}:

{
  # BEGIN PACKAGES
  users.users.liamm.packages = with pkgs; [
    adw-gtk3
    arc-icon-theme
    ark
    audacity
    bibata-cursors
    brave
    btop
    diff-so-fancy
    emacs-all-the-icons-fonts
    emacs-gtk
    emacsPackages.pdf-tools
    exfatprogs
    fastfetch
    feh
    ffmpeg
    floorp-bin
    focus
    fred
    fzf
    gimp
    gtk4
    gvfs
    grimblast
    hyprpicker
    hyprpwcenter
    imagemagick
    kdePackages.qt6ct
    keepassxc
    libsForQt5.qt5ct
    localsend
    mpv
    mupdf
    nwg-displays
    nwg-look
    openvpn
    prismlauncher
    tela-icon-theme
    tela-circle-icon-theme
    texliveFull
    thunar
    thunar-volman
    tree
    wev
  ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-vaapi
      obs-vkcapture
    ];
  };
}

