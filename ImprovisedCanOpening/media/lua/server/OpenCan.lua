function Recipe.GetItemTypes.ImprovisedCanOpener(scriptItems)
    Recipe.GetItemTypes.Hammer(scriptItems)
    Recipe.GetItemTypes.Saw(scriptItems)
    Recipe.GetItemTypes.Screwdriver(scriptItems)
    Recipe.GetItemTypes.DullKnife(scriptItems)
    Recipe.GetItemTypes.SharpKnife(scriptItems)
    Recipe.GetItemTypes.Scissors(scriptItems)
    Recipe.GetItemTypes.Fork(scriptItems)
    Recipe.GetItemTypes.Spoon(scriptItems)
    Recipe.GetItemTypes.Corkscrew(scriptItems)
    scriptItems:add(getScriptManager():getItem("Base.Stone"))
    scriptItems:add(getScriptManager():getItem("Base.SharpedStone"))
    scriptItems:add(getScriptManager():getItem("Base.MeatCleaver"))
    scriptItems:add(getScriptManager():getItem("Base.Katana"))
    scriptItems:add(getScriptManager():getItem("Base.HolePuncher"))
end

function Recipe.OnCreate.ImprovisedOpenCan(items, result, player)
    local minSpill = 25
    local maxSpill = 50
    local spill = ZombRand(minSpill, maxSpill + 1)
    result:multiplyFoodValues(1 - spill / 100)
    print("You spill " .. spill .. "% of the can.")
    local speech = "UI_speech_spill_medium"
    if (spill < 30) then
        speech = "UI_speech_spill_low"
    elseif (spill > 40) then
        speech = "UI_speech_spill_high"
    end
    player:Say(getText(speech))
end

function Recipe.OnCreate.ImprovisedOpenCanBeanBowl(items, result, player)
    Recipe.OnCreate.BeanBowl(items, result, player)
    Recipe.OnCreate.ImprovisedOpenCan(items, result, player)
end
