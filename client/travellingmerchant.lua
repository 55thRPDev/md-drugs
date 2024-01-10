
CreateThread(function()
local current = "s_f_y_scrubs_01"
       RequestModel(current)
       while not HasModelLoaded(current) do
          Wait(0)
       end
	local CurrentLocation = Config.Pharmacist[math.random(#Config.Pharmacist)]

	 travellingmerchant = CreatePed(0, current,CurrentLocation.x,CurrentLocation.y,CurrentLocation.z-1, 171.33, false, false)
             FreezeEntityPosition(travellingmerchant, true)
            SetEntityInvincible(travellingmerchant, true)
	exports['qb-target']:AddTargetEntity(travellingmerchant, {
                options = {
                    {
                        type = "client",
                        label = "Browse Shop",
                        icon = "fas fa-eye",
                        event = "md-drugs:client:OpenMerchant"
                    },
                    {
                        type = "client",
                        label = "Fill Prescription",
                        icon = "ffa-light fa-pills",
                        event = "md-drugs:client:fillprescription"
                    },
                },
                distance = 2.0
            })
end)

RegisterNetEvent('md-drugs:client:OpenMerchant')
AddEventHandler('md-drugs:client:OpenMerchant', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "travelling merchant", Config.Items)
end)
