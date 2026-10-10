hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "default",
    style = "slidefade"
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "default",
    style = "slidefade"
})
hl.config({
    general = {
        border_size = 4,
        gaps_in = 0,
        gaps_out = 10
    },
    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        blur = {
            enabled            = true,
            size               = 4,
            passes             = 3,
            new_optimizations  = true,
            xray               = false,
            ignore_opacity     = true,
            popups             = true,
            popups_ignorealpha = 0.2,
            noise              = 0.024,
        },
    },

})
