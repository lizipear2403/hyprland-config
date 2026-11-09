require("confs.binds.scripts")
window_count = 0

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

local function notify(txt)
    hl.notification.create({
        text = txt,
        timeout = 5000,
        icon = 1
    })
end



local function draftWindow(cmd, title_keywords)
    local windows = hl.get_workspace_windows("special:draft")
    local EXITIS = false
    for _, win in pairs(windows) do
        if string.find(win.title, title_keywords) then
            EXITIS = true
            -- if WINDOW_POS[title_keywords] == false then
            --     notify(title_keywords)
            --     hl.dispatch(hl.dsp.window.move({
            --         window = win,
            --         x = 100,
            --         y = 100,
            --         relative = true
            --     }))
            --     WINDOW_POS[title_keywords] = true
            -- end
            local ws = hl.get_workspace("special:draft")
            if ws.active then
                hl.dispatch(hl.dsp.workspace.toggle_special("draft"))
            else
                hl.dispatch(hl.dsp.focus({ window = win }))
            end
            break
        end
    end
    if not EXITIS then
        hl.dispatch(hl.dsp.focus({ workspace = "special:draft" }))
        hl.exec_cmd(cmd)
        -- WINDOW_POS[title_keywords] = false
        -- table.insert(WINDOW_POS, )
        -- table.insert(window_pos[title_keywords] , )
    end
end

hl.bind(generateKeyBinds({ mainMod, "D" }), function()
    draftWindow("kitty  --class notes nvim $HOME/Notes/Notes/", "nvim")
end)

hl.bind(generateKeyBinds({ mainMod, "B" }), function()
    draftWindow("vivaldi", "Vivaldi")
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
