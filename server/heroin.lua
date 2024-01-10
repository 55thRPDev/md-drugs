local QBCore = exports['qb-core']:GetCoreObject()
GlobalState.PoppyPlants = Config.PoppyPlants


Citizen.CreateThread(function()
    for _, v in pairs(Config.PoppyPlants) do
        v.taken = false
    end
end)

function heroinCooldown(loc)
    CreateThread(function()
        Wait(Config.respawnTime * 1000)
        Config.PoppyPlants[loc].taken = false
        GlobalState.PoppyPlants = Config.PoppyPlants
        Wait(1000)
        TriggerClientEvent('heroin:respawnCane', -1, loc)
    end)
end

RegisterNetEvent("heroin:pickupCane")
AddEventHandler("heroin:pickupCane", function(loc)
    if not Config.PoppyPlants[loc].taken then
        Config.PoppyPlants[loc].taken = true
        GlobalState.PoppyPlants = Config.PoppyPlants
        TriggerClientEvent("heroin:removeCane", -1, loc)
        heroinCooldown(loc)
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.rewardItemheroin, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.rewardItemheroin], "add")
    end
end)

--  step 1 checks that player has items needed to dry out poppy resin
RegisterServerEvent('md-drugs:server:dryplantcheck', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('poppyresin', 1 ) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['poppyresin'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Preparing resin to dry", "success")
			TriggerClientEvent('md-drugs:client:dryplant', src)
	else
		TriggerClientEvent('QBCore:Notify', src, "You having nothing to dry out", "error")
	end
end)

--step 1  give raw heroin to player
RegisterServerEvent('md-drugs:server:dryplant', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local randomchance = math.random(1,3)

	if Player.Functions.AddItem("heroin", randomchance) then
    	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroin'], "add", randomchance)
	else
		TriggerClientEvent('QBCore:Notify', src, "you don't have anything to dry out!", "error")
	end
end)

--  step 2 checks that player has items needed to cut the heroin
RegisterServerEvent('md-drugs:server:cutheroincheck', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('heroin', 1 ) then
		if Player.Functions.RemoveItem('bakingsoda', 1 ) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroin'], "remove", 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['bakingsoda'], "remove", 1)
			TriggerClientEvent('md-drugs:client:cutheroin', src)
		else
			TriggerClientEvent('QBCore:Notify', src, "you don't have baking soda!", "error")
			Player.Functions.AddItem('heroin', 1)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, "You don't have any heroin", "error")
	end
end)

-- step 2 give cut heroin to player
RegisterServerEvent('md-drugs:server:cutheroin', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem('heroincut',2) then
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroincut'], "add", 2)
		TriggerClientEvent('QBCore:Notify', src, "You cut the heroin!", "success")
	else
		TriggerClientEvent('QBCore:Notify', src, "No room in your pockets, you dropped it all and ruined it!", "error")
	end

end)

--  step 3 checks that player has items needed to putting heroin in vials
RegisterServerEvent('md-drugs:server:heatliquidheroincheck', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('heroincut', 1 ) then
		if Player.Functions.RemoveItem('emptyvial', 1 ) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroincut'], "remove", 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['emptyvial'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Heating heroin and getting vial ready!", "success")
			TriggerClientEvent('md-drugs:client:heatliquidheroin', src)

		else
			TriggerClientEvent('QBCore:Notify', src, "You don't have any empty vials!", "error")
			Player.Functions.AddItem('heroincut', 1)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, "You don't have any cut heroin!", "error")
	end
end)

--  step 3 give player heroin vials if successful
RegisterServerEvent('md-drugs:server:heatliquidheroin', function()

	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem('heroinvial', 1) then
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroinvial'], "add", 1)
		TriggerClientEvent('QBCore:Notify', src, "You made some heroin!", "success")
	else
		TriggerClientEvent('QBCore:Notify', src, "You have no room in your pockets and spilled it all!", "error")
	end

end)


--  step 4 checks that player has items needed to putting heroin in needles
RegisterServerEvent('md-drugs:server:fillneedlecheck', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('heroinvial', 1 ) then
		if Player.Functions.RemoveItem('needle', 4 ) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroinvial'], "remove", 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['needle'], "remove", 4)
			TriggerClientEvent('QBCore:Notify', src, "Filling needles with heroin!", "success")
			TriggerClientEvent('md-drugs:client:fillneedle', src)

		else
			TriggerClientEvent('QBCore:Notify', src, "You don't have enough needles!", "error")
			Player.Functions.AddItem('heroinvial', 1)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, "You don't have any heroin ready!", "error")
	end
end)



--  step 4 gives the player heroin needles
RegisterServerEvent('md-drugs:server:fillneedle', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

		if Player.Functions.AddItem('heroin_ready', 4) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroin_ready'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "Heroin is all ready to go!", "success")
		else
			TriggerClientEvent('QBCore:Notify', src, "Your pockets are too full! you dropped and broke everything", "error")
		end


end)



-- RegisterServerEvent('md-drugs:server:failheroin', function()
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.RemoveItem('heroinvialstagethree', 1 ) then
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroinvialstagethree'], "remove", 1)
-- 	elseif Player.Functions.RemoveItem('heroinvialstagetwo', 1) then
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroinvialstagetwo'], "remove", 1)
-- 	else
-- 		Player.Functions.RemoveItem('heroinvial', 1)
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroinvial'], "remove", 1)
-- 	end
-- end)




-- RegisterServerEvent('md-drugs:server:failheatingheroin', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 		if Player.Functions.RemoveItem('heroincut', 1) then
-- 			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroincut'], "remove", 1)
-- 			TriggerClientEvent('QBCore:Notify', src, "Overheated the heroin and ruined it", "error")
-- 		end

-- 	end)

-- RegisterServerEvent('md-drugs:server:removecleaningkitheroin', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 		if Player.Functions.RemoveItem("cleaningkit", 1) then
-- 			TriggerClientEvent('QBCore:Notify', src, "Cleaned It Perfectly", "success")
-- 			TriggerClientEvent("md-drugs:client:deletedirtyheroin", src)
-- 			TriggerClientEvent("md-drugs:client:resetheroinkit", src)
-- 		else
-- 		TriggerClientEvent('QBCore:Notify', src, "You cant clean it with spit alone", "error")
-- 		end
-- 	end)



-- RegisterServerEvent('md-drugs:server:getheroinlabkit', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.RemoveMoney('cash', 10000) then
-- 		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroinlabkit'], "add", 1)
-- 		Player.Functions.AddItem('heroinlabkit', 1)
-- 		end
-- 	end)

-- 	RegisterServerEvent('md-drugs:server:getheroinlabkitback', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 		if Player.Functions.AddItem("heroinlabkit", 1) then
-- 		end
-- 	end)

-- 	QBCore.Functions.CreateUseableItem('heroinlabkit', function(source, item)
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 		if TriggerClientEvent("md-drugs:client:setheroinlabkit", src) then
-- 			Player.Functions.RemoveItem("heroinlabkit", 1)
-- 		end
-- 	end)