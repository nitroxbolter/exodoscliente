AtributosWindow = nil
name = nil
attrButton = nil
topright = nil
bottomright = nil

function init()  
canAddAtt = 1
 ProtocolGame.registerExtendedOpcode(203, onReceivePoint)

  AtributosWindow = g_ui.displayUI('attrs.otui')
		  connect(LocalPlayer, {
		onReceivePoint = onReceivePoint,
		turnButtons = turnButtons,
		addAtribute = addAtribute


  })
connect(g_game, {
    onGameStart = refresh,
    onGameEnd = offline
  })
					
  attrButton = modules.client_topmenu.addRightGameToggleButton('attrButton', 'Talent Tree', '/images/topbuttons/attributes', toggle)
  attrButton:setOn(false)


  if not g_game.isOnline() then
    AtributosWindow:hide()
  end
    g_keyboard.bindKeyDown("Ctrl+E", toggle)

  refresh()
  attrToggle()
  AtributosWindow:setup()
  AtributosWindow:disableResize()
end

function update()
  local player = g_game.getLocalPlayer()
 ProtocolGame.registerExtendedOpcode(203, onReceivePoint)
 local offlineTraining = AtributosWindow:recursiveGetChildById('offlineTraining')
  if not g_game.getFeature(GameOfflineTrainingTime) then
    offlineTraining:hide()
  else
    offlineTraining:show()
  end
end

function refresh()	


  local player = g_game.getLocalPlayer()
  if not player then return end
 ProtocolGame.registerExtendedOpcode(203, onReceivePoint)

  update()
end

function onReceivePoint(protocol, opcode, buffer)
local information = loadstring("return "..buffer)()


if information.action == "attrsWindow" then
     name = information.name
     looktype = information.looktype
     points = information.points
     aggression = information.ATTRSTO_VITALITY
     deflect = information.ATTRSTO_MANA
     inflict = information.ATTRSTO_DEFENSE
     embrace = information.ATTRSTO_STRENGTH
     swiftfoot = information.ATTRSTO_AGILITY
     mitigation = information.ATTRSTO_ATTACKSPEED
     engrace = information.ATTRSTO_REFLECT
     chemistry = information.ATTRSTO_CRITICAL
     speed = information.speed
     rank = information.rank
     bspeed = information.bspeed




    local widgetrank = AtributosWindow:getChildById('topleft'):getChildById("rankPoint")

    widgetrank:setText(rank)




		    AtributosWindow:getChildById('topright'):getChildById("deathV"):setText(""..engrace.."%")
		    AtributosWindow:getChildById('topright'):getChildById("dmgV"):setText("+"..(string.format("%.02f", aggression/100.0)*33).."%")
		    AtributosWindow:getChildById('topright'):getChildById("defV"):setText("+"..(string.format("%.02f", deflect/100.0)*33).."%")
		    AtributosWindow:getChildById('topright'):getChildById("reflectionV"):setText("+"..(string.format("%.02f", inflict/100.0)*33).."%")
		    AtributosWindow:getChildById('topright'):getChildById("mitigationV"):setText("+"..(string.format("%.02f", mitigation/100.0)*33).."%")
		    AtributosWindow:getChildById('topright'):getChildById("chemistryv"):setText("+"..(string.format("%.02f", chemistry/100.0)*33).."%")
		    AtributosWindow:getChildById('topright'):getChildById("regenerationV"):setText("+"..(string.format("%.02f", embrace/100.0)*33).."%")
				AtributosWindow:getChildById('topleft'):getChildById("charName"):setText(g_game.getCharacterName())
			  local player = g_game.getLocalPlayer()
			  if player then
						--AtributosWindow:getChildById('topleft'):getChildById("creature"):setCreature(player)

    local localPlayer = g_game.getLocalPlayer()
			  end
		    AtributosWindow:getChildById('bottomright'):getChildById("strAtributo"):setText(points)
		    AtributosWindow:getChildById('bottomright'):getChildById("attr1base"):setText(aggression)
		    AtributosWindow:getChildById('bottomright'):getChildById("attr2base"):setText(deflect)
		    AtributosWindow:getChildById('bottomright'):getChildById("attr3base"):setText(inflict)
		    AtributosWindow:getChildById('bottomright'):getChildById("attr4base"):setText(embrace)
		    AtributosWindow:getChildById('bottomright'):getChildById("attr5base"):setText(swiftfoot)
		    AtributosWindow:getChildById('bottomright'):getChildById("attr6base"):setText(mitigation)
		    AtributosWindow:getChildById('bottomright'):getChildById("attr7base"):setText(engrace)
		    AtributosWindow:getChildById('bottomright'):getChildById("attr8base"):setText(chemistry)

    	if aggression < 25 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr1base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr1"):setImageColor("#CFBC92")
    	elseif aggression > 25 and aggression < 49 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr1base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr1"):setImageColor("#CFBC92")
    	elseif aggression == 50 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr1base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr1"):setImageColor("#CFBC92")
	    end    
		    
    	if deflect < 25 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr2base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr2"):setImageColor("#CFBC92")
    	elseif deflect > 25 and deflect < 49 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr2base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr2"):setImageColor("#CFBC92")
    	elseif deflect == 50 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr2base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr2"):setImageColor("#CFBC92")
	    end
		    
    	if inflict < 25 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr3base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr3"):setImageColor("#CFBC92")
    	elseif inflict > 25 and inflict < 49 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr3base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr3"):setImageColor("#CFBC92")
    	elseif inflict >= 50 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr3base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr3"):setImageColor("#CFBC92")
	    end		    
		    
    	if embrace < 25 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr4base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr4"):setImageColor("#CFBC92")
    	elseif embrace > 25 and embrace < 49 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr4base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr4"):setImageColor("#CFBC92")
    	elseif embrace == 50 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr4base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr4"):setImageColor("#CFBC92")
	    end
		    
    	if swiftfoot < 25 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr5base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr5"):setImageColor("#CFBC92")
    	elseif swiftfoot > 25 and swiftfoot < 49 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr5base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr5"):setImageColor("#CFBC92")
    	elseif swiftfoot == 50 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr5base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr5"):setImageColor("#CFBC92")
	    end
		    
    	if mitigation < 25 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr6base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr6"):setImageColor("#CFBC92")
    	elseif mitigation > 25 and mitigation < 49 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr6base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr6"):setImageColor("#CFBC92")
    	elseif mitigation == 50 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr6base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr6"):setImageColor("#CFBC92")
	    end

    	if engrace < 3 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr7base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr7"):setImageColor("#CFBC92")
    	elseif engrace > 3 and engrace < 5 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr7base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr7"):setImageColor("#CFBC92")
    	elseif engrace == 5 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr7base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr7"):setImageColor("#CFBC92")
	    end
		    
    	if chemistry < 7 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr8base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr8"):setImageColor("#CFBC92")
    	elseif chemistry >= 8 and chemistry < 14 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr8base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr8"):setImageColor("#CFBC92")
    	elseif chemistry == 15 then
		    AtributosWindow:getChildById('bottomright'):getChildById("attr8base"):setColor("#CFBC92")
		    AtributosWindow:getChildById('bottomright'):getChildById("attr8"):setImageColor("#CFBC92")
	    end

    if points > 0 then
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr1increase"):setVisible(true)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr2increase"):setVisible(true)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr3increase"):setVisible(true)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr4increase"):setVisible(true)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr5increase"):setVisible(true)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr6increase"):setVisible(true)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr7increase"):setVisible(true)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr8increase"):setVisible(true)
    else
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr1increase"):setVisible(falses)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr2increase"):setVisible(false)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr3increase"):setVisible(false)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr4increase"):setVisible(false)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr5increase"):setVisible(false)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr6increase"):setVisible(false)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr7increase"):setVisible(false)
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr8increase"):setVisible(false)
    end

    	if aggression >= 50 then
    		AtributosWindow:getChildById('bottomright'):getChildById("attr1increase"):setVisible(false)
    	end
    	if deflect >= 50 then
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr2increase"):setVisible(false)
	    end
    	if inflict >= 50 then
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr3increase"):setVisible(false)
	    end
    	if embrace >= 50 then
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr4increase"):setVisible(false)
	    end
    	if swiftfoot >= 50 then
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr5increase"):setVisible(false)
	    end
    	if mitigation >= 50 then
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr6increase"):setVisible(false)
	    end
    	if engrace >= 5 then
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr7increase"):setVisible(false)
	    end
    	if chemistry >= 15 then
	    	AtributosWindow:getChildById('bottomright'):getChildById("attr8increase"):setVisible(false)
	    end

  refresh()
  update()
