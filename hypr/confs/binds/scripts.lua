-- binds/ 共享工具与常量
-- 注意: 以下均为全局变量, 供 binds/ 下所有文件使用; 改动此处会同步影响所有引用方

--- 把 { "SUPER", "ALT", "A" } 拼成 "SUPER + ALT + A"
---@param keyBinds string[]
---@return string
function generateKeyBinds(keyBinds)
    local res = ""
    for _, value in ipairs(keyBinds) do
        res = res .. " + " .. value
    end
    return res
end

local hy3   = hl.plugin.hy3
--
-- function doFocusMoveDispatcher(workspace, direc)
--     if workspace == nil then return hl.dispatch(hl.dsp.no_op()) end
--     -- hl.notification.create({
--     --     text = tostring(workspace.tiled_layout),
--     --     timeout = 10000,
--     -- })
--     if workspace.tiled_layout ~= "hy3" then
--         hl.dispatch(hl.dsp.focus({ direction = direc }))
--     else
--         hl.dispatch(hy3.move_focus(direc, { warp = true, once = true }))
--     end
-- end

mainMod     = "SUPER"
slaveMod    = "CTRL"
secMod      = "SHIFT"
thrMod      = "ALT"

terminal    = "kitty"
fileManager = "kitty yazi"
runMenu     = "fuzzel"
