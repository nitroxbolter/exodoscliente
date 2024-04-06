local defaultOptions = {
  layout = DEFAULT_LAYOUT, -- set in init.lua
  vsync = true,
  showFps = true,
  showPing = true,
  fullscreen = false,
  classicView = not g_app.isMobile(),
  cacheMap = g_app.isMobile(),
  classicControl = not g_app.isMobile(),
  smartWalk = false,
  dash = false,
  autoChaseOverride = true,
  showStatusMessagesInConsole = true,
  showEventMessagesInConsole = true,
  showInfoMessagesInConsole = true,
  showTimestampsInConsole = true,
  showLevelsInConsole = true,
  showPrivateMessagesInConsole = true,
  showPrivateMessagesOnScreen = true,
  rightPanels = 1,
  leftPanels = g_app.isMobile() and 1 or 2,
  containerPanel = 8,
  backgroundFrameRate = 60,
  enableAudio = true,
  enableMusicSound = true,
  musicSoundVolume = 100,
  enableAmbientSound = true,
  ambientSound = 100,
  enableEffectSound = true,
  effectSound = 100,
  enableLights = false,
  crosshair = 2,
  ambientLight = 100,
  optimizationLevel = 1,
  displayNames = true,
  displayHealth = true,
  displayMana = true,
  displayHealthOnTop = false,
  hidePlayerBars = false,
  highlightThingsUnderCursor = true,
  displayText = true,
  dontStretchShrink = false,
  turnDelay = 100,
  hotkeyDelay = 100,
  wsadWalking = false,
  walkFirstStepDelay = 100,
  walkTurnDelay = 100,
  walkStairsDelay = 100,
  walkTeleportDelay = 100,
  walkCtrlTurnDelay = 100,
  topBar = true,
  actionbar1 = true,
  actionbar2 = false,
  actionbar3 = false,
  actionbar4 = false,
  actionbar5 = false,
  actionbar6 = false,
  actionbar7 = false,
  actionbar8 = false,
  actionbar9 = false,
  actionbarLock = false,
  profile = 1,
  antialiasing = true
}

local optionsWindow
local optionsButton
local optionsTabBar
local options = {}
local generalPanel
local interfacePanel
local consolePanel
local graphicsPanel
local audioPanel
local audioButton

function init()
  for k, v in pairs(defaultOptions) do
    g_settings.setDefault(k, v)
    options[k] = v
  end

  optionsWindow = g_ui.displayUI('options')
  optionsWindow:hide()

  optionsTabBar = optionsWindow:getChildById('optionsTabBar')
  optionsTabBar:setContentWidget(optionsWindow:getChildById('optionsTabContent'))

  g_keyboard.bindKeyDown('Ctrl+Shift+F', function() toggleOption('fullscreen') end)
  g_keyboard.bindKeyDown('Ctrl+N', toggleDisplays)

  generalPanel = g_ui.loadUI('game')
  optionsTabBar:addTab(tr('Game'), generalPanel, '/images/optionstab/game')

  interfacePanel = g_ui.loadUI('interface')
  optionsTabBar:addTab(tr('Interface'), interfacePanel, '/images/optionstab/game')

  consolePanel = g_ui.loadUI('console')
  optionsTabBar:addTab(tr('Console'), consolePanel, '/images/optionstab/console')

  graphicsPanel = g_ui.loadUI('graphics')
  optionsTabBar:addTab(tr('Graphics'), graphicsPanel, '/images/optionstab/graphics')

  audioPanel = g_ui.loadUI('audio')
  optionsTabBar:addTab(tr('Audio'), audioPanel, '/images/optionstab/audio')

  optionsButton = modules.client_topmenu.addLeftButton('optionsButton', tr('Options'), '/images/topbuttons/options',
    toggle)
  audioButton = modules.client_topmenu.addLeftButton('audioButton', tr('Audio'), '/images/topbuttons/audio',
    function() toggleOption('enableAudio') end)
  if g_app.isMobile() then
    audioButton:hide()
  end

  addEvent(function() setup() end)

  connect(g_game, {
    onGameStart = online,
    onGameEnd = offline
  })
end