end
return true
end 

function addAggression()
	g_game.talk('#addSkill# vitality')
  g_game.getProtocolGame():sendExtendedOpcode(203, onReceivePoint)
end

function addInflict()
	g_game.talk('#addSkill# defense')
  g_game.getProtocolGame():sendExtendedOpcode(203, onReceivePoint)
end

function addSwiftFoot()
	g_game.talk('#addSkill# agility')
  g_game.getProtocolGame():sendExtendedOpcode(203, onReceivePoint)
end

function addEngrace()
	g_game.talk('#addSkill# reflect')
  g_game.getProtocolGame():sendExtendedOpcode(203, onReceivePoint)
end

function addDeflect()
	g_game.talk('#addSkill# mana')
  g_game.getProtocolGame():sendExtendedOpcode(203, onReceivePoint)
end

function addEmbrace()
	g_game.talk('#addSkill# strength')
  g_game.getProtocolGame():sendExtendedOpcode(203, onReceivePoint)
end

function addMitigation()
	g_game.talk('#addSkill# attackspeed')
  g_game.getProtocolGame():sendExtendedOpcode(203, onReceivePoint)
end

function addChemistry()
	g_game.talk('#addSkill# critical')
  g_game.getProtocolGame():sendExtendedOpcode(203, onReceivePoint)
end

function destroyWindows()
AtributosWindow:hide()
  attrButton = nil
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
 
  AtributosWindow:destroy()
    AtributosWindow:destroy()
  attrButton:destroy()
  attrButton = nil

end

function toggle()
  if AtributosWindow:isVisible() then
    hide()
  else
    show()
  end
end


function show()
  AtributosWindow:show()
  AtributosWindow:raise()
  AtributosWindow:focus()
  attrButton:setOn(true)
end

function hide()
  AtributosWindow:hide()
  attrButton:setOn(false)
end

function attrToggle()
  AtributosWindow:getChildById('topleft'):setVisible(false)
  AtributosWindow:getChildById('topright'):setVisible(false)
  AtributosWindow:getChildById('bottomright'):setVisible(true)
end

function online()
  local player = g_game.getLocalPlayer()
  if player then
    local char = g_game.getCharacterName()
		print(char)
  end
end

function offline()
  AtributosWindow:hide()
  local player = g_game.getLocalPlayer()
end
