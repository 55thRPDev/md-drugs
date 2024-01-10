QBCore = exports['qb-core']:GetCoreObject()
local currentDealer = nil
local dealerIsHome = false
local waitingDelivery = nil
local activeDelivery = nil
local deliveryTimeout = 0
local waitingKeyPress = false
local dealerCombo = nil
local drugDeliveryZone

-- Handlers

AddStateBagChangeHandler('isLoggedIn', nil, function(_, _, value)
    if value then
        QBCore.Functions.TriggerCallback('md-drugs:server:RequestConfig', function(DealerConfig)
            Config.Dealers = DealerConfig
        end)
        Wait(1000)
        InitZones()
    else
        if not Config.UseTarget and dealerCombo then dealerCombo:destroy() end
    end
end)

-- Functions

local function GetClosestDealer()
    local ped = PlayerPedId()
    local pCoords = GetEntityCoords(ped)
    for k,v in pairs(Config.Dealers) do
        local dealerCoords = vector3(v.coords.x, v.coords.y, v.coords.z)
        if #(pCoords - dealerCoords) < 2 then
            currentDealer = k
            break
        end
    end
end

local function OpenDealerShop()
    GetClosestDealer()
    local repItems = {}
    repItems.label = Config.Dealers[currentDealer]["name"]
    repItems.items = {}
    repItems.slots = 30
    for k, _ in pairs(Config.Dealers[currentDealer]["products"]) do
        if QBCore.Functions.GetPlayerData().metadata["dealerrep"] >= Config.Dealers[currentDealer]["products"][k].minrep then
            repItems.items[k] = Config.Dealers[currentDealer]["products"][k]
            print(Config.Dealers[currentDealer]["products"][k])
        end
    end
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Dealer_"..Config.Dealers[currentDealer]["name"], repItems)
end



