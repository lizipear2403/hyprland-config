-- 特殊工作区切换 + 应用启动
require("confs.binds.scripts")

hl.bind(generateKeyBinds({ mainMod, "P" }), hl.dsp.workspace.toggle_special("minimized"))

-- Super + O : 当前窗口送入 minimized 工作区, 再按一次取回
hl.bind(generateKeyBinds({ mainMod, "O" }), function()
    local ws = hl.get_active_special_workspace()
    if not ws then
        hl.dispatch(hl.dsp.window.tag({
            tag = "minimized",
            window = hl.get_active_window()
        }))
        hl.dispatch(hl.dsp.window.move({
            workspace = "special:minimized",
            follow = false
        }))
    else
        hl.dispatch(hl.dsp.window.move({
            workspace = hl.get_active_workspace(),
            follow = false
        }))
        hl.dispatch(hl.dsp.window.clear_tags({ window = hl.get_active_window() }))
    end
end)
hl.bind(generateKeyBinds({ thrMod, slaveMod, "L" }), hl.dsp.exec_cmd("hyprlock"))
hl.bind(generateKeyBinds({ mainMod, "N" }), hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(generateKeyBinds({ mainMod, "V" }), hl.dsp.exec_cmd("~/.local/bin/cliphist-rofi"))
hl.bind(generateKeyBinds({ mainMod, "Q" }), hl.dsp.exec_cmd(terminal))
hl.bind(generateKeyBinds({ mainMod, "E" }), hl.dsp.exec_cmd(fileManager))
hl.bind(generateKeyBinds({ mainMod, "SPACE" }), hl.dsp.exec_cmd(runMenu))
