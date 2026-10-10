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


local function windowMoveWorkspace(direction)
    local activeWorkspace = hl.get_active_workspace()
    if activeWorkspace == nil then return end
    hl.dispatch(hl.dsp.window.move({ workspace = calculateWorkspaceIndex(activeWorkspace, direction) }))
end
local function focusMoveWorkspaceDispatcher(ws, dir)
    if dir == "Left" then
        return hl.dsp.focus({ workspace = calculateWorkspaceIndex(ws, "Left") })
    else
        return hl.dsp.focus({ workspace = calculateWorkspaceIndex(ws, "Right") })
    end
end

local function focusMoveWorkspace(dir)
    local monitor   = hl.get_active_monitor()
    local workSpace = hl.get_active_workspace()
    if monitor == nil or workSpace == nil then return end
    hl.dispatch(focusMoveWorkspaceDispatcher(workSpace, dir))
end


hl.gesture({
    fingers = 3,
    direction = "right",
    action = function()
        focusMoveWorkspace("Left")
    end
})

hl.gesture({
    fingers = 4,
    direction = "up",
    action = function()
        hl.dispatch(hl.dsp.exec_cmd("pypr-client toggle terminal"))
    end
})
hl.gesture({
    fingers = 4,
    direction = "down",
    action = function()
        hl.dispatch(hl.dsp.exec_cmd("pypr-client toggle terminal"))
    end
})

hl.gesture({
    fingers = 3,
    direction = "Left",
    action = function()
        focusMoveWorkspace("Right")
    end
})
-- hl.gesture({
--     fingers = 4,
--     direction = "horizontal",
--     action = {
--         start = function(e)
--             hl.notification.create({
--                 text = "start: type=" ..
--                     e.type ..
--                     " time_ms=" ..
--                     e.time_ms .. " fingers=" .. e.fingers .. " delta=(" .. e.delta.x .. ", " .. e.delta.y .. ")",
--                 timeout = 1000,
--                 icon = 1
--             })
--         end,
--         -- update = function(e) hl.notification.create({ text = "update: type=" ..
--         -- e.type ..
--         -- " time_ms=" .. e.time_ms .. " fingers=" .. e.fingers .. " delta=(" .. e.delta.x .. ", " .. e.delta.y .. ")", timeout = 1000, icon = 1 }) end,
--         finish = function(e)
--             hl.notification.create({
--                 text = "finish: type=" ..
--                     e.type .. " time_ms=" .. e.time_ms .. " cancelled=" .. tostring(e.cancelled),
--                 timeout = 1000,
--                 icon = 1
--             })
--         end
--     }
-- })
-- hl.gesture({
--     fingers = 2,
--     direction = "pinchin",
--     action = function()
--         hl.dispatch(hl.dsp.exec_cmd('pypr-client zoom '))
--         hl.dispatch(hl.dsp.submap("ZOOM"))
--     end,
-- })
