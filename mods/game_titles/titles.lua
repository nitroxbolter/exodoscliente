local playerTitles = {["Exodus"] = {title = "[Game Master]", color = "#FFA500"}}
local titleFont = "verdana-11px-rounded"
function init()

  connect(Creature, {
    onAppear = updateTitle,
  })  
end

function terminate()

disconnect(Creature, {
    onAppear = updateTitle,
  })  
end

function updateTitle(creature)
    local name = creature:getName()
    --removed unused monster level code for you
    if creature:isPlayer() then
        if playerTitles[name] then
            creature:setTitle(playerTitles[name].title, titleFont, playerTitles[name].color)
        end
    end
end