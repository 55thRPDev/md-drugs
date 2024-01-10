local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('md-drugs:server:removecookkit')
AddEventHandler('md-drugs:server:removecookkit', function(netId)

	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    -- Command all clients to delete the object with the given network ID
    TriggerClientEvent("md-drugs:client:removecookkit", -1, netId)

	if Player.Functions.AddItem("cookkit", 1) then
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cookkit'], "add", 1)
	end

end)


QBCore.Functions.CreateUseableItem('cookkit', function(source, item)
local src = source
local Player = QBCore.Functions.GetPlayer(src)

	if TriggerClientEvent("md-drugs:client:setcookkit", src) then
		Player.Functions.RemoveItem("cookkit", 1)
	end
end)

-- check if the player has enough water and coke to cook
RegisterServerEvent('md-drugs:server:checkcoke', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('water_bottle', 1) then
		if Player.Functions.RemoveItem('cokebaggy', 1) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cokebaggy'], "remove", 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['water_bottle'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Adding water and coke to the pot", "success")
			TriggerClientEvent("md-drugs:client:heatwater", src)
		else
			TriggerClientEvent('QBCore:Notify', src, "Need more coke!", "error")
			Player.Functions.AddItem('water_bottle', 1)
		end
	else
			TriggerClientEvent('QBCore:Notify', src, "Need more water", "error")
	end
end)


RegisterServerEvent('md-drugs:server:heatwater', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

		if Player.Functions.AddItem('cokeslushy', 1) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cokeslushy'], "add", 1)
			TriggerClientEvent('QBCore:Notify', src, "Finished heating up the coke", "success")
		end

end)

RegisterServerEvent('md-drugs:server:failheatingwater', function()
	local src = source
	TriggerClientEvent('QBCore:Notify', src, "you overheated the coke and ruined it", "error")
end)


-- check if the player has enough baking soda and coke slushy
RegisterServerEvent('md-drugs:server:checkBakingSoda', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('bakingsoda', 1) then
		if Player.Functions.RemoveItem('cokeslushy', 1) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['bakingsoda'], "remove", 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cokeslushy'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Cooking up some rocks", "success")
			TriggerClientEvent("md-drugs:client:makeRocks", src)
		else
			TriggerClientEvent('QBCore:Notify', src, "Need some coke!", "error")
			Player.Functions.AddItem('water_bottle', 4)
		end
	else
			TriggerClientEvent('QBCore:Notify', src, "Need more baking soda", "error")
	end
end)


RegisterServerEvent('md-drugs:server:makeRocks', function()
local src = source
local Player = QBCore.Functions.GetPlayer(src)
local numOfRocks = math.random(2,3)

		if Player.Functions.AddItem('crackrock', numOfRocks) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['crackrock'], "add", numOfRocks)
			TriggerClientEvent('QBCore:Notify', src, "Made some Crack Rocks!", "success")
		end

end)






