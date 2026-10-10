require("confs.binds.scripts")

local function isHy3Loaded()
    if hl.plugin.hy3 then
        return "hy3"
    else
        return "master"
    end
end



-- hl.exec_cmd("kitty  --class notes nvim $HOME/Notes/Notes/")
-- FLAG = FALSE ;; Draft NOT INIT
-- BIDN -> INITDRAFT
-- FALG = TRUE
-- OPEN NOTE WINDOW
-- MOVE TO SPECIAL
-- BIND -> OPEN SPECIAL
--


local function processDraftWorkspace()
    local dsws = hl.get_workspaces()
    for _, ws in ipairs(dsws) do
        if ws.name == "special:draft" then
            if ws.is_empty then
                hl.exec_cmd("kitty  --class notes nvim $HOME/Notes/Notes/")
                hl.dispatch(hl.dsp.workspace.toggle_special("draft"))
                -- FLAG = true
                return
            else
                hl.dispatch(hl.dsp.workspace.toggle_special("draft"))
            end
        end
    end
end

hl.bind(generateKeyBinds({ mainMod, "D" }), function()
    processDraftWorkspace()
end)

--
-- hl.bind("SUPER + CTRL + T", function()
--     processDraftWorkspace()
-- end)



hl.workspace_rule({
    workspace = "special:draft",
    layout = "monocle",
    persistent = true,
})
hl.workspace_rule({
    workspace = "special:minimized",
    layout = "scrolling",
    persistent = true,
})

local function setMainWorkspaces()
    local a = 1
    while a <= 9 do
        hl.workspace_rule(
            {
                workspace = tostring(a),
                layout = isHy3Loaded(),
                monitor = "eDP-1",
            }
        )
        a = a + 1
    end
    -- while a <= 15 do
    --     hl.workspace_rule({
    --         workspace = tostring(a),
    --         layout = isHy3Loaded(),
    --         monitor = "HDMI-A-1",
    --     })
    --     a = a + 1
    -- end
end

local function setSlaveMonitorWorksapces()
    local a = 11
    while a <= 15 do
        hl.workspace_rule({
            workspace = tostring(a),
            layout = isHy3Loaded(),
            monitor = "HDMI-A-1",
        })
        a = a + 1
    end
end
setMainWorkspaces()
setSlaveMonitorWorksapces()
