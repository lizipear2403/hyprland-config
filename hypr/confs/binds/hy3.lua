-- hy3 插件快捷键 (仅 hy3 加载时生效)
require("confs.binds.scripts")

local hy3 = hl.plugin.hy3

if hy3 then
    -- Super + M (hy3 布局下) 进入 MAKE_GROUP; V/H 创建垂直/水平分组
    hl.define_submap("MAKE_GROUP", function()
        hl.bind("V", function()
            hl.dispatch(hy3.make_group("v"))
            hl.dispatch(hl.dsp.submap("reset"))
        end)
        hl.bind("H", function()
            hl.dispatch(hy3.make_group("h"))
            hl.dispatch(hl.dsp.submap("reset"))
        end)
    end)

    local hy3_directions = {
        h = "left", j = "down", k = "up", l = "right"
    }

    hl.bind(generateKeyBinds({ mainMod, "M" }), function()
        local ws = hl.get_active_workspace()
        if ws and ws.tiled_layout == "hy3" then
            hl.dispatch(hl.dsp.submap("MAKE_GROUP"))
        end
    end)

    -- Super + C 刻意不绑 hy3.kill_active, 避免与 core.lua 的 window.close 冲突
    hl.bind(generateKeyBinds({ mainMod, "TAB" }), hy3.make_group("tab"))
    hl.bind(generateKeyBinds({ mainMod, "U" }), hy3.change_focus("lower"))
    hl.bind(generateKeyBinds({ mainMod, "I" }), hy3.change_focus("raise"))

    -- Super + h/j/k/l : 焦点移动; Super + Shift + h/j/k/l : 窗口移动
    for key, direc in pairs(hy3_directions) do
        hl.bind(generateKeyBinds({ mainMod, key }), function()
            hl.dispatch(hy3.move_focus(direc, { warp = true }))
            hy3.warp_cursor()
        end)

        hl.bind(generateKeyBinds({ mainMod, secMod, key }),
            hy3.move_window(direc, { once = true }))
    end
end
