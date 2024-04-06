
local dialogWindow = nil
local npcOutfit = nil
local messageLabel = nil
local optionsPanel = nil

local ExtendesOpcodes = {
	Dialog = 81,
	ParseCreate = 1,
	ParseClose  = 2
}

local function hide()
	dialogWindow:hide()
end

local function show()
	dialogWindow:show()
end

local function create(data)
	local npc = g_map.getCreatureById(data.npcId)
	local defaultOptionsHeight = 22

	npcOutfit:setOutfit(npc:getOutfit())
	dialogWindow:setText(npc:getName())
	messageLabel:setText(data.message)
	
	optionsPanel:destroyChildren()

	if ( data.options:trim():len() > 0 ) then
		local options = data.options:split('&')
		for i = 1, #options do
			local button = g_ui.createWidget('Button', optionsPanel)
			button:setText(options[i])
			button.onClick = function() g_game.talkChannel(MessageModes.NpcTo, 0, options[i]) end
		end
		
		if ( #options > 5 ) then
			defaultOptionsHeight = 44
		end		
	end

	optionsPanel:setHeight(defaultOptionsHeight)
	show()
end

local callbacksDialog = {
	[ExtendesOpcodes.ParseCreate] = create,
	[ExtendesOpcodes.ParseClose]  = hide
}

local function parseDialog(protocol, opcode, buffer)
	local status, value = pcall(function() return loadstring('return ' .. buffer)() end)
	if ( not status ) then
		return 
	end
	
	local executeAction = callbacksDialog[value.action]
	
	if ( executeAction ) then
		executeAction(value.data)
	end
end

function init()
	connect(g_game, {
		onGameEnd = hide
	})
	
	ProtocolGame.registerExtendedOpcode(ExtendesOpcodes.Dialog, parseDialog)
	dialogWindow = g_ui.displayUI('dialog')
	
	npcOutfit = dialogWindow:getChildById('npcOutfit')
	messageLabel = dialogWindow:getChildById('messageLabel')
	optionsPanel = dialogWindow:getChildById('optionsPanel')
end

function terminate()
	disconnect(g_game, {
		onGameEnd = hide
	})
	
	ProtocolGame.unregisterExtendedOpcode(ExtendesOpcodes.Dialog)

	dialogWindow:destroy()
	dialogWindow = nil
end