function terminate()
  disconnect(g_game, {
    onGameStart = online,
    onGameEnd = offline
  })

  g_keyboard.unbindKeyDown('Ctrl+Shift+F')
  g_keyboard.unbindKeyDown('Ctrl+N')
  optionsWindow:destroy()
  optionsButton:destroy()
  audioButton:destroy()
end

function setup()
  -- load options
  for k, v in pairs(defaultOptions) do
    if type(v) == 'boolean' then
      setOption(k, g_settings.getBoolean(k), true)
    elseif type(v) == 'number' then
      setOption(k, g_settings.getNumber(k), true)
    elseif type(v) == 'string' then
      setOption(k, g_settings.getString(k), true)
    end
  end

  if g_game.isOnline() then
    online()
  end
end

function toggle()
  if optionsWindow:isVisible() then
    hide()
  else
    show()
  end
end

function show()
  optionsWindow:show()
  optionsWindow:raise()
  optionsWindow:focus()
end

function hide()
  optionsWindow:hide()
end

function toggleDisplays()
  if options['displayNames'] and options['displayHealth'] and options['displayMana'] then
    setOption('displayNames', false)
  elseif options['displayHealth'] then
    setOption('displayHealth', false)
    setOption('displayMana', false)
  else
    if not options['displayNames'] and not options['displayHealth'] then
      setOption('displayNames', true)
    else
      setOption('displayHealth', true)
      setOption('displayMana', true)
    end
  end
end

function toggleOption(key)
  setOption(key, not getOption(key))
end

