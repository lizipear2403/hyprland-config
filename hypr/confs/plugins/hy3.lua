local hy3 = hl.plugin.hy3

if hy3 then
    hl.config({
        plugin = {
            hy3 = {
                node_collapse_policy = 2, -- 0=总是折叠冗余组 1=从不折叠 2=仅标签组保留
                group_inset = 10,         -- 单窗口组的分割线偏移像素
                tab_first_window = false, -- 首个窗口不自动包成标签组
                tabs = {
                    height = 22,
                    padding = 6,
                    from_top = false,
                    radius = 6,
                    border_width = 2,
                    render_text = true,
                    text_center = true,
                    text_font = "Hack Nerd Font",
                    text_height = 8,
                    text_padding = 3,
                    colors = {
                        active                    = "rgba(33ccff40)",
                        active_border             = "rgba(33ccffee)",
                        active_text               = "rgba(ffffffff)",
                        active_alt_monitor        = "rgba(60606040)",
                        active_alt_monitor_border = "rgba(808080ee)",
                        active_alt_monitor_text   = "rgba(ffffffff)",
                        focused                   = "rgba(60606040)",
                        focused_border            = "rgba(808080ee)",
                        focused_text              = "rgba(ffffffff)",
                        inactive                  = "rgba(30303020)",
                        inactive_border           = "rgba(606060aa)",
                        inactive_text             = "rgba(ffffffff)",
                        urgent                    = "rgba(ff223340)",
                        urgent_border             = "rgba(ff2233ee)",
                        urgent_text               = "rgba(ffffffff)",
                        locked                    = "rgba(90903340)",
                        locked_border             = "rgba(909033ee)",
                        locked_text               = "rgba(ffffffff)",
                    },
                    blur = true,
                    opacity = 1.0,
                },
                autotile = {
                    enable = false,           -- 纯手动平铺
                    ephemeral_groups = true,
                    trigger_width = 0,        -- 0 = 始终自动竖分
                    trigger_height = 0,       -- 0 = 始终自动横分
                    workspaces = "4",
                },
            },
        },
    })
end
