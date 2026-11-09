-- binds/ 共享工具与常量

-- WINDOW_POS = {}
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
mainMod     = "SUPER"
slaveMod    = "CTRL"
secMod      = "SHIFT"
thrMod      = "ALT"

terminal    = "kitty"
fileManager = "kitty yazi"
runMenu     = "fuzzel"