local function RandomDeliveryItemOnRep()
    local myRep = QBCore.Functions.GetPlayerData().metadata["dealerrep"]
    local availableItems = {}
    for k, _ in pairs(Config.DeliveryItems) do
        if Config.DeliveryItems[k]["minrep"] <= myRep then
            availableItems[#availableItems+1] = k
        end
    end
    return availableItems[math.random(1, #availableItems)]
end

local function RequestDelivery()

    if not waitingDelivery then

        GetClosestDealer()

        local amount = 1
        local item = RandomDeliveryItemOnRep()

        if item ~= 'dealercase' then
            amount = math.random(5,10)
        end

        QBCore.Functions.Notify("The Dealer will text you with instructions soon", 'success')

        local location = math.random(1, #Config.DeliveryLocations)

            waitingDelivery = {
                ["coords"] = Config.DeliveryLocations[location]["coords"],
                ["locationLabel"] = Config.DeliveryLocations[location]["label"],
                ["amount"] = amount,
                ["dealer"] = currentDealer,
                ["itemData"] = Config.DeliveryItems[item],
                ["item"] = item
            }
            if Config.Debug == true then
                print(Config.DeliveryLocations[location]["coords"])
                print(Config.DeliveryLocations[location]["label"])
            end

        TriggerServerEvent('md-drugs:server:giveDeliveryItems', waitingDelivery)

        SetTimeout(30000, function()
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = Config.Dealers[currentDealer]["name"],
                subject = 'Delivery Location',
                message = 'Take the briefcase to the location I attached',
                button = {
                    enabled = true,
                    buttonEvent = "md-drugs:client:setLocation",
                    buttonData = waitingDelivery
                }
            })
        end)

    else
        QBCore.Functions.Notify("You Havent Even delivered the first one", 'error')
    end
end

local function DeliveryTimer()
    CreateThread(function()
        while deliveryTimeout - 1 > 0 do
            deliveryTimeout = deliveryTimeout - 1
            Wait(1000)
        end
        deliveryTimeout = 0
    end)
end


local function PoliceCall()
    local random = math.random(1, 100)
    if random <= Config.PoliceCallChance then
        exports['ps-dispatch']:DrugSale()
    end
end

local function DeliverStuff()
    if deliveryTimeout > 0 then
        Wait(500)
        exports["rpemotes"]:EmoteCommandStart("uncuff", 0)
        PoliceCall()
        QBCore.Functions.Progressbar("work_dropbox", "Handing off the Package", 3500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('md-drugs:server:successDelivery', activeDelivery, true)
            activeDelivery = nil
            exports['qb-target']:RemoveZone('drugDeliveryZone')
            ClearPedTasks(PlayerPedId())
        end)
    else
        TriggerServerEvent('md-drugs:server:successDelivery', activeDelivery, false)
    end
    deliveryTimeout = 0
end

local function SetMapBlip(x, y)
    SetNewWaypoint(x, y)
    QBCore.Functions.Notify("Marked On Your Map", 'success');
end

-- PolyZone specific functions


function InitZones()
    if next(Config.Dealers) == nil then return end

     for k,v in pairs(Config.Dealers) do
		local Ped = "g_m_y_famdnf_01"
         RequestModel(Ped)
         while not HasModelLoaded(Ped) do
             Wait(0)
         end

         testdealer = CreatePed(0, Ped,v.coords.x,v.coords.y,v.coords.z-1, 90.0, false, false)
          FreezeEntityPosition(testdealer, true)
         SetEntityInvincible(testdealer, true)
         exports["qb-target"]:AddBoxZone("dealer_"..k, vector3(v.coords.x, v.coords.y, v.coords.z), 1.5, 1.5, {
             name = "dealer_"..k,
             heading = v.heading,
             minZ = v.coords.z - 1,
             maxZ = v.coords.z + 1,
             debugPoly = false,
         }, {
             options = {
                 {
                     icon = 'fas fa-user-secret',
                     label = "Request Delivery",
                     action = function()
                         RequestDelivery()
                     end,
                     canInteract = function()
                         GetClosestDealer()
                         local hours = GetClockHours()
                         local min = Config.Dealers[currentDealer]["time"]["min"]
                         local max = Config.Dealers[currentDealer]["time"]["max"]
                         if max < min then
                             if hours <= max then
                                 if not waitingDelivery then
                                     return true
                                 end
                             elseif hours >= min then
                                 if not waitingDelivery then
                                     return true
                                 end
                             end
                         else
                             if hours >= min and hours <= max then
                                 if not waitingDelivery then
                                     return true
                                 end
                             end
                         end
                     end
                 },
                 {
                     icon = 'fas fa-user-secret',
                     label = "Open Shop",
                     action = function()
                         OpenDealerShop()
                     end,
                     canInteract = function()
                         GetClosestDealer()
                         local hours = GetClockHours()
                         local min = Config.Dealers[currentDealer]["time"]["min"]
                         local max = Config.Dealers[currentDealer]["time"]["max"]
                         if max < min then
                             if hours <= max then
                                 return true
                             elseif hours >= min then
                                 return true
                             end
                         else
                             if hours >= min and hours <= max then
                                 return true
                             end
                         end
                     end
                 }
             },
             distance = 1.5
         })
     end

end

-- Events

RegisterNetEvent('md-drugs:client:RefreshDealers', function(DealerData)
    if not Config.UseTarget and dealerCombo then dealerCombo:destroy() end
    Config.Dealers = DealerData
    Wait(1000)
    InitZones()
end)

RegisterNetEvent('md-drugs:client:updateDealerItems', function(itemData, amount)
    TriggerServerEvent('md-drugs:server:updateDealerItems', itemData, amount, currentDealer)
end)

RegisterNetEvent('md-drugs:client:setDealerItems', function(itemData, amount, dealer)
    Config.Dealers[dealer]["products"][itemData.slot].amount = Config.Dealers[dealer]["products"][itemData.slot].amount - amount
end)

RegisterNetEvent('md-drugs:client:setLocation', function(locationData)
    if activeDelivery then
        SetMapBlip(activeDelivery["coords"]["x"], activeDelivery["coords"]["y"])
        QBCore.Functions.Notify("Already Delivering", 'error')
        return
    end
    activeDelivery = locationData
    deliveryTimeout = 300
    DeliveryTimer()
    SetMapBlip(activeDelivery["coords"].x, activeDelivery["coords"].y)
	local Ped = "g_m_y_famdnf_01"
     RequestModel(Ped)
     while not HasModelLoaded(Ped) do
         Wait(0)
     end

     Buyer = CreatePed(0, Ped,activeDelivery["coords"].x, activeDelivery["coords"].y, activeDelivery["coords"].z-1, 180.0, false, false)
     FreezeEntityPosition(Buyer, true)
    SetEntityInvincible(Buyer, true)
    if Config.UseTarget then
        exports.ox_target:addLocalEntity(Buyer, {
                {
                    icon = 'fas fa-user-secret',
                    label = "Hand Off",
                    distance = 1.5,
                    onSelect = function()
                        DeliverStuff()
						Wait(4000)
						DeleteEntity(Buyer)
                        waitingDelivery = nil
                    end,
                    canInteract = function()
                        if waitingDelivery then
                            return true
                        end
                    end
                }
        })
    end
end)

RegisterNetEvent('md-drugs:client:sendDeliveryMail', function(type, deliveryData)
    if type == 'perfect' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = 'Delivery',
            message = 'Good job brodie, hit me up the next time your around for more work',
            button = {}
        })
    elseif type == 'bad' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = 'Delivery',
            message = 'You fucked me over Goofy',
            button = {}
        })
    elseif type == 'late' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = 'Delivery',
            message = 'Better late then dead',
            button = {}
        })
    end
end)

RegisterCommand('checkrep', function()
    local drugrep = QBCore.Functions.GetPlayerData().metadata["dealerrep"]
    QBCore.Functions.Notify("Current Rep: "..drugrep)
end)