function setOption(key, value, force)
  if modules.game_interface == nil then
    return
  end

  g_game.setMaxPreWalkingSteps(1)

  if not force and options[key] == value then return end
  local gameMapPanel = modules.game_interface.getMapPanel()

  if key == 'vsync' then
    g_window.setVerticalSync(value)
  elseif key == 'showFps' then
    modules.client_topmenu.setFpsVisible(value)
    if modules.game_stats and modules.game_stats.ui.fps then
      modules.game_stats.ui.fps:setVisible(value)
    end
  elseif key == 'showPing' then
    modules.client_topmenu.setPingVisible(value)
    if modules.game_stats and modules.game_stats.ui.ping then
      modules.game_stats.ui.ping:setVisible(value)
    end
  elseif key == 'fullscreen' then
    g_window.setFullscreen(value)
  elseif key == 'enableAudio' then
    if g_sounds ~= nil then
      g_sounds.setAudioEnabled(value)
    end
    if value then
      audioButton:setIcon('/images/topbuttons/audio')
    else
      audioButton:setIcon('/images/topbuttons/audio_mute')
    end
  elseif key == 'enableMusicSound' then
    if g_sounds ~= nil then
      g_sounds.getChannel(SoundChannels.Music):setEnabled(value)
    end
  elseif key == 'musicSoundVolume' then
    if g_sounds ~= nil then
      g_sounds.getChannel(SoundChannels.Music):setGain(value / 100)
    end
    audioPanel:getChildById('musicSoundVolumeLabel'):setText(tr('Music volume: %d', value))
  elseif key == 'enableAmbientSound' then
    if g_sounds ~= nil then
      g_sounds.getChannel(SoundChannels.Ambient):setEnabled(value)
    end
  elseif key == 'ambientSound' then
    if g_sounds ~= nil then
      g_sounds.getChannel(SoundChannels.Ambient):setGain(value / 100)
    end
    audioPanel:getChildById('ambientSoundLabel'):setText(tr('Ambient sound volume: %d', value))
  elseif key == 'enableEffectSound' then
    if g_sounds ~= nil then
      g_sounds.getChannel(SoundChannels.Effect):setEnabled(value)
    end
  elseif key == 'effectSound' then
    if g_sounds ~= nil then
      g_sounds.getChannel(SoundChannels.Effect):setGain(value / 100)
    end
    audioPanel:getChildById('effectSoundLabel'):setText(tr('Effect sound volume: %d', value))
  elseif key == 'backgroundFrameRate' then
    local text, v = value, value
    if value <= 0 or value >= 201 then
      text = 'max'
      v = 0
    end
    graphicsPanel:getChildById('backgroundFrameRateLabel'):setText(tr('Game framerate limit: %s', text))
    g_app.setMaxFps(v)
  elseif key == 'enableLights' then
    gameMapPanel:setDrawLights(value and options['ambientLight'] < 100)
    graphicsPanel:getChildById('ambientLight'):setEnabled(value)
    graphicsPanel:getChildById('ambientLightLabel'):setEnabled(value)
  elseif key == 'crosshair' then
    if value == 1 then
      gameMapPanel:setCrosshair("")
    elseif value == 2 then
      gameMapPanel:setCrosshair("/images/crosshair/default.png")
    elseif value == 3 then
      gameMapPanel:setCrosshair("/images/crosshair/full.png")
    end
  elseif key == 'ambientLight' then
    graphicsPanel:getChildById('ambientLightLabel'):setText(tr('Ambient light: %s%%', value))
    gameMapPanel:setMinimumAmbientLight(value / 100)
    gameMapPanel:setDrawLights(options['enableLights'] and value < 100)
  elseif key == 'optimizationLevel' then
    g_adaptiveRenderer.setLevel(value - 2)
  elseif key == 'displayNames' then
    gameMapPanel:setDrawNames(value)
  elseif key == 'displayHealth' then
    gameMapPanel:setDrawHealthBars(value)
  elseif key == 'displayMana' then
    gameMapPanel:setDrawManaBar(value)
  elseif key == 'displayHealthOnTop' then
    gameMapPanel:setDrawHealthBarsOnTop(value)
  elseif key == 'hidePlayerBars' then
    gameMapPanel:setDrawPlayerBars(value)
  elseif key == 'displayText' then
    gameMapPanel:setDrawTexts(value)
  elseif key == 'dontStretchShrink' then
    addEvent(function()
      modules.game_interface.updateStretchShrink()
    end)
  elseif key == 'wsadWalking' then
    if modules.game_console and modules.game_console.consoleToggleChat:isChecked() ~= value then
      modules.game_console.consoleToggleChat:setChecked(value)
    end
  elseif key == "antialiasing" then
    g_app.setSmooth(value)
  end

  -- change value for keybind updates
  for _, panel in pairs(optionsTabBar:getTabsPanel()) do
    local widget = panel:recursiveGetChildById(key)
    if widget then
      if widget:getStyle().__class == 'UICheckBox' then
        widget:setChecked(value)
      elseif widget:getStyle().__class == 'UIScrollBar' then
        widget:setValue(value)
      elseif widget:getStyle().__class == 'UIComboBox' then
        if type(value) == "string" then
          widget:setCurrentOption(value, true)
          break
        end
        if value == nil or value < 1 then
          value = 1
        end
        if widget.currentIndex ~= value then
          widget:setCurrentIndex(value, true)
        end
      end
      break
    end
  end

  g_settings.set(key, value)
  options[key] = value

  if key == "profile" then
    modules.client_profiles.onProfileChange()
  end

  if key == 'classicView' or key == 'rightPanels' or key == 'leftPanels' or key == 'cacheMap' then
    modules.game_interface.refreshViewMode()
  elseif key:find("actionbar") then
    modules.game_actionbar.show()
  end
end

function getOption(key)
  return options[key]
end

function addTab(name, panel, icon)
  optionsTabBar:addTab(name, panel, icon)
end

function removeTab(v)
  if type(v) == 'string' then
    v = optionsTabBar:getTab(v)
  end

  optionsTabBar:removeTab(v)
end

function addButton(name, func, icon)
  optionsTabBar:addButton(name, func, icon)
end

-- hide/show

function online()
  setLightOptionsVisibility(not g_game.getFeature(GameForceLight))
  g_app.setSmooth(g_settings.getBoolean("antialiasing"))
end

function offline()
  setLightOptionsVisibility(true)
end

-- classic view

-- graphics
function setLightOptionsVisibility(value)
  graphicsPanel:getChildById('enableLights'):setEnabled(value)
  graphicsPanel:getChildById('ambientLightLabel'):setEnabled(value)
  graphicsPanel:getChildById('ambientLight'):setEnabled(value)
end
