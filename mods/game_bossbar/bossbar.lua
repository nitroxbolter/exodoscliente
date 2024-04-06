local OPCODE = 53
local window, creatureBarHP, creatureHP, creatureName, creatureOutfit, creatureSpecial = nil
local focusedBoss = 0
local focusedMob = 0
local bossBarEnabled = true

-- Lista de nomes de criaturas que ativam a barra de boss
local bossCreatureNames = {"Ferumbras", "Orshabaal", "Morgaroth", "Demodras"}

function init()
    connect(g_game, {
        onGameStart = create,
        onGameEnd = destroy,
        onAttackingCreatureChange = onAttackingCreatureChange
    })
    connect(Creature, {
        onHealthPercentChange = onHealthPercentChange,
        onSpecialPercentChange = onSpecialPercentChange
    })

    if g_game.isOnline() then
        create()
    end

    -- Verifica constantemente as criaturas visíveis
    scheduleEvent(checkVisibleCreatures, 500)  -- ajuste o intervalo conforme necessário
end

function terminate()
    disconnect(g_game, {
        onGameStart = create,
        onGameEnd = destroy,
        onAttackingCreatureChange = onAttackingCreatureChange
    })
    disconnect(Creature, {
        onHealthPercentChange = onHealthPercentChange,
        onSpecialPercentChange = onSpecialPercentChange
    })
    destroy()
end

function create()
    if window then
        return
    end

    window = g_ui.loadUI("bossbar", modules.game_interface.getMapPanel())
    window:hide()

    creatureBarHP = window:recursiveGetChildById("creatureBarHP")
    creatureName = window:recursiveGetChildById("creatureName")
    creatureHP = window:recursiveGetChildById("creatureHP")
    creatureOutfit = window:recursiveGetChildById('outfitBox')
    creatureSpecial = window:recursiveGetChildById("special")
end

function destroy()
    if window then
        window:destroy()
        window = nil
        creatureBarHP = nil
        creatureHP = nil
        creatureOutfit = nil
        creatureName = nil
        creatureSpecial = nil
        focusedBoss = 0
        focusedMob = 0
    end
end

function onAttackingCreatureChange(creature, oldCreature)
    if bossBarEnabled then
        if focusedBoss ~= 0 then
            return
        end

        if creature and isInBossList(creature:getName()) then
            creatureName:setText(creature:getName())
            creatureHP:setText(creature:getHealthPercent() .. "%")
            creatureSpecial:setPercent(creature:getHealthPercent())
            creatureOutfit:setOutfit(creature:getOutfit())
            focusedMob = creature:getId()

            window:show()
        elseif not creature then
            -- Se a criatura for nula, esconde a Boss Bar
            hide()
        end
    else
        hide()
    end
end

function checkVisibleCreatures()
    local creatures = g_map.getSpectatorsInRange(g_game.getLocalPlayer():getPosition(), false)
    for _, creature in ipairs(creatures) do
        if creature:isLocalPlayer() then
            -- Ignorar o próprio jogador
        elseif isInBossList(creature:getName()) then
            onCreatureAppear(creature)
            return
        end
    end

    -- Esconder a Boss Bar se nenhuma criatura estiver presente
    hide()
end

function onCreatureAppear(creature)
    if bossBarEnabled and isInBossList(creature:getName()) then
        creatureName:setText(creature:getName())
        creatureHP:setText(creature:getHealthPercent() .. "%")
        creatureSpecial:setPercent(creature:getHealthPercent())
        creatureOutfit:setOutfit(creature:getOutfit())
        focusedMob = creature:getId()

        window:show()
    end
end

function hide()
    focusedBoss = 0
    focusedMob = 0
    window:hide()
end

function onHealthPercentChange(creature, health)
    if bossBarEnabled then
        if focusedBoss == creature:getId() or focusedMob == creature:getId() then
            creatureHP:setText(health .. "%")
            creatureSpecial:setPercent(health)
        end
    else
        hide()
    end
end

function onSpecialPercentChange(creature, special)
    if special > 0 then
        if not creatureSpecial:isVisible() then
            creatureSpecial:setVisible(true)
        end

        creatureSpecial:setPercent(special)
    else
        creatureSpecial:setVisible(false)
    end
end

function isInBossList(name)
    for _, bossName in ipairs(bossCreatureNames) do
        if name:lower() == bossName:lower() then
            return true
        end
    end
    return false
end

init()
