local QBCore = exports['qb-core']:GetCoreObject()
-- default animations for taking drugs
local dictionary = "mp_suicide"
local animation = "pill"
-- needle based drug animations
-- local syringeProp = `prop_syringe_01`
-- local syringeDict = "rcmpaparazzo1ig_4"
-- local syringeAnim = "miranda_shooting_up"
-- local syringeBone = 28422
-- local syringeOffset = vector3(0, 0, 0)
-- local syringeRot = vector3(0, 0, 0)


local xtc = {
    white_playboys = true, white_playboys2 = true, white_playboys3 = true, white_playboys4 = true,
    blue_playboys = true, blue_playboys2 = true, blue_playboys3 = true, blue_playboys4 = true,
    red_playboys = true, red_playboys2 = true, red_playboys3 = true, red_playboys4 = true,
    orange_playboys = true, orange_playboy2s = true, orange_playboys3 = true, orange_playboys4 = true,
    white_aliens = true, white_aliens2 = true, white_aliens3 = true, white_aliens4 = true,
    blue_aliens = true, blue_aliens2 = true, blue_aliens3 = true, blue_aliens4 = true,
    red_aliens = true, red_aliens2 = true, red_aliens3 = true, red_aliens4 = true,
    orange_aliens = true, orange_aliens2 = true, orange_aliens3 = true, orange_aliens4 = true,
    white_pl = true, white_pl2 = true, white_pl3 = true, white_pl4 = true,
    blue_pl = true, blue_pl2 = true, blue_pl3 = true, blue_pl4 = true,
    red_pl = true, red_pl2 = true, red_pl3 = true, red_pl4 = true,
    orange_pl = true, orange_pl2 = true, orange_pl3 = true, orange_pl4 = true,
    white_trolls = true, white_trolls2 = true, white_trolls3 = true, white_trolls4 = true,
    blue_trolls = true, blue_trolls2 = true, blue_trolls3 = true, blue_trolls4 = true,
    red_trolls = true, red_trolls2 = true, red_trolls3 = true, red_trolls4 = true,
    orange_trolls = true, orange_trolls2 = true, orange_trolls3 = true, orange_trolls4 = true,
    white_cats = true, white_cats2 = true, white_cats3 = true, white_cats4 = true,
    blue_cats = true, blue_cats2 = true, blue_cats3 = true, blue_cats4 = true,
    red_cats = true, red_cats2 = true, red_cats3 = true, red_cats4 = true,
    orange_cats = true, orange_cats2 = true, orange_cats3 = true, orange_cats4 = true
}


RegisterNetEvent('md-drugs:client:consumedrugs', function(itemName)

    -- if itemName == "heroin_ready" then
	-- 	SyringeUse()
    -- end
      QBCore.Functions.Progressbar("use_lsd", "Have Fun!", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = dictionary,
        anim = animation,
        flags = 49,
    }, {}, {}, function()
       ClearPedTasks(cache.ped)
       --delete the syringe in players hand
    --    DeleteObject(SyringeObj)
    TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        if itemName == "cokebaggy" or itemName == "baggedcracked" then
            CokeBaggyEffect()
		elseif xtc[itemName] then
			AlienEffect()
        -- elseif itemName == "heroin_ready" then
        --     HeroinEffect()
		-- else
			TrevorEffect()
        end
   end)

end)

-- function SyringeUse()

--     SyringeObj = CreateObject(syringeProp, 0.0, 0.0, 0.0, true, true, false)
-- 	local syringeBoneIndex = GetPedBoneIndex(cache.ped, syringeBone)

-- 	lib.requestModel(syringeProp, 1000) -- utilize lib request
-- 	SetModelAsNoLongerNeeded(syringeProp) -- set as no longer needed immediately after request to release the model from the cdimage

-- 	-- unarm the player, attach the syringe object to them
-- 	SetCurrentPedWeapon(cache.ped, `weapon_unarmed`, true)
-- 	AttachEntityToEntity(SyringeObj, cache.ped, syringeBoneIndex, syringeOffset.x, syringeOffset.y, syringeOffset.z, syringeRot.x, syringeRot.y, syringeRot.z, false, false, false, false, 2, true)

-- 	-- set dict and anim variables for progress bar to use syringe animations
-- 	dictionary = syringeDict
-- 	animation = syringeAnim

-- end