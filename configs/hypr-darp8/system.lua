-- builtin display
hl.monitor({
  output = "eDP-1",
  mode = "1920x1060@60.0",
  position = "0x0",
  scale = 1,
})

-- general hotplugging
hl.monitor({
  mode = "preferred",
  position = "auto",
  scale = 1,
})