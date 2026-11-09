-- 显示器

hl.monitor({
    output   = "eDP-1",
    mode     = "2560x1600@300",
    position = "960x0",
    scale    = 1.25,
    bitdepth = 10

})

hl.monitor({
    output    = "HDMI-A-1",
    mode      = "1920x1200@60",
    position  = "0x0",
    scale     = 1.25,
    transform = 3,
    bitdepth  = 10
})
