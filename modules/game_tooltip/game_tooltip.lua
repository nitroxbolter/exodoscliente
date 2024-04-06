m_TooltipList = {}
m_TooltipFunction = {}

m_TooltipFunction.GameServerSendTooltip = 159
m_TooltipFunction.GameServerParseTooltip = 158

m_TooltipFunction.TOOLTIP_ATTRIBUTE_NONE = 0
m_TooltipFunction.TOOLTIP_ATTRIBUTE_ATTACK = 1
m_TooltipFunction.TOOLTIP_ATTRIBUTE_DEFENSE = 2
m_TooltipFunction.TOOLTIP_ATTRIBUTE_NAME = 3
m_TooltipFunction.TOOLTIP_ATTRIBUTE_WEIGHT = 4
m_TooltipFunction.TOOLTIP_ATTRIBUTE_ARMOR = 5
m_TooltipFunction.TOOLTIP_ATTRIBUTE_HITCHANCE = 6
m_TooltipFunction.TOOLTIP_ATTRIBUTE_SHOOTRANGE = 7
m_TooltipFunction.TOOLTIP_ATTRIBUTE_DURATION = 8
m_TooltipFunction.TOOLTIP_ATTRIBUTE_CHARGES = 9
m_TooltipFunction.TOOLTIP_ATTRIBUTE_FLUIDTYPE = 10
m_TooltipFunction.TOOLTIP_ATTRIBUTE_ATTACK_SPEED = 11
m_TooltipFunction.TOOLTIP_ATTRIBUTE_RESISTANCES = 12
m_TooltipFunction.TOOLTIP_ATTRIBUTE_STATS = 13
m_TooltipFunction.TOOLTIP_ATTRIBUTE_SKILL = 14
m_TooltipFunction.TOOLTIP_ATTRIBUTE_KEY = 15
m_TooltipFunction.TOOLTIP_ATTRIBUTE_TEXT = 16
m_TooltipFunction.TOOLTIP_ATTRIBUTE_WIELDINFO = 17
m_TooltipFunction.TOOLTIP_ATTRIBUTE_COUNT = 18
m_TooltipFunction.TOOLTIP_ATTRIBUTE_RUNE_LEVEL = 19
m_TooltipFunction.TOOLTIP_ATTRIBUTE_RUNE_MAGIC_LEVEL = 20
m_TooltipFunction.TOOLTIP_ATTRIBUTE_RUNE_NAME = 21
m_TooltipFunction.TOOLTIP_ATTRIBUTE_CONTAINER_SIZE = 22
m_TooltipFunction.TOOLTIP_ATTRIBUTE_SPEED = 23
m_TooltipFunction.TOOLTIP_ATTRIBUTE_RARITY = 24
m_TooltipFunction.TOOLTIP_ATTRIBUTE_INCREMENTS = 25
m_TooltipFunction.TOOLTIP_ATTRIBUTE_CRITICALHIT_CHANCE = 26
m_TooltipFunction.TOOLTIP_ATTRIBUTE_CRITICALHIT_AMOUNT = 27
m_TooltipFunction.TOOLTIP_ATTRIBUTE_MANA_LEECH_CHANCE = 28
m_TooltipFunction.TOOLTIP_ATTRIBUTE_MANA_LEECH_AMOUNT = 29
m_TooltipFunction.TOOLTIP_ATTRIBUTE_LIFE_LEECH_CHANCE = 30
m_TooltipFunction.TOOLTIP_ATTRIBUTE_LIFE_LEECH_AMOUNT = 31
m_TooltipFunction.TOOLTIP_ATTRIBUTE_INCREMENT_COINS = 32
m_TooltipFunction.TOOLTIP_ATTRIBUTE_EXPERIENCE = 33

