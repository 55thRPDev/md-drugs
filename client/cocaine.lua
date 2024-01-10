local QBCore = exports['qb-core']:GetCoreObject()
local CocaPlant = {}

function LoadModel(hash)
    hash = GetHashKey(hash)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(3000)
    end
end

RegisterNetEvent('coke:respawnCane', function(loc)
    local v = GlobalState.CocaPlant[loc]
    local hash = GetHashKey(v.model)
    --if not HasModelLoaded(hash) then LoadModel(hash) end
    if not CocaPlant[loc] then
        CocaPlant[loc] = CreateObject(hash, v.location, false, true, true)
        SetEntityAsMissionEntity(CocaPlant[loc], true, true)
        FreezeEntityPosition(CocaPlant[loc], true)
        SetEntityHeading(CocaPlant[loc], v.heading)
        exports.ox_target:addLocalEntity(CocaPlant[loc], {
                {
                    icon = "fas fa-hand",
                    label = "pick Cocaine",
                    distance = 3.0,
                    onSelect = function()
                        QBCore.Functions.Progressbar("pick_cane", "picking Cocaine Leaves", 2000, false, true, {
                            disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
                            { animDict = 'amb@prop_human_bum_bin@idle_a', anim = 'idle_a', flags = 47, },
                            {}, {}, function()
                            TriggerServerEvent("coke:pickupCane", loc)
                            ClearPedTasks(PlayerPedId())
                        end, function() -- Cancel
                            ClearPedTasks(PlayerPedId())
                        end)
                    end,

                }
        })
    end
end)

RegisterNetEvent('coke:removeCane', function(loc)
    if DoesEntityExist(CocaPlant[loc]) then DeleteEntity(CocaPlant[loc]) end
    CocaPlant[loc] = nil
end)

RegisterNetEvent("coke:init", function()
    for k, v in pairs (GlobalState.CocaPlant) do
        local hash = GetHashKey(v.model)
        if not HasModelLoaded(hash) then LoadModel(hash) end
        if not v.taken then
            CocaPlant[k] = CreateObject(hash, v.location.x, v.location.y, v.location.z, false, true, true)
            SetEntityAsMissionEntity(CocaPlant[k], true, true)
            FreezeEntityPosition(CocaPlant[k], true)
            SetEntityHeading(CocaPlant[k], v.heading)
            exports.ox_target:addLocalEntity(CocaPlant[k], {
                 {
                        icon = "fas fa-hand",
                        label = "pick cocaine",
                        distance = 3.0,
                        onSelect = function()
                            QBCore.Functions.Progressbar("pick_cane", "picking Cocaine Leaves", 2000, false, true, {
                                disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
                                { animDict = 'amb@prop_human_bum_bin@idle_a', anim = 'idle_a', flags = 47, },
                                {}, {}, function()
                                TriggerServerEvent("coke:pickupCane", k)
                                ClearPedTasks(PlayerPedId())
                            end, function() -- Cancel
                                ClearPedTasks(PlayerPedId())
                            end, "fa-regular fa-leaf")
                        end
                    }
            })
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        LoadModel('prop_plant_01a')
        TriggerEvent('coke:init')
    end
 end)
 RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
     Wait(3000)
     LoadModel('prop_plant_01a')
     TriggerEvent('coke:init')
 end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        SetModelAsNoLongerNeeded(GetHashKey('prop_plant_01a'))
        for k, v in pairs(CocaPlant) do
            if DoesEntityExist(v) then
                DeleteEntity(v) SetEntityAsNoLongerNeeded(v)
            end
        end
    end
end)


RegisterNetEvent("md-drugs:client:makepowdercheck")
AddEventHandler("md-drugs:client:makepowdercheck", function()
	    TriggerServerEvent("md-drugs:server:makepowdercheck")
end)

RegisterNetEvent("md-drugs:client:makepowder")
AddEventHandler("md-drugs:client:makepowder", function()
	exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
    QBCore.Functions.Progressbar("drink_something", "chopping plants to powder", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
	    TriggerServerEvent("md-drugs:server:makepowder")
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent("md-drugs:client:cutcokecheck")
AddEventHandler("md-drugs:client:cutcokecheck", function()
	    TriggerServerEvent("md-drugs:server:cutcokecheck")
end)

RegisterNetEvent("md-drugs:client:cutcoke")
AddEventHandler("md-drugs:client:cutcoke", function()
	exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
    QBCore.Functions.Progressbar("drink_something", "Cutting coke with baking soda", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
	    TriggerServerEvent("md-drugs:server:cutcoke")
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent("md-drugs:client:bagcokecheck")
AddEventHandler("md-drugs:client:bagcokecheck", function()
	    TriggerServerEvent("md-drugs:server:bagcokecheck")
end)

RegisterNetEvent("md-drugs:client:bagcoke")
AddEventHandler("md-drugs:client:bagcoke", function()
	exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
    QBCore.Functions.Progressbar("drink_something", "Bagging up the coke", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
	    TriggerServerEvent("md-drugs:server:bagcoke")
        ClearPedTasks(PlayerPedId())
    end)
end)