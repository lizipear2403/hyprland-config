-- Hyprland Lua 配置入口 (各模块见 confs/)
require("confs.env")
require("confs.input")
require("confs.monitors")
require("confs.workspace")
require("confs.decoration")
require("confs.colors")
require("confs.start")

require("confs.plugins.hy3")
require("confs.plugins.gloview")

require("confs.binds.gestures")
require("confs.binds.core")
require("confs.binds.apps")
require("confs.binds.workspace")
require("confs.binds.zoom")
require("confs.binds.hy3")

hl.device({
    name = "uniw0001:00-093a:0255-touchpad",
    sensitivity = 0.3
})

-- window_rule
hl.bind("SUPER + SHIFT + I", hl.dsp.exec_cmd("pypr stash_send   Follow"))
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd("pypr stash_toggle  Follow"))
hl.window_rule({
    name = "nvim-to-notes",
    match = {
        class = "^(notes)$"
    },
    workspace = "special:draft",
    float = true,
    center = true
})
