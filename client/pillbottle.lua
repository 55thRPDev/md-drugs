-- Client-side script for QBCore and QB-Menu
RegisterNetEvent('md-drugs:client:OpenPillbottleMenu', function(item)
    exports['qb-menu']:openMenu({
        {
            header = "Pill Bottle Options",
            isMenuHeader = true,
        },
        {
            header = "Put Pill in Bottle",
            txt = "Store one of your pills in the bottle.",
            params = {
                event = "md-drugs:client:storepill",
                args = { itemData = item }
            }
        },
        {
            header = "Take Pill from Bottle",
            txt = "Take a pill from the bottle.",
            params = {
                event = "pillbottle:takePill",
            }
        },
        {
            header = "Close Menu",
            txt = "",
            params = {
                event = "",
            }
        }
    })
end)


RegisterNetEvent("md-drugs:client:swallowpill")
AddEventHandler("md-drugs:client:swallowpill", function()
exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
    QBCore.Functions.Progressbar("drink_something", "Swallowing Pill", 4000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
	    TriggerServerEvent("md-drugs:server:swallowpill")
        ClearPedTasks(PlayerPedId())
    end)
end)


RegisterNetEvent("md-drugs:client:storepill")
AddEventHandler("md-drugs:client:storepill", function(itemData)

    print ("pill test" .. itemData.label)
    exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
    QBCore.Functions.Progressbar("drink_something", "Putting Pill in Bottle", 4000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
	    TriggerServerEvent("md-drugs:server:storepill")
        ClearPedTasks(PlayerPedId())
    end)
end)