m_TooltipFunction.descriptionByAttributeId = {
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_ATTACK] = {name = "Attack: %s", icon = 4},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_DEFENSE] = {name = "Defense: %s", icon = 6},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_WEIGHT] = {name = "%s", icon = 8},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_ARMOR] = {name = "Armor: %s", icon = 5},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_HITCHANCE] = {name = "Hit Chance: %s", icon = 47, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_SHOOTRANGE] = {name = "Range: %s", icon = 9},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_DURATION] = {name = "%s", icon = 38},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_CHARGES] = {name = "Charges: %s", icon = 10},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_FLUIDTYPE] = {name = "%s", icon = 27},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_ATTACK_SPEED] = {name = "Attack Speed: %s", icon = 20},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_KEY] = {name = "Key: %s", icon = 28},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_TEXT] = {name = "%s", icon = 17},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_WIELDINFO] = {name = "%s", icon = 17},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_RUNE_LEVEL] = {name = "Rune Level: %s", icon = 59},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_RUNE_MAGIC_LEVEL] = {name = "Rune Magic Level: %s", icon = 59},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_RUNE_NAME] = {name = "Rune Spell Name: %s", icon = 58},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_CONTAINER_SIZE] = {name = "Vol: %s", icon = 15},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_SPEED] = {name = "Speed: %s", icon = 51, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_CRITICALHIT_CHANCE] = {name = "Critical Hit Chance: %s%%", icon = 12, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_CRITICALHIT_AMOUNT] = {name = "Critical Hit Multiplier: %s%%", icon = 12, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_MANA_LEECH_CHANCE] = {name = "Mana Leech Chance: %s%%", icon = 45, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_MANA_LEECH_AMOUNT] = {name = "Mana Leech Multiplier: %s%%", icon = 45, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_LIFE_LEECH_CHANCE] = {name = "Life Leech Chance: %s%%", icon = 13, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_LIFE_LEECH_AMOUNT] = {name = "Life Leech Multiplier: %s%%", icon = 13, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_INCREMENT_COINS] = {name = "%s%% Extra Gold From Monsters", icon = 15, symbol = true},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_EXPERIENCE] = {name = "%s%% Extra Experience", icon = 49, symbol = true},

	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_RARITY] = {
		[1] = {name = "Rare", icon = 25, color = "#0088FF"}, -- Rare
		[2] = {name = "Epic", icon = 26, color = "#870DFF"}, -- Epic
		[3] = {name = "Mythic", icon = 16, color = "#F0E229"}, -- Mythic
		[4] = {name = "Legendary", icon = 58, color = "#F5891D"}, -- Legendary
		[5] = {name = "Exotic", icon = 52, color = "#FA5025"}, -- Exotic
	},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_RESISTANCES] = {
		[0] = {name = "Physical Absorb: %s%%", icon = 30}, -- COMBAT_PHYSICALDAMAGE
		[1] = {name = "Energy Absorb: %s%%", icon = 31}, -- COMBAT_ENERGYDAMAGE
		[2] = {name = "Earth Absorb: %s%%", icon = 34}, -- COMBAT_EARTHDAMAGE
		[3] = {name = "Fire Absorb: %s%%", icon = 32}, -- COMBAT_FIREDAMAGE
		[5] = {name = "Lifedrain Absorb: %s%%", icon = 37}, -- COMBAT_LIFEDRAIN
		[6] = {name = "Manadrain Absorb: %s%%", icon = 40} -- COMBAT_MANADRAIN
	},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_INCREMENTS] = {
		[0] = {name = "Increase Physical Damage: %s%%", icon = 30}, -- COMBAT_PHYSICALDAMAGE
		[1] = {name = "Increase Energy Damage: %s%%", icon = 31}, -- COMBAT_ENERGYDAMAGE
		[2] = {name = "Increase Earth Damage: %s%%", icon = 34}, -- COMBAT_EARTHDAMAGE
		[3] = {name = "Increase Fire Damage: %s%%", icon = 32}, -- COMBAT_FIREDAMAGE
		[5] = {name = "Increase Lifedrain Damage: %s%%", icon = 37}, -- COMBAT_LIFEDRAIN
		[6] = {name = "Increase Manadrain Damage: %s%%", icon = 40}, -- COMBAT_MANADRAIN
		[7] = {name = "Increase Healing: %s%%", icon = 27} -- COMBAT_HEALING
	},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_STATS] = {
		[0] = {name = "Maximum Health: %s", icon = 39}, -- STAT_MAXHITPOINTS
		[1] = {name = "Maximum Mana: %s", icon = 40}, -- STAT_MAXMANAPOINTS
		[3] = {name = "Magic Level: %s", icon = 62} -- STAT_MAGICPOINTS
	},
	[m_TooltipFunction.TOOLTIP_ATTRIBUTE_SKILL] = {
		[0] = {name = "Fist Fighting: %s", icon = 60}, -- SKILL_FIST
		[1] = {name = "Club Fighting: %s", icon = 30}, -- SKILL_CLUB
		[2] = {name = "Sword Fighting: %s", icon = 18}, -- SKILL_SWORD
		[3] = {name = "Axe Fighting: %s", icon = 19}, -- SKILL_AXE
		[4] = {name = "Distance Fighting: %s", icon = 22}, -- SKILL_DISTANCE
		[5] = {name = "Shielding: %s", icon = 25}, -- SKILL_SHIELD
		[6] = {name = "Fishing: %s", icon = 23}, -- SKILL_FISHING
		[7] = {name = "Mining: %s", icon = 29, color = "#997979"}, -- SKILL_MINING
		[8] = {name = "Woodcutting: %s", icon = 30, color = "#b04900"}, -- SKILL_WOODCUTTING
		[9] = {name = "Crafting: %s", icon = 54, color = "#8c0325"}, -- SKILL_CRAFTING
		[10] = {name = "Herbalist: %s", icon = 28, color = "#00b04f"}, -- SKILL_HERBALIST
	}
}

