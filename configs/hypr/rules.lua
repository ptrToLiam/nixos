local float_classes = {
  "^(.*Emulator.*)$", "^(.*desktop-portal.*)$", "^(org.quickshell)$",
  "^(polkit.*agent.*)$", "^(praat)$", "^(network)$", "^(nm-)$", "^(Network)$",
  "^(Rofi)$",  "^(Gimp)$", "^(thunar)$", "^(Nautilus)$",
  "^(LmDev-.*)$", "^(notification)$", "^(Genymotion Player)$", "^(launcher)$",
}
local workspace_rules = {
  { class =  "^(KeePassXC)$",                                 ws = "2" },
  { class =  "^(firefox)$",                                   ws = "3" },
  { class =  "^(floorp)$",                                    ws = "3" },
  { class =  "^(brave-browser)$",                             ws = "3" },
  { class =  "^(Spotify)$",                                   ws = "4" },
  { class =  "^(discord)$",                                   ws = "6" },
  { class =  "^(.*obs.*)$",                                   ws = "8" },
  { title = "^(Minecraft)$",                                  ws = "name:extra" },
  { class = "^(signal)$",         title = "^(Signal)$",       ws = "6" },
  { class = "^(.*)$",             title = "^(.*WhatsApp.*)$", ws = "6" },
}
local fullscreen_inhibits = {
 "^(floorp)$", "^(firefox)$", "^(ghostty)$", "^(brave-browser)$",
}
local focus_inhibits = {
 "^(mpv)$", "^(firefox)$", "^(floorp)$", "^(spotify)$",
 "^(Emacs|emacs)$", "^(brave-browser)$", "^(Discord|dicord)$",
}

hl.window_rule({
  match = { class = "steam", title = "^(Friends List)$"},
  float = true,
})
hl.window_rule({
  match = { class = "^(Discord|discord)$" },
  opacity = "0.98 0.90",
})
hl.window_rule({
  match = { class = "^(Emacs|emacs)$" },
  opacity = "0.96 0.90",
})
hl.window_rule({
  match = { xwayland = true },
  rounding = 0,
})

for _, float_class in ipairs(float_classes) do
  hl.window_rule({
    match = { class = float_class},
    float = true
  })
end
for _, rule in ipairs(workspace_rules) do
  hl.window_rule({
    match = { class = rule.class, title = rule.title },
    workspace = rule.ws
  })
end
for _, fs_inhib in ipairs(fullscreen_inhibits) do
  hl.window_rule({
    match = { class = fs_inhib },
    idle_inhibit = "fullscreen",
  })
end
for _, fo_inhib in ipairs(focus_inhibits) do
  hl.window_rule({
    match = { class = fo_inhib },
    idle_inhibit = "focus",
  })
end

hl.window_rule({
  match = { class = "cs2" }, immediate = true
})
