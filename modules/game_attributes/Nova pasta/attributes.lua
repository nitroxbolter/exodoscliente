attributesButton = nil
attributesWindow = nil


function init()
  ProtocolGame.registerExtendedOpcode(155, onReceivePoint)
  attributesButton = modules.client_topmenu.addRightGameToggleButton('attributesButton', tr('Attributes'), '/images/topbuttons/attributes', closing)
  attributesButton:setOn(false)

  attributesWindow = g_ui.displayUI('attributes')

    connect(LocalPlayer, {
    onExperienceChange = onExperienceChange,
    onLevelChange = onLevelChange,
    onStaminaChange = onStaminaChange,
    onOfflineTrainingChange = onOfflineTrainingChange,
    onSpeedChange = onSpeedChange,
    onBaseSpeedChange = onBaseSpeedChange,
    onMagicLevelChange = onMagicLevelChange,
    onBaseMagicLevelChange = onBaseMagicLevelChange,
    onSkillChange = onSkillChange,
    onBaseSkillChange = onBaseSkillChange,
    onReceivePoint = onReceivePoint,
    turnButtons = turnButtons,
    addAtribute = addAtribute
  })

connect(g_game, {
    onGameStart = refresh,
    onGameEnd = offline
  })


  attributesWindow:setVisible(false)

  allTabs = attributesWindow:recursiveGetChildById('allTabs')
  allTabs:setContentWidget(attributesWindow:getChildById('optionsTabContent'))

  if not g_game.isOnline() then
    attributesWindow:hide()
  end
  refresh()
end

function update()
  local player = g_game.getLocalPlayer()
 -- ProtocolGame.registerExtendedOpcode(155, onReceivePoint) 
end

function refresh() 
  local player = g_game.getLocalPlayer()
  if not player then return end
  update()
end



function onReceivePoint(protocol, opcode, buffer)
    if buffer == nil or buffer == '' then
        print("Buffer recebido está vazio.")
        return
    end
    
    local chunk, loadError = load("return " .. buffer)
    if not chunk then
        print("Erro ao carregar o buffer como tabela Lua: ", loadError)
        return
    end

    local success, information = pcall(chunk)
    if not success or type(information) ~= "table" then
        print("Erro ao executar o chunk ou o buffer não é uma tabela válida: ", information)
        return
    end
return true
end 


function addvitality()
  g_game.talk('#addSkill# vitality')
end

function addmana()
  g_game.talk('#addSkill# mana')
end

function adddefense()
  g_game.talk('#addSkill# defense')
end

function addstrength()
  g_game.talk('#addSkill# strength')
end

function addagility()
  g_game.talk('#addSkill# agility')
end

function addattackspeed()
  g_game.talk('#addSkill# attackspeed')
end

function addreflect()
  g_game.talk('#addSkill# reflect')
end

function addcritical()
  g_game.talk('#addSkill# critical')
end



function terminate()
 disconnect(g_game, { onGameStart = online,
    onGameStart = refresh,
    onGameEnd = refresh,
    onExperienceChange = onExperienceChange,
    onLevelChange = onLevelChange,
    onStaminaChange = onStaminaChange,
    onOfflineTrainingChange = onOfflineTrainingChange,
    onSpeedChange = onSpeedChange,
    onBaseSpeedChange = onBaseSpeedChange,
    onMagicLevelChange = onMagicLevelChange,
    onBaseMagicLevelChange = onBaseMagicLevelChange,
    onSkillChange = onSkillChange,
    onBaseSkillChange = onBaseSkillChange,

                       onGameEnd = offline,
             onGameEnd = destroyWindows})
 
  attributesButton:destroy()
  attributesWindow:destroy()
end

function closing()
  if attributesButton:isOn() then
    attributesWindow:setVisible(false)
    attributesButton:setOn(false)
  else
    attributesWindow:setVisible(true)
    attributesButton:setOn(true)
  end
end
function onMiniWindowClose()
  attributesButton:setOn(false)

end