m_TooltipFunction.config = {
	maxIconsInLine = 8,
	iconSize = 19,
}

function onLoad()
	connect(g_game, {
		onGameStart = onGameStart,
		onGameEnd = onGameEnd
	})
end

function onUnLoad()
	disconnect(g_game, {
		onGameStart = onGameStart,
		onGameEnd = onGameEnd
	})

	m_TooltipFunction.destroy()
end

function onGameStart()
	m_TooltipFunction.registerProtocol()
	m_TooltipFunction.destroy()
end

function onGameEnd()
	m_TooltipFunction.unregisterProtocol()
	m_TooltipFunction.destroy()
end

m_TooltipFunction.registerProtocol = function()
	m_TooltipFunction.protocol = g_game.getProtocolGame()
	ProtocolGame.registerOpcode(m_TooltipFunction.GameServerParseTooltip, m_TooltipFunction.parseTooltip)
end

m_TooltipFunction.unregisterProtocol = function()
	m_TooltipFunction.protocol = nil
	ProtocolGame.unregisterOpcode(m_TooltipFunction.GameServerParseTooltip, m_TooltipFunction.parseTooltip)
end

m_TooltipFunction.parseTooltip = function(protocol, msg)
	local size = msg:getU8()
	local list = {}
	for i = 1, size do
		local attributeId = msg:getU8()
		local attributeValue
		local attributeType
		if msg:getU8() == 1 then
			-- The value is an integer
			if msg:getU8() == 1 then
				-- The value is a negative
				attributeValue = -msg:getU32()
			else
				-- The value is a positive
				attributeValue = msg:getU32()
			end
			attributeType = msg:getU32()
		else
			-- The value is a string
			attributeValue = msg:getString()
		end

		table.insert(list, {id = attributeId, value = attributeValue, type = attributeType})
	end

	m_TooltipFunction.open(list)
end

m_TooltipFunction.cancelEvent = function()
	m_TooltipList.itemId = false
	m_TooltipList.position = false
	
	if m_TooltipFunction.event then
		m_TooltipFunction.event:cancel()
		m_TooltipFunction.event = nil
	end
end

m_TooltipFunction.create = function(position, item, virtual)
	m_TooltipFunction.cancelEvent()
	m_TooltipList.itemId = item:getId()
	m_TooltipList.position = position
	
	if virtual then
		m_TooltipFunction.event = scheduleEvent(function()
			local msg = OutputMessage.create()
			msg:addU8(m_TooltipFunction.GameServerSendTooltip)
			msg:addU8(0)
			msg:addU16(item:getId())
			msg:addU16(item:getCount())
			m_TooltipFunction.protocol:send(msg)
		end, 200)
	else
		m_TooltipFunction.event = scheduleEvent(function()
			local msg = OutputMessage.create()
			msg:addU8(m_TooltipFunction.GameServerSendTooltip)
			msg:addU8(1)
			m_TooltipFunction.protocol:addPosition(msg, item:getPosition())
			msg:addU16(item:getId())
			msg:addU8(item:getStackPos())
			m_TooltipFunction.protocol:send(msg)
		end, 200)
	end
end

m_TooltipFunction.destroyByItem = function(itemId)
	if itemId and m_TooltipList.itemId == itemId then
		m_TooltipFunction.destroy()
	end
end

m_TooltipFunction.destroy = function()
	m_TooltipFunction.cancelEvent()
	
	if m_TooltipList.window then
		m_TooltipList.list:destroyChildren()
		m_TooltipList.window:destroy()
		m_TooltipList = {}
	end
end

m_TooltipFunction.addLabel = function(name, height, width, description, icon, color, update)
	local widget = g_ui.createWidget(name)
	widget:setId(description)
	if update then
		widget:setParent(m_TooltipFunction.list)
	end

	if description then
		widget:setText(description)
		width = math.max(widget:getWidth() + 16, width)
	end
	
	if color then
		widget:setColor(color)
	end
	
	if icon then
		m_TooltipFunction.setIconImageType(widget:getChildById("icon"), icon)
	end

	if not update then
		widget:setParent(m_TooltipList.list)
	end
	
	return height + widget:getHeight() + 4, width, widget
end

m_TooltipFunction.getImageClip = function(id)
	if not id then
		return "0 0 " .. m_TooltipFunction.config.iconSize .. " " .. m_TooltipFunction.config.iconSize
	end
	
	return (((id - 1) % m_TooltipFunction.config.maxIconsInLine) * m_TooltipFunction.config.iconSize) .. " " .. ((math.ceil(id / m_TooltipFunction.config.maxIconsInLine) - 1)*m_TooltipFunction.config.iconSize) .. " " .. m_TooltipFunction.config.iconSize .. " " .. m_TooltipFunction.config.iconSize
