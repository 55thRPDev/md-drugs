local QBCore = exports['qb-core']:GetCoreObject()

GlobalState.CocaPlant = Config.CocaPlant

Citizen.CreateThread(function()
    for _, v in pairs(Config.CocaPlant) do
        v.taken = false
    end
end)

function CaneCooldown(loc)
    CreateThread(function()
		local randomNum = math.random(1,2000)
        Wait(Config.respawnTime * 1000 - randomNum)
        Config.CocaPlant[loc].taken = false
        GlobalState.CocaPlant = Config.CocaPlant
        Wait(1000)
        TriggerClientEvent('coke:respawnCane', -1, loc)
    end)
end

RegisterNetEvent("coke:pickupCane")
AddEventHandler("coke:pickupCane", function(loc)
    if not Config.CocaPlant[loc].taken then
        Config.CocaPlant[loc].taken = true
        GlobalState.CocaPlant = Config.CocaPlant
        TriggerClientEvent("coke:removeCane", -1, loc)
        CaneCooldown(loc)
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.rewardItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.rewardItem], "add")
    end
end)

RegisterServerEvent('md-drugs:server:makepowdercheck', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem("coca_leaf", 1) then
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coca_leaf'], "remove", 1)
		TriggerClientEvent("md-drugs:client:makepowder", src)
	else
		TriggerClientEvent('QBCore:Notify', src, "You don't have any coca leafs", "error")
    end
end)

RegisterServerEvent('md-drugs:server:makepowder', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("coke", 1) then
    	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "add", 1)
	else
		TriggerClientEvent('QBCore:Notify', src, "your pockets are full and you dropped everything", "error")
    end
end)


RegisterServerEvent('md-drugs:server:cutcokecheck', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem("coke", 1) then
		if Player.Functions.RemoveItem('bakingsoda', 1 ) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "remove", 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['bakingsoda'], "remove", 1)
			TriggerClientEvent("md-drugs:client:cutcoke", src) --call cutcoke client side
		else
			TriggerClientEvent('QBCore:Notify', src, "You don't have any baking soda", "error")
			Player.Functions.AddItem('coke', 1)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, "You don't have any coke", "error")
	end
end)


RegisterServerEvent('md-drugs:server:cutcoke', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem('loosecoke', 3) then
		TriggerClientEvent('QBCore:Notify', src, "Made some cut coke", "success")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['loosecoke'], "add", 3)
	else
		TriggerClientEvent('QBCore:Notify', src, "your pockets are full and you dropped everything", "error")
    end

end)

RegisterServerEvent('md-drugs:server:bagcokecheck', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem("loosecoke", 1) then
		if Player.Functions.RemoveItem('empty_weed_bag', 1 ) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['loosecoke'], "remove", 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove", 1)
			TriggerClientEvent("md-drugs:client:bagcoke", src) --call bagcoke client side
		else
			TriggerClientEvent('QBCore:Notify', src, "You don't have bags", "error")
			Player.Functions.AddItem('loosecoke', 1)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, "You don't have any coke to bag up", "error")
	end
end)

RegisterServerEvent('md-drugs:server:bagcoke', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem('cokebaggy', 1) then
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cokebaggy'], "add", 1)
	else
		TriggerClientEvent('QBCore:Notify', src, "your pockets are full and you dropped everything", "error")
    end

end)
