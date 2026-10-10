-- 窗口切换 / 布局切换 / 退出重载 / 鼠标操作 / 全屏 / 截图
require("confs.binds.scripts")
local hy3 = hl.plugin.hy3

-- Shift + Tab : 循环切换已平铺窗口焦点
hl.bind(generateKeyBinds({ secMod, "TAB" }), hl.dsp.window.cycle_next({ tiled = true }))

--- 当前可用布局列表 (hy3 加载时多一个 "hy3")
---@return string[]
local function layoutList()
    if hy3 then
        return { "master", "dwindle", "scrolling", "monocle", "hy3" }
    else
        return { "master", "dwindle", "scrolling", "monocle" }
    end
end

hl.bind(generateKeyBinds({ mainMod, thrMod, "I" }), function()
    hl.dispatch(hl.dsp.window.cycle_next({
        floating = not hl.get_active_window().floating
    }))
end)

-- Ctrl + Tab : 循环切换当前工作区布局
hl.bind(generateKeyBinds({ slaveMod, "TAB" }), function()
    local layouts     = layoutList()
    local workspace   = hl.get_active_workspace()

    local next_layout = "dwindle"

    if not workspace then
        return
    end

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + 1 -- 循环索引
            next_layout = layouts[next_layout_idx]
            break
        end
    end

    if workspace.special then
        hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
    else
        hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
    end
    hl.dispatch(hl.dsp.event("layoutchange")) -- 触发布局重载, 不可删
end)
hl.bind(generateKeyBinds({ mainMod, secMod, "P" }), hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(generateKeyBinds({ mainMod, secMod, "R" }), hl.dsp.exec_cmd("hyprctl reload"))

-- Alt + 鼠标左键 : 移动窗口
hl.bind(generateKeyBinds({ thrMod, "mouse:272" }), hl.dsp.window.drag(), { mouse = true })
-- Super + Alt + 鼠标左键 : 调整窗口大小
hl.bind(generateKeyBinds({ mainMod, "mouse:272" }), hl.dsp.window.resize(), { mouse = true })

-- Ctrl + Alt + A : 区域截图
hl.bind(generateKeyBinds({ slaveMod, thrMod, "A" }),
    hl.dsp.exec_cmd('mark-shot'))

-- Super + F : 三态全屏 (内部全屏 → 最大化全屏 → 退出)
hl.bind(generateKeyBinds({ mainMod, "F" }), function()
    local window = hl.get_active_window()
    if window == nil then return end

    local state = window.fullscreen
    if state == 0 then
        hl.dispatch(hl.dsp.window.fullscreen_state({ internal = 1, client = 0, action = "toggle" }))
    elseif state == 1 then
        hl.dispatch(hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))
    else
        hl.dispatch(hl.dsp.window.fullscreen_state({ internal = 0, client = 0, action = "toggle" }))
    end
end)

-- Super + C : 关闭窗口 (刻意不绑 hy3.kill_active, 避免双绑定冲突)
hl.bind(generateKeyBinds({ mainMod, "C" }), function()
    hl.dispatch(hl.dsp.window.close())
end)

hl.bind(generateKeyBinds({ mainMod, "T" }), hl.dsp.window.float({ action = "toggle" }))
