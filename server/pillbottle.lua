-- Server-side script for QBCore

local QBCore = exports['qb-core']:GetCoreObject()

-- Event for using the pillbottle
QBCore.Functions.CreateUseableItem("pillbottle", function(source, item)
    -- Trigger client side to open menu
    TriggerClientEvent('md-drugs:client:OpenPillbottleMenu', source,item)
end)

RegisterServerEvent('md-drugs:server:adjustPillbottle', function()

end)


-- Server event for putting a pill into the bottle
RegisterServerEvent('pillbottle:putPill', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pillItem = Player.Functions.GetItemByName("pill")
    local pillbottleItem = Player.Functions.GetItemByName("pillbottle")

    if pillItem and pillbottleItem then
        -- Increase the count of pills in the bottle
        local currentPills = pillbottleItem.info.pills or 0
        pillbottleItem.info.pills = currentPills + 1
        -- Remove a pill from player's inventory and update pillbottle info
        Player.Functions.RemoveItem('pill', 1)
        Player.Functions.AddItem('pillbottle', 1, false, {pills = pillbottleItem.info.pills})
        TriggerClientEvent('QBCore:Notify', src, "You put a pill in the bottle. Total: "..pillbottleItem.info.pills, "success")
    else
        if not pillItem then
            TriggerClientEvent('QBCore:Notify', src, "You don't have any pills!", "error")
        end
        if not pillbottleItem then
            TriggerClientEvent('QBCore:Notify', src, "You don't have a pill bottle!", "error")
        end
    end
end)

-- Server event for taking a pill out of the bottle
RegisterServerEvent('pillbottle:takePill', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pillbottleItem = Player.Functions.GetItemByName("pillbottle")

    if pillbottleItem and pillbottleItem.info.pills and pillbottleItem.info.pills > 0 then
        -- Decrease the count of pills in the bottle
        pillbottleItem.info.pills = pillbottleItem.info.pills - 1
        -- Update pillbottle info and add a pill to player's inventory
        Player.Functions.AddItem('pill', 1)
        Player.Functions.AddItem('pillbottle', 1, false, {pills = pillbottleItem.info.pills})
        TriggerClientEvent('QBCore:Notify', src, "You took a pill from the bottle. Remaining: "..pillbottleItem.info.pills, "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "The pill bottle is empty!", "error")
    end
end)
