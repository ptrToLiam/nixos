hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibate-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibate-Modern-Ice")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")

hl.on("hyprland.start", function()
  hl.exec_cmd("bash -c 'wl-paste --watch cliphist store &'")
  hl.exec_cmd("fcitx5 -d")
  hl.exec_cmd("emacs --daemon")
  hl.exec_cmd("dms run")
end)

hl.config({
  general = {
    gaps_in = gaps_in,
    gaps_out = gaps_out,
    border_size = 2,
    resize_on_border = true,
    allow_tearing = true,
    layout = "scrolling",
    col = {
      active_border = Color_primary_container,
      inactive_border = Color_secondary_container,
    },
  },
  decoration = {
    rounding = 10,
    blur = {
      enabled = true,
      new_optimizations = true,
      passes = 2,
      size = 3,
      xray = true,
    },
    shadow = {
      color = Color_shadow,
      enabled = true,
      range = 4,
      render_power = 4,
    },
  },
  input = {
    touchpad = {
      disable_while_typing = true,
      drag_lock = false,
      middle_button_emulation = true,
      natural_scroll = true,
      scroll_factor = 0.5,
      tap_to_click = true,
    },

    follow_mouse = 1,
    kb_layout = us,
    numlock_by_default = true,
    sensitivity = 0,
  },
  render = {
    cm_enabled = true,
    cm_auto_hdr = 0,
    direct_scanout = 2,
  },
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    key_press_enables_dpms = true,
    mouse_move_enables_dpms = true,
  },
  quirks = {
    prefer_hdr = 0,
  },
  ecosystem = {
    no_donation_nag = true,
    no_update_news = true,
  },
})