end

m_TooltipFunction.setIconImageType = function(widget, id)
	if not id then
		return false
	end
	
	widget:setImageClip(m_TooltipFunction.getImageClip(id))
end

m_TooltipFunction.getAttribute = function(list, id)
	for _, attributeValues in pairs(list) do
		if attributeValues.id == id then
			return attributeValues.value
		end
	end

	return ""
end

m_TooltipFunction.titleCase = function(str)
    local words = {}
    for word in str:gmatch("%S+") do
        table.insert(words, word)
    end

    for i, word in ipairs(words) do
        local firstLetter = word:sub(1, 1):upper()
        local restOfWord = word:sub(2)
        words[i] = firstLetter .. restOfWord
    end

    local result = table.concat(words, " ")
    return result
end

m_TooltipFunction.open = function(list)
	if not m_TooltipList.position then
		return true
	end
	
	if not m_TooltipList.window then
		m_TooltipList.window = g_ui.displayUI("game_tooltip")
		m_TooltipList.list = m_TooltipList.window:getChildById("list")
	else
		m_TooltipList.list:destroyChildren()
	end
	
	m_TooltipList.window:show()
	m_TooltipList.window:getChildById("item"):setItemId(m_TooltipList.itemId)

	local height = 48
	local width = 40
	local color = nil
	local name = m_TooltipFunction.titleCase(m_TooltipFunction.getAttribute(list, m_TooltipFunction.TOOLTIP_ATTRIBUTE_NAME))
	for _, attributeValues in pairs(list) do
		if attributeValues.id == m_TooltipFunction.TOOLTIP_ATTRIBUTE_RARITY then
			local v = m_TooltipFunction.descriptionByAttributeId[attributeValues.id][attributeValues.value]
			name = v.name:format(attributeValues.value) .. " " .. name
			color = v.color
			break
		end
	end

	height, width, nameWidget = m_TooltipFunction.addLabel("LookItemName", height, width, name, nil, color)
	height = m_TooltipFunction.addLabel("TooltipSeparator", height, width)

	local lastAttributeId
	for _, attributeValues in pairs(list) do
		local v = m_TooltipFunction.descriptionByAttributeId[attributeValues.id]
		if v then
			if lastAttributeId == m_TooltipFunction.TOOLTIP_ATTRIBUTE_WEIGHT or lastAttributeId == m_TooltipFunction.TOOLTIP_ATTRIBUTE_RARITY then
				height = m_TooltipFunction.addLabel("TooltipSeparator", height, width)
				
				if attributeValues.id == m_TooltipFunction.TOOLTIP_ATTRIBUTE_RARITY then
					height, width = m_TooltipFunction.addLabel("LookItemName", height, width, "Rarity")
				else
					height, width = m_TooltipFunction.addLabel("LookItemName", height, width, "Attributes")
				end
			end
			
			if not v.name then
				-- Resistances/skills
				v = v[attributeValues.type] or v[attributeValues.value]
				if v then
					if tonumber(attributeValues.value) and attributeValues.value > 0 then
						attributeValues.value = "+" .. attributeValues.value
					end
					
					local description = v.name:format(attributeValues.value)
					height, width = m_TooltipFunction.addLabel("LookItemIconAttribute", height, width, description, v.icon, v.color)
				end
			elseif attributeValues.value ~= "" then
				-- All other attributes
				if tonumber(attributeValues.value) and attributeValues.value > 0 then
					if v.symbol then
						attributeValues.value = "+" .. attributeValues.value
					end
				elseif string.sub(attributeValues.value, 1, 1) == "\n" then
					attributeValues.value = string.sub(attributeValues.value, 2, #attributeValues.value)
				end

				height, width = m_TooltipFunction.addLabel("LookItemIconAttribute", height, width, v.name:format(attributeValues.value), v.icon, v.color)
			end

			lastAttributeId = attributeValues.id
		end
	end

	m_TooltipList.window:setWidth(width)
	m_TooltipList.window:setHeight(height)
	
	local pos = m_TooltipList.window:getPosition()
	pos.x = m_TooltipList.position.x + pos.x + 16
	pos.y = m_TooltipList.position.y + pos.y + 16
	
	local rootWidget = modules.game_interface.getRootPanel()
	if pos.x + m_TooltipList.window:getWidth() >= rootWidget:getWidth() then
		pos.x = pos.x - m_TooltipList.window:getWidth()
	end
	
	if pos.y + m_TooltipList.window:getHeight() >= rootWidget:getHeight() then
		pos.y = pos.y - m_TooltipList.window:getHeight()
	end
	
	m_TooltipList.window:setPosition(pos)
end
