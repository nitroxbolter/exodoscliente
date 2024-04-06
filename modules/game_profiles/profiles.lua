local profileWindow

function init()
    connect(g_game, { onGameEnd = onGameEnd, onItemAttributes = onItemAttributes })
    profileWindow = g_ui.displayUI('profiles.otui')
    profileWindow:hide()

    local currentProfile = g_settings.getNumber('profile')
    profileWindow.profileBox:setCurrentOption(tr("Profile %s", currentProfile))
end

function terminate()
    disconnect(g_game, { onGameEnd = onGameEnd })
    onGameEnd()
end

function onGameEnd()
    hide()
end

function show()
    profileWindow:show()
    profileWindow:raise()
    profileWindow:focus()
    addEvent(function() g_effects.fadeIn(profileWindow, 100) end)
end

function hide()
    scheduleEvent(function() profileWindow:hide() end, 100)
    addEvent(function() g_effects.fadeOut(profileWindow, 100) end)
end

function toggle()
    if profileWindow:isVisible() then
        hide()
    else
        show()
    end
    gameFocus()
end
