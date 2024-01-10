local QBCore = exports['qb-core']:GetCoreObject()

cookkitnum = 0


local function loadParticle(dict)
    if not HasNamedPtfxAssetLoaded(dict) then
        RequestNamedPtfxAsset(dict)
    end
    while not HasNamedPtfxAssetLoaded(dict) do
        Wait(0)
    end
    SetPtfxAssetNextCall(dict)
end

RegisterNetEvent("md-drugs:client:setcookkit")
AddEventHandler("md-drugs:client:setcookkit", function()
local PedCoords = GetEntityCoords(PlayerPedId())
	exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
	QBCore.Functions.Progressbar("drink_something", "Setting Cooking Table Up", 1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done

    cookkitnum = cookkitnum + 1
     -- Generate a unique key for this instance
    local labkit = {}
    local uniqueKey = "labkit_" .. cookkitnum .. PlayerPedId()

	labkit[uniqueKey] = CreateObject("v_ret_ml_tablea", PedCoords.x+1, PedCoords.y+1, PedCoords.z-1, true, false)

	SetVehicleOnGroundProperly(labkit[uniqueKey])
	ClearPedTasks(PlayerPedId())
	exports['qb-target']:AddTargetEntity(labkit[uniqueKey], {
    options = {
        {
			num = 1,
            type = "client",
            event = "md-drugs:client:checkcoke",
            icon = "fas fa-box-circle-check",
            label = "Boil Water and Coke",
        },
		{
			num = 2,
            type = "client",
            event = "md-drugs:client:checkBakingSoda",
            icon = "fas fa-box-circle-check",
            label = "Add Baking Soda",
        },
        {
			num = 3,
            type = "client",
            event = "md-drugs:client:getcookkitback",
            icon = "fas fa-box-circle-check",
            label = "Pick Up",
        },
    },
    distance = 3.0
})
end)
end)

RegisterNetEvent("md-drugs:client:getcookkitback")
AddEventHandler("md-drugs:client:getcookkitback", function()
    exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
    local pedCoords = GetEntityCoords(PlayerPedId())
    QBCore.Functions.Progressbar("drink_something", "Packing Up", 1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done

        local objectId = GetClosestObjectOfType(pedCoords, 2.0, GetHashKey("v_ret_ml_tablea"), false)

        if DoesEntityExist(objectId) then
            TriggerServerEvent("md-drugs:server:removecookkit", ObjToNet(objectId))
        end

		ClearPedTasks(PlayerPedId())
	end)
end)

RegisterNetEvent('md-drugs:client:removecookkit')
AddEventHandler('md-drugs:client:removecookkit', function(netId)
    -- Delete the object with the given network ID if client has control
    if NetworkHasControlOfNetworkId(netId) then
        DeleteObject(NetToObj(netId))
    end
end)

RegisterNetEvent("md-drugs:client:checkcoke")
AddEventHandler("md-drugs:client:checkcoke", function()
    TriggerServerEvent("md-drugs:server:checkcoke")
end)

RegisterNetEvent("md-drugs:client:heatwater")
AddEventHandler("md-drugs:client:heatwater", function()
	exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
	local pedCoords = GetEntityCoords(PlayerPedId())
	dict = "scr_ie_svm_technical2"

        QBCore.Functions.Progressbar("drink_something", "Heating Coke and Water Mix!", 1000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()-- Done
        exports['ps-ui']:Circle(function(success)
        if success then
            TriggerServerEvent("md-drugs:server:heatwater")
            ClearPedTasks(PlayerPedId())
        else
            TriggerServerEvent("md-drugs:server:failheatingwater")
            ClearPedTasks(PlayerPedId())
            loadParticle(dict)
            local dirtycookkit = GetClosestObjectOfType(pedCoords, 2.0, GetHashKey("v_ret_ml_tablea"), false)
            exitPtfx = StartParticleFxLoopedOnEntity("scr_dst_cocaine", dirtycookkit, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, false, false, false)
            SetParticleFxLoopedAlpha(exitPtfx, 3.0)
            ClearPedTasks(PlayerPedId())
        end
    end, 1, 8) -- NumberOfCircles, MS
        end)
end)

RegisterNetEvent("md-drugs:client:checkBakingSoda")
AddEventHandler("md-drugs:client:checkBakingSoda", function()
    TriggerServerEvent("md-drugs:server:checkBakingSoda")
end)


RegisterNetEvent("md-drugs:client:makeRocks")
AddEventHandler("md-drugs:client:makeRocks", function()
	exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
    QBCore.Functions.Progressbar("drink_something", "Cooking up some rocks!", 1000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
	exports['ps-ui']:Circle(function(success)
    if success then
        TriggerServerEvent("md-drugs:server:makeRocks")
        ClearPedTasks(PlayerPedId())
	else
		QBCore.Functions.Notify("You overheated the rocks and ruined it!", "error")
        ClearPedTasks(PlayerPedId())
	end
end, 4, 14) -- NumberOfCircles, MS
    end)
end)


RegisterNetEvent("md-drugs:client:cutsheet")
AddEventHandler("md-drugs:client:cutsheet", function()
	exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
    QBCore.Functions.Progressbar("drink_something", "Cutting Sheets", 4000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
        ClearPedTasks(PlayerPedId())
    end)
end)


