local attributesFunctions = CreatureEvent("AttributesFunctions")

ATTRSTO_PREFIX = "ATTRSTO_"
ATTRSTO_POINTS = 53240
ATTRSTO_VITALITY = 53241
ATTRSTO_MANA = 53242
ATTRSTO_DEFENSE = 53243
ATTRSTO_STRENGTH = 53244
ATTRSTO_AGILITY = 53245
ATTRSTO_ATTACKSPEED = 53246
ATTRSTO_REFLECT = 53247
ATTRSTO_CRITICAL = 53248
ATTRSTO_CHECK = 53249

local vocationAttributes = {
    [0] = { healthBase = 200, manaBase = 100, healthMult = 2, manaMult = 4 },
    [1] = { healthBase = 200, manaBase = 100, healthMult = 2, manaMult = 4 },
    [2] = { healthBase = 200, manaBase = 100, healthMult = 2, manaMult = 4 },
    [3] = { healthBase = 200, manaBase = 100, healthMult = 4, manaMult = 2 },
    [4] = { healthBase = 200, manaBase = 100, healthMult = 5, manaMult = 1 } 
}

function attributesFunctions.onLogin(player)
    if player:getStorageValue(ATTRSTO_CHECK) == -1 then
        player:setStorageValue(ATTRSTO_POINTS, 0)
        player:setStorageValue(ATTRSTO_VITALITY, 0)
        player:setStorageValue(ATTRSTO_MANA, 0)
        player:setStorageValue(ATTRSTO_DEFENSE, 0)
        player:setStorageValue(ATTRSTO_STRENGTH, 0)
        player:setStorageValue(ATTRSTO_AGILITY, 0)
        player:setStorageValue(ATTRSTO_ATTACKSPEED, 0)
        player:setStorageValue(ATTRSTO_REFLECT, 0)
        player:setStorageValue(ATTRSTO_CRITICAL, 0)
        player:setStorageValue(ATTRSTO_CHECK, 1)
    else
        local vocId = player:getVocation():getId()
        if vocationAttributes[vocId] then
            local attributes = vocationAttributes[vocId]
            local healthBase = attributes.healthBase
            local manaBase = attributes.manaBase
            local healthMult = attributes.healthMult
            local manaMult = attributes.manaMult
            
            local calchp = healthBase + player:getLevel() * healthMult
            local calcmana = manaBase + player:getLevel() * manaMult
            
            player:setMaxHealth(calchp + player:getStorageValue(ATTRSTO_VITALITY))
            player:setMaxMana(calcmana + player:getStorageValue(ATTRSTO_MANA))
        end
    end
end

attributesFunctions:register()



local opcodeLoginEvent = CreatureEvent()
opcodeLoginEvent:type("login")

function opcodeLoginEvent.onLogin(player)
    player:registerEvent("attributesParse")
    return true
end
opcodeLoginEvent:register()

local opcodeEvent = CreatureEvent("attributesParse")
opcodeEvent:type("extendedopcode")

function opcodeEvent.onExtendedOpcode(player, opcode, buffer)
    

    local information= {
      action = "attributesWindow",
      points = player:getStorageValue(ATTRSTO_POINTS),
      vitality = player:getStorageValue(ATTRSTO_VITALITY),
      mana = player:getStorageValue(ATTRSTO_MANA),
      defense = player:getStorageValue(ATTRSTO_DEFENSE),
      strength = player:getStorageValue(ATTRSTO_STRENGTH),
      agility = player:getStorageValue(ATTRSTO_AGILITY),
      attackspeed = player:getStorageValue(ATTRSTO_ATTACKSPEED),
      reflect = player:getStorageValue(ATTRSTO_REFLECT),
      critical = player:getStorageValue(ATTRSTO_CRITICAL),
    }
    
    player:sendExtendedOpcode(203, information)
    return true
end

opcodeEvent:register()

local attrsTalk = TalkAction("#addSkill#")

function attrsTalk.onSay(player, words, param)
    if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
        return true
    end

    if player:getStorageValue(ATTRSTO_POINTS) > 0 then
        player:setStorageValue(ATTRSTO_POINTS, player:getStorageValue(ATTRSTO_POINTS) - 1)
        
        if param == "vitality" then
            player:setStorageValue(ATTRSTO_VITALITY, player:getStorageValue(ATTRSTO_VITALITY) + 1)
        elseif param == "mana" then
            player:setStorageValue(ATTRSTO_MANA, player:getStorageValue(ATTRSTO_MANA) + 1)
        elseif param == "defense" then
            player:setStorageValue(ATTRSTO_DEFENSE, player:getStorageValue(ATTRSTO_DEFENSE) + 1)
        elseif param == "strength" then
            player:setStorageValue(ATTRSTO_STRENGTH, player:getStorageValue(ATTRSTO_STRENGTH) + 1)
        elseif param == "agility" then
            player:setStorageValue(ATTRSTO_AGILITY, player:getStorageValue(ATTRSTO_AGILITY) + 1)
        elseif param == "attackspeed" then
            player:setStorageValue(ATTRSTO_ATTACKSPEED, player:getStorageValue(ATTRSTO_ATTACKSPEED) + 1)
        elseif param == "reflect" then
            player:setStorageValue(ATTRSTO_REFLECT, player:getStorageValue(ATTRSTO_REFLECT) + 1)
        elseif param == "critical" then
            player:setStorageValue(ATTRSTO_CRITICAL, player:getStorageValue(ATTRSTO_CRITICAL) + 1)
        else
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Habilidade desconhecida.")
            return false
        end
        
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você adicionou um ponto a " .. param)
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem pontos de atributo suficientes.")
    end
    
    return false
end

attrsTalk:separator(" ")
attrsTalk:register()
