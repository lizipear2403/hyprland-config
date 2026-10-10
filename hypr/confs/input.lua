-- 输入设备 (键盘/鼠标/光标) 与 XWayland
hl.config({
    input = {
        sensitivity = -0.7,

        kb_layout = "us", -- 物理布局; 中文输入由 fcitx5 接管
        touchpad = {
            scroll_factor = 1.0
        }

    },
    xwayland = {
        force_zero_scaling = true
    },
})


hl.config({
    cursor = {
        enable_hyprcursor = true,
        sync_gsettings_theme = true, -- 同步到 GTK
        no_hardware_cursors = true,
    },
})
