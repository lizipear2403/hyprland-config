-- 颜色体系: 边框 / 阴影 / 内发光 / 窗口组 / 背景
hl.config({
    -- 窗口边框
    general = {
        col = {
            active_border         = "rgba(9dcbfcff)",
            inactive_border       = "rgba(1d202488)",
            nogroup_border        = "rgba(d4bee588)",
            nogroup_border_active = "rgba(d4bee5ff)",
        },
    },

    -- 阴影 + 内发光
    decoration = {
        shadow = {
            enabled        = false,
            range          = 4,
            render_power   = 3,
            color          = "rgba(000000ee)",
            color_inactive = "rgba(00000066)",
        },
        glow = {
            enabled = false,
            -- range          = 30,
            -- render_power   = 4,
            -- color          = "rgba(9dcbfc44)",
            -- color_inactive = "rgba(9dcbfc22)",
        },
    },

    -- 窗口组
    group = {
        col = {
            border_active          = "rgba(9dcbfcff)",
            border_inactive        = "rgba(1d202488)",
            border_locked_active   = "rgba(ffb4abff)",
            border_locked_inactive = "rgba(ffb4ab77)",
        },
        groupbar = {
            enabled    = true,
            height     = 14,
            text_color = "rgba(e0e2e8ff)",
            col        = {
                active          = "rgba(134a74ff)",
                inactive        = "rgba(1d202488)",
                locked_active   = "rgba(93000aff)",
                locked_inactive = "rgba(93000a77)",
            },
        },
    },

    -- 桌面背景 + splash
    misc = {
        disable_hyprland_logo = false,
        background_color = "rgba(101418ff)",
        col = {
            splash = "rgba(e0e2e8ff)",
        },
    },
})
