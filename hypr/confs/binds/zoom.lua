-- ZOOM 子映射 (pypr zoom) + 下拉终端
require("confs.binds.scripts")

local function quitZoomMode()
    hl.dispatch(hl.dsp.exec_cmd('pypr-client zoom '))
    hl.dispatch(hl.dsp.submap("reset"))
end

-- Ctrl + Alt + Z 进入子映射; 子映射内 A 放大 / Z 缩小, Escape 或 Ctrl + Alt + Z 退出
hl.define_submap("ZOOM", function()
    hl.bind("A", function()
        hl.dispatch(hl.dsp.exec_cmd('pypr-client zoom ++0.25'))
    end
    )
    hl.bind("Z", function()
        hl.dispatch(hl.dsp.exec_cmd('pypr-client zoom --0.25'))
    end

    )

    hl.bind("Escape", function()
        quitZoomMode()
    end)
    hl.bind(generateKeyBinds({ slaveMod, thrMod, "Z" }), function()
        quitZoomMode()
    end)
end)

hl.bind(generateKeyBinds({ slaveMod, thrMod, "Z" }), function()
    hl.dispatch(hl.dsp.exec_cmd('pypr-client zoom '))
    hl.dispatch(hl.dsp.submap("ZOOM"))
end)

hl.bind(generateKeyBinds({ mainMod, "G" }), hl.dsp.exec_cmd("pypr-client toggle terminal"))
