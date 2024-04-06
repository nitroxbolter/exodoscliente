modalDialog = nil
dungeonImage = nil
alternativeModalDialog = nil
SecondAlternativeModalDialog = nil
lastDialogChoices = 0
lastDialogChoice = 0
lastDialogAnswer = 0

function init()
  g_ui.importStyle('modaldialog')

  connect(g_game, { onModalDialog = onModalDialog,
                    onGameEnd = destroyDialog })

  local dialog = rootWidget:recursiveGetChildById('modalDialog')
  if dialog then
    modalDialog = dialog
  end
end

function terminate()
  disconnect(g_game, { onModalDialog = onModalDialog,
                       onGameEnd = destroyDialog })
end

function destroyDialog()
  if modalDialog then
    modalDialog:destroy()
    modalDialog = nil
  end
end

function onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)
  if modalDialog then
    return
  end

  if id == 3333 then
    modalDialog = g_ui.createWidget('AlternativeModalDialog', rootWidget)
    -- Assegura que messageLabel é definido dentro deste escopo
    local messageLabel = modalDialog:getChildById('messageLabel')
    local choiceList = modalDialog:getChildById('alternativeChoiceList')
    local choiceScrollbar = modalDialog:getChildById('alternativeChoiceScrollBar')
    local buttonsPanel = modalDialog:getChildById('alternativeButtonsPanel')
    messageLabel:setText(message) -- Define o texto aqui para garantir que é feito no momento certo
  elseif id == 2051 then
    modalDialog = g_ui.createWidget('SecondAlternativeModalDialog', rootWidget)
    
    local dungeonLeft = modalDialog:getChildById('dungeonLeft')
    local dungeonMiddle = modalDialog:getChildById('dungeonMiddle')
    local dungeonRight = modalDialog:getChildById('dungeonRight')
    local dungeonImage = modalDialog:getChildById('dungeonImage')
    
    local dungeonName, needPartyMsg, needLevelMsg, timeDiffStr, dropsMsg = message:match("Dungeon ([^\n]+)\n\n([^\n]+)\n([^\n]+)\nTime to make Dungeon: ([^\n]+)\n([^\n]+)")
    
    if dungeonImage and dungeonName then
        local imagePath = "art/" .. dungeonName .. ".png"
        dungeonImage:setImageSource(imagePath)
    end
    
    dungeonLeft:setText("\n\nGroup:\n" .. (needPartyMsg or "N/A") .. "\n\nLevel Required:\n" .. (needLevelMsg or "N/A"))
    dungeonMiddle:setText("Estimated Time:\n" .. (timeDiffStr or "N/A"))
    
    local itemIds = {}
    for itemId in dropsMsg:gmatch("(%d+)") do
        table.insert(itemIds, tonumber(itemId))
    end

    dungeonRight:destroyChildren()
    for _, itemId in ipairs(itemIds) do
        local itemWidget = g_ui.createWidget('UIItem', dungeonRight)
        itemWidget:setItemId(itemId)
    end
  else
    modalDialog = g_ui.createWidget('ModalDialog', rootWidget)
    local messageLabel = modalDialog:getChildById('messageLabel')
    messageLabel:setText(message)
  end


  local messageLabel = modalDialog:getChildById('messageLabel')
  local choiceList = modalDialog:getChildById('choiceList')
  local choiceScrollbar = modalDialog:getChildById('choiceScrollBar')
  local buttonsPanel = modalDialog:getChildById('buttonsPanel')

  modalDialog:setText(title)
  messageLabel:setText(message)

  local labelHeight
  for i = 1, #choices do
    local choiceId = choices[i][1]
    local choiceName = choices[i][2]

    if id == 3333 then
      label = g_ui.createWidget('AlternativeChoiceListLabel', choiceList)
      -- Aqui você define a imagem de fundo para a label baseada no nome da escolha
      label:setImageSource(choiceName)  -- Assumindo que o nome da escolha pode ser diretamente usado para encontrar a imagem
    else
      label = g_ui.createWidget('ChoiceListLabel', choiceList)
    end
    label.choiceId = choiceId
    label:setText(choiceName)
    label:setPhantom(false)
    if not labelHeight then
      labelHeight = label:getHeight()
    end
  end
  if #choices > 0 then
    if g_clock.millis() < lastDialogAnswer + 1000 and lastDialogChoices == #choices then
      choiceList:focusChild(choiceList:getChildByIndex(lastDialogChoice))    
    else
      choiceList:focusChild(choiceList:getFirstChild())
    end
  end

  local buttonsWidth = 0
  for i = 1, #buttons do
    local buttonId = buttons[i][1]
    local buttonText = buttons[i][2]

    local button = g_ui.createWidget('ModalButton', buttonsPanel)
    button:setText(buttonText)
    button.onClick = function(self)
                       local focusedChoice = choiceList:getFocusedChild()
                       local choice = 0xFF
                       if focusedChoice then
                         choice = focusedChoice.choiceId
                         lastDialogChoice = choiceList:getChildIndex(focusedChoice)
                         lastDialogAnswer = g_clock.millis()
                       end
                       g_game.answerModalDialog(id, buttonId, choice)
                       destroyDialog()
                     end
    buttonsWidth = buttonsWidth + button:getWidth() + button:getMarginLeft() + button:getMarginRight()
  end

  local additionalHeight = 0
  if #choices > 0 then
    choiceList:setVisible(true)
    choiceScrollbar:setVisible(true)

    additionalHeight = math.min(modalDialog.maximumChoices, math.max(modalDialog.minimumChoices, #choices)) * labelHeight
    additionalHeight = additionalHeight + choiceList:getPaddingTop() + choiceList:getPaddingBottom()
  end

  local horizontalPadding = modalDialog:getPaddingLeft() + modalDialog:getPaddingRight()
  buttonsWidth = buttonsWidth + horizontalPadding
  
  local labelWidth = math.min(600, math.floor(message:len() * 1.5))
  modalDialog:setWidth(math.min(modalDialog.maximumWidth, math.max(buttonsWidth, labelWidth, modalDialog.minimumWidth)))
  messageLabel:setTextWrap(true)
  
  modalDialog:setHeight(90 + additionalHeight + messageLabel:getHeight())

  local enterFunc = function()
    local focusedChoice = choiceList:getFocusedChild()
    local choice = 0xFF
    if focusedChoice then
      choice = focusedChoice.choiceId
      lastDialogChoice = choiceList:getChildIndex(focusedChoice)
      lastDialogAnswer = g_clock.millis()
    end
    g_game.answerModalDialog(id, enterButton, choice)
    destroyDialog()
  end

  local escapeFunc = function()
    local focusedChoice = choiceList:getFocusedChild()
    local choice = 0xFF
    if focusedChoice then
      choice = focusedChoice.choiceId
      lastDialogChoice = choiceList:getChildIndex(focusedChoice)
      lastDialogAnswer = g_clock.millis()
    end
    g_game.answerModalDialog(id, escapeButton, choice)
    destroyDialog()
  end

  choiceList.onDoubleClick = enterFunc

  modalDialog.onEnter = enterFunc
  modalDialog.onEscape = escapeFunc
  
  lastDialogChoices = #choices
end