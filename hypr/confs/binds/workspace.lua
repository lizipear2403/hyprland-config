-- 工作区导航: 切换 / 窗口移动 / 非 hy3 布局的 HJKL 方向导航
require("confs.binds.scripts")

--- 光标移到当前活动窗口中心
---@return HL.Dispatcher|nil
local function warpFixed()
    local win = hl.get_active_window()
    if win then
        local cx = win.at.x + win.size.x / 2
        local cy = win.at.y + win.size.y / 2
        return hl.dsp.cursor.move({ x = cx, y = cy })
    end
end

local HJKL_DIR = {
    { key = "H", direc = "left" },
    { key = "J", direc = "down" },
    { key = "K", direc = "up" },
    { key = "L", direc = "right" },
}

--- 工作区 id 循环: 1-9 与 11-15 各自首尾相接 (1→9、9→1、11→15、15→11)
---@param activeWorkspace HL.Workspace
---@param direction string "Left"|"Right"
---@return integer
local function calculateWorkspaceIndex(activeWorkspace, direction)
    if direction == "Left" then
        if activeWorkspace.id == 11 then return 15 end
        if activeWorkspace.id == 1 then return 9 end
        return activeWorkspace.id - 1
    else
        if activeWorkspace.id == 15 then return 11 end
        if activeWorkspace.id == 9 then return 1 end
        return activeWorkspace.id + 1
    end
end

--- 切换工作区焦点的 dispatcher
---@param ws HL.Workspace
---@param dir string "Left"|"Right"
---@return HL.Dispatcher
local function focusMoveWorkspaceDispatcher(ws, dir)
    if dir == "Left" then
        return hl.dsp.focus({ workspace = calculateWorkspaceIndex(ws, "Left") })
    else
        return hl.dsp.focus({ workspace = calculateWorkspaceIndex(ws, "Right") })
    end
end

--- 聚焦到相邻工作区
---@param dir string "Left"|"Right"
---@return nil
local function focusMoveWorkspace(dir)
    local monitor   = hl.get_active_monitor()
    local workSpace = hl.get_active_workspace()
    if monitor == nil or workSpace == nil then return end
    hl.dispatch(focusMoveWorkspaceDispatcher(workSpace, dir))
end

-- Super + Alt + H/L : 切换到相邻工作区
hl.bind(generateKeyBinds({ mainMod, thrMod, "H" }), function()
    focusMoveWorkspace("Left")
end)
hl.bind(generateKeyBinds({ mainMod, thrMod, "L" }), function()
    focusMoveWorkspace("Right")
end)

--- 将当前窗口移到相邻工作区
---@param direction string "Left"|"Right"
---@return nil
local function windowMoveWorkspace(direction)
    local activeWorkspace = hl.get_active_workspace()
    if activeWorkspace == nil then return end
    hl.dispatch(hl.dsp.window.move({ workspace = calculateWorkspaceIndex(activeWorkspace, direction) }))
end

-- Super + Ctrl + L/H : 窗口移到相邻工作区
hl.bind(generateKeyBinds({ mainMod, slaveMod, "L" }), function()
    windowMoveWorkspace("Right")
end)
hl.bind(generateKeyBinds({ mainMod, slaveMod, "H" }), function()
    windowMoveWorkspace("Left")
end)

-- Super + Shift + H/J/K/L : 窗口定向移动; Super + H/J/K/L : 焦点定向移动 (均仅非 hy3 布局)
for _, Pair in ipairs(HJKL_DIR) do
    hl.bind(generateKeyBinds({ mainMod, secMod, Pair.key }), function()
        local ws = hl.get_active_workspace()

        if ws == nil then return end
        if ws.tiled_layout ~= "hy3" then
            hl.dispatch(hl.dsp.window.move({ direction = Pair.direc }))
        end
    end)

    hl.bind(generateKeyBinds({ mainMod, Pair.key }), function()
        local ws = hl.get_active_workspace()

        if ws == nil then return end
        if ws.tiled_layout ~= "hy3" then
            hl.dispatch(hl.dsp.focus({ direction = Pair.direc }))
            warpFixed()
        end
    end)
end
