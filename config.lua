Config = {} --Ignore.

Config.UseTarget = true
Config.rewardItem = "coca_leaf"
Config.rewardItemheroin = "poppyresin"
Config.rewardshrooms = "shrooms"
Config.rewardMescaline = "cactusbulb"
Config.rewardWeed = "wetcannabis"
Config.oxtarget = true --- turn to true if you use oxtarget
Config.respawnTime = 300 -- Seconds
Config.cd = false ---- if you use cd-dispatch
Config.ps = true --- if you use ps dispatch
Config.gks = true -- true if you use gks, false if you use qb or renewed phone
Config.Fuel = "LegacyFuel" -- type the name of script you use i.e. ps-fuel, cdn-fuel, LegacyFuel
Config.imagelink = "qb-inventory/html/images/"

------------- Cocaine locations
Config.makecokepowder = vector3(1090.33, -3195.73, -38.99) --  where to take coca leaves to make powder
Config.cutcoke = vector3(1095.46, -3195.73, -38.99) -- cutting stage  coke with baking soda
Config.bagcoke = vector3(1100.86, -3199.63, -38.99) -- bag stage

---------------- Crack locations
Config.makecrack = vector3(-1366.22, -317.84, 39.55) -- make crack with baking soda with cut coke 1-3
Config.bagcrack = vector3(-1367.28, -315.88, 39.59) ---  bag crack 1-3 stages

------------------------- LSD Locations
Config.lysergicacid = vector3(-1370.71, -317.3, 39.51) -- get lysergic acid
Config.diethylamide = vector3(-1371.71, -316.02, 39.53) -- get diethylamide
Config.gettabs = vector3(-1370.77, -314.51, 39.58) -- buy tab paper
Config.buylsdlabkit = vector3(-1369.26, -312.04, 39.66)--  buy lab kit

------------------------- Heroin Locations
Config.dryplant = vector3(1334.41, -1645.51, 44.25) -- turn resin into powder
Config.cutheroinone = vector3(1332.53, -1647.77, 44.25)-- cut heroin stage 1-3 with baking soda
Config.heatheroin = vector3(1330.14, -1649.33, 44.25) -- Heat heroin
Config.fillneedle = vector3(1322.49, -1652.48, 44.25)-- fill needles with heroin

----- mescaline
Config.DryOut = vector3(2622.6, 4222.57, 43.6) -- Place to dry out mescaline into usuable drug
Config.Badtrip = 100 -- number means % chance to spawn a clone that chases and attacks while on mescaline

---------- Pharma
Config.Pharmacist = { ------------ these are the random locations the merchant can spawn on script start. whatever you want for the merchant is in Config.Items right below
vector4(-506.92, 292.5, 83.39, 30.5),
}
Config.Items = { --- this is the store for the travelling merchant
    label = "Pharmacist",
    slots = 13,
    items = {
        [1] = {name = "tab_paper", price = 50,amount = 50, info = {}, type = "item", slot = 1},
        [2] = {name = "bakingsoda", price = 25, amount = 50, info = {}, type = "item", slot = 2},
		[3] = {name = "isosafrole", price = 25, amount = 50, info = {}, type = "item", slot = 3},
		[4] = {name = "mdp2p", price = 25, amount = 50, info = {}, slot = 4},
		[5] = {name = "lysergic_acid", price = 25, amount = 50, info = {}, type = "item", slot = 5},
		[6] = {name = "diethylamide", price = 25, amount = 50, info = {}, type = "item", slot = 6},
		[7] = {name = "empty_weed_bag", price = 2, amount = 1000, info = {}, type = "item", slot = 7},
		[8] = {name = "emptyvial", price = 2, amount = 1000, info = {}, type = "item", slot = 8},
		[9] = {name = "needle", price = 25, amount = 1000, info = {}, type = "item", slot = 9},
	}
}


-------------- weed
Config.Teleout = vector3(1066.31, -3183.36, -39.16) -- where you target to tele in
Config.Telein = vector3(244.74, 374.54, 105.74) -- where you target to tele out
Config.MakeButter = vector3(1045.48, -3198.49, -38.22) -- where you make cannabutter and baked edibles
Config.MakeOil = vector3(1038.90, -3198.66, -38.17-1) -- where you make shatter

Config.WeedDry = { -- where you dry leaves
vector3(1043.0, -3191.59, -38.39),
vector3(1041.0, -3191.59, -38.39),
vector3(1045.0, -3191.59, -38.39),
vector3(1039.0, -3191.59, -38.39),
}

Config.Joblock = false -- if you want weed to be a job
Config.weedjob = "" -- what the job name is
Config.Weed = { --- this is the store for the weed ingridients
    label = "Weed Shop",
    slots = 8,
    items = {
        [1] = {name = "weedgrinder", 	label = "Weed Grinder",		price = 25, 	amount = 50, 	info = {}, type = "item", slot = 1},
		[2] = {name = "mdbutter", 		label = "Butter",			price = 25, 	amount = 50, 	info = {}, type = "item", slot = 2},
		[3] = {name = "flour", 			label = "Flour", 			price = 25, 	amount = 50, 	info = {}, type = "item", slot = 3},
		[4] = {name = "chocolate",  	label = "chocolate",		price = 25, 	amount = 50, 	info = {}, type = "item", slot = 4},
		[5] = {name = "butane", 		label = "Butane", 			price = 25, 	amount = 50, 	info = {}, type = "item", slot = 5},
		[6] = {name = "butanetorch", 	label = "Butane Torch", 	price = 2, 		amount = 1000, 	info = {}, type = "item", slot = 6},
		[7] = {name = "dabrig", 		label = "Dab Rig", 			price = 2, 		amount = 1000, 	info = {}, type = "item", slot = 7},
		[8] = {name = "mdwoods", 		label = "MD Woods", 		price = 2, 		amount = 1000, 	info = {}, type = "item", slot = 8},
	}
}


--------------------------------------- oxy runs
---- How oxyruns work. You pay for a truck, you get in it and it gives a route. There is a 20% chance that the car will be "hot" and you have to ditch it. No Routes will spawn if that pops up
----- when you get to the drop off point third eye the truck. You will carry a box to the ped. He will give you cash, some oxy and maybe a random item. Rinse and repeat
Config.truckspawn = vector4(1449.65, -1486.0, 63.22, 342.58) --- where the truck will spawn when you pay for it
Config.Payfortruck = vector3(1437.64, -1491.91, 63.62) --- where you pay for the truck

Config.oxylocations = { -- These are different locations where a ped spawns.
    vector4(-2352.32, 266.78, 165.3, 23.46),
    vector4(-1467.49, 874.01, 183.59, 298.45),
    vector4(-856.71, 874.26, 202.85, 205.3),
    vector4(950.58, -128.49, 74.42, 205.3),
    vector4(1152.71, -328.43, 69.21, 205.3),
	vector4(112.66, -1955.67, 20.75, 37.94),
	vector4(-544.4, -1684.8, 19.89, 252.07),
	vector4(-1185.02, -1805.4, 3.91, 184.83),
	vector4(-1641.4, -981.99, 7.58, 35.38),
	vector4(-1827.93, 782.36, 138.29, 219.99),
	vector4(-320.84, 2818.73, 59.45, 337.22),
	vector4(474.88, 2609.56, 44.48, 357.0),
}

Config.OxyRandItems = { -- random items you get for completing the mission
"oxy",
"vic5",
"perc5",
}
Config.PoliceAlertOxy = 90 -- This is a % out of 100 to alert police
	------------------------ Drug Picking locations.
Config.CocaPlant = {
    [1] = {
        location = vector3(5398.95, -5197.21, 31.35),
        heading = 271.58,
        model = "prop_plant_01a"
    },
    [2] = {
        location = vector3(5402.19, -5199.67, 31.72),
        heading = 187.92,
        model = "prop_plant_01a"
    },
    [3] = {
        location = vector3(5406.02, -5202.56, 32.13),
        heading = 14.47,
        model = "prop_plant_01a"
    },
    [4] = {
        location = vector3(5409.04, -5204.83, 32.4),
        heading = 326.12,
        model = "prop_plant_01a"
    },
    [5] = {
        location = vector3(5412.07, -5207.1, 32.69),
        heading = 114.27,
        model = "prop_plant_01a"
    },
    [6] = {
        location = vector3(5415.81, -5210.06, 33.08),
        heading = 84.66,
        model = "prop_plant_01a"
    },
    [7] = {
        location = vector3(5418.71, -5212.28, 33.41),
        heading = 205.01,
        model = "prop_plant_01a"
    },
    [8] = {
        location = vector3(5422.31, -5214.82, 33.75),
        heading = 46.39,
        model = "prop_plant_01a"
    },
    [9] = {
        location = vector3(5426.05, -5217.4, 34.16),
        heading = 300.17,
        model = "prop_plant_01a"
    },
	[11] = {
		location = vector3(5422.2, -5217.5, 33.86),
		heading = 126.31,
		model = "prop_plant_01a"
	},
	[12] = {
		location = vector3(5419.15, -5215.07, 33.62),
		heading = 257.88,
		model = "prop_plant_01a"
	},
	[13] = {
		location = vector3(5416.78, -5213.22, 33.41),
		heading = 320.17,
		model = "prop_plant_01a"
	},
	[14] = {
		location = vector3(5414.13, -5211.04, 33.13),
		heading = 152.52,
		model = "prop_plant_01a"
	},
	[15] = {
		location = vector3(5412.04, -5209.56, 32.95),
		heading = 95.78,
		model = "prop_plant_01a"
	},
	[16] = {
		location = vector3(5409.11, -5207.26, 32.67),
		heading = 273.92,
		model = "prop_plant_01a"
	},
	[17] = {
		location = vector3(5406.7, -5205.36, 32.42),
		heading = 67.13,
		model = "prop_plant_01a"
	},
	[18] = {
		location = vector3(5404.35, -5203.63, 32.19),
		heading = 193.25,
		model = "prop_plant_01a"
	},
	[19] = {
		location = vector3(5402.01, -5201.91, 31.93),
		heading = 331.47,
		model = "prop_plant_01a"
	},
    [20] = {
		location = vector3(5399.18, -5199.83, 31.58),
		heading = 222.81,
		model = "prop_plant_01a"
	},
	[21] = {
		location = vector3(5396.83, -5201.03, 31.49),
		heading = 301.42,
		model = "prop_plant_01a"
	},
	[22] = {
		location = vector3(5399.36, -5202.85, 31.83),
		heading = 71.25,
		model = "prop_plant_01a"
	},
	[23] = {
		location = vector3(5401.96, -5204.92, 32.16),
		heading = 180.93,
		model = "prop_plant_01a"
	},
	[24] = {
		location = vector3(5404.0, -5206.71, 32.4),
		heading = 127.66,
		model = "prop_plant_01a"
	},
	[25] = {
		location = vector3(5406.09, -5207.95, 32.62),
		heading = 264.17,
		model = "prop_plant_01a"
	},
	[26] = {
		location = vector3(5408.74, -5209.92, 32.89),
		heading = 45.12,
		model = "prop_plant_01a"
	},
	[27] = {
		location = vector3(5411.26, -5211.6, 33.08),
		heading = 174.34,
		model = "prop_plant_01a"
	},
	[28] = {
		location = vector3(5413.8, -5214.03, 33.34),
		heading = 312.55,
		model = "prop_plant_01a"
	},
	[29] = {
		location = vector3(5416.49, -5216.23, 33.53),
		heading = 93.77,
		model = "prop_plant_01a"
	},
	[30] = {
		location = vector3(5419.16, -5218.23, 33.7),
		heading = 173.99,
		model = "prop_plant_01a"
	},
	[31] = {
		location = vector3(5422.06, -5220.21, 33.97),
		heading = 292.81,
		model = "prop_plant_01a"
	},
	[32] = {
		location = vector3(5422.49, -5223.36, 34.13),
		heading = 89.72,
		model = "prop_plant_01a"
	},
	[33] = {
		location = vector3(5419.98, -5221.4, 33.84),
		heading = 213.05,
		model = "prop_plant_01a"
	},
	[34] = {
		location = vector3(5416.8, -5219.24, 33.65),
		heading = 38.94,
		model = "prop_plant_01a"
	},
	[35] = {
		location = vector3(5414.75, -5217.58, 33.52),
		heading = 128.19,
		model = "prop_plant_01a"
	},
	[36] = {
		location = vector3(5413.03, -5216.14, 33.42),
		heading = 317.64,
		model = "prop_plant_01a"
	},
	[37] = {
		location = vector3(5411.36, -5214.91, 33.32),
		heading = 267.16,
		model = "prop_plant_01a"
	},
	[38] = {
		location = vector3(5409.08, -5213.13, 33.14),
		heading = 83.08,
		model = "prop_plant_01a"
	},
	[39] = {
		location = vector3(5406.84, -5211.64, 32.96),
		heading = 181.92,
		model = "prop_plant_01a"
	},
	[40] = {
		location = vector3(5404.62, -5209.84, 32.71),
		heading = 175.77,
		model = "prop_plant_01a"
	},
	[41] = {
		location = vector3(5402.81, -5208.42, 32.51),
		heading = 289.25,
		model = "prop_plant_01a"
	},
	[42] = {
		location = vector3(5400.18, -5206.48, 32.18),
		heading = 86.41,
		model = "prop_plant_01a"
	},
	[43] = {
		location = vector3(5396.68, -5203.84, 31.68),
		heading = 206.03,
		model = "prop_plant_01a"
	},
	[44] = {
		location = vector3(5394.9, -5202.45, 31.4),
		heading = 45.79,
		model = "prop_plant_01a"
	},
	[45] = {
		location = vector3(5393.51, -5204.59, 31.46),
		heading = 135.92,
		model = "prop_plant_01a"
	},
	[46] = {
		location = vector3(5395.64, -5206.24, 31.78),
		heading = 322.64,
		model = "prop_plant_01a"
	},
	[47] = {
		location = vector3(5397.98, -5207.84, 32.12),
		heading = 245.21,
		model = "prop_plant_01a"
	},
	[48] = {
		location = vector3(5399.6, -5209.02, 32.36),
		heading = 73.16,
		model = "prop_plant_01a"
	},
	[49] = {
		location = vector3(5401.36, -5210.44, 32.6),
		heading = 159.97,
		model = "prop_plant_01a"
	},
	[50] = {
		location = vector3(5403.45, -5212.08, 32.82),
		heading = 124.55,
		model = "prop_plant_01a"
	},
	[51] = {
		location = vector3(5405.2, -5213.38, 33.01),
		heading = 243.12,
		model = "prop_plant_01a"
	},
	[52] = {
		location = vector3(5407.37, -5214.99, 33.19),
		heading = 22.46,
		model = "prop_plant_01a"
	},
	[53] = {
		location = vector3(5409.48, -5216.71, 33.36),
		heading = 185.93,
		model = "prop_plant_01a"
	},
	[54] = {
		location = vector3(5411.66, -5218.31, 33.48),
		heading = 306.72,
		model = "prop_plant_01a"
	},
	[55] = {
		location = vector3(5414.01, -5220.03, 33.61),
		heading = 59.01,
		model = "prop_plant_01a"
	},
	[56] = {
		location = vector3(5416.14, -5221.72, 33.74),
		heading = 160.27,
		model = "prop_plant_01a"
	},
	[57] = {
		location = vector3(5418.42, -5223.39, 33.9),
		heading = 252.64,
		model = "prop_plant_01a"
	},
	[58] = {
		location = vector3(5420.73, -5225.12, 34.17),
		heading = 82.95,
		model = "prop_plant_01a"
	},
	[59] = {
		location = vector3(5419.54, -5226.96, 34.24),
		heading = 178.83,
		model = "prop_plant_01a"
	},
	[60] = {
		location = vector3(5417.25, -5225.26, 34.04),
		heading = 269.32,
		model = "prop_plant_01a"
	},
	[61] = {
		location = vector3(5414.81, -5223.44, 33.81),
		heading = 23.46,
		model = "prop_plant_01a"
	},
	[62] = {
		location = vector3(5412.65, -5221.84, 33.6),
		heading = 129.27,
		model = "prop_plant_01a"
	},
	[63] = {
		location = vector3(5410.52, -5220.24, 33.52),
		heading = 183.89,
		model = "prop_plant_01a"
	},
	[64] = {
		location = vector3(5408.24, -5218.44, 33.45),
		heading = 250.11,
		model = "prop_plant_01a"
	},
	[65] = {
		location = vector3(5405.97, -5216.63, 33.26),
		heading = 310.45,
		model = "prop_plant_01a"
	},
	[66] = {
		location = vector3(5403.98, -5215.18, 33.1),
		heading = 43.77,
		model = "prop_plant_01a"
	},
	[67] = {
		location = vector3(5401.67, -5213.41, 32.87),
		heading = 123.64,
		model = "prop_plant_01a"
	},
	[68] = {
		location = vector3(5399.63, -5211.94, 32.68),
		heading = 202.81,
		model = "prop_plant_01a"
	},
	[69] = {
		location = vector3(5397.23, -5209.98, 32.22),
		heading = 26.59,
		model = "prop_plant_01a"
	},
	[70] = {
		location = vector3(5395.07, -5208.4, 31.82),
		heading = 134.29,
		model = "prop_plant_01a"
	},
	[71] = {
		location = vector3(5392.24, -5206.35, 31.41),
		heading = 206.56,
		model = "prop_plant_01a"
	},
}


Config.PoppyPlants = {
    [1] = {
        location = vector3(-2251.3, -99.18, 100.11),
        heading = 334.49,
        model = "prop_plant_01b"
    },
    [2] = {
        location = vector3(-2249.63, -92.97, 101.8),
        heading = 329.56,
        model = "prop_plant_01b"
    },
    [3] = {
        location = vector3(-2245.57, -85.12, 104.5),
        heading = 25.16,
        model = "prop_plant_01b"
    },
    [4] = {
        location = vector3(-2240.81, -88.48, 105.88),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	[5] = {
        location = vector3(-2240.87, -93.36, 103.88),
        heading = 334.49,
        model = "prop_plant_01b"
    },
    [6] = {
        location = vector3(-2236.0, -95.34, 102.55),
        heading = 329.56,
        model = "prop_plant_01b"
    },
    [7] = {
        location = vector3(-2240.6, -100.01, 100.49),
        heading = 25.16,
        model = "prop_plant_01b"
    },
    [8] = {
        location = vector3(-2246.29, -104.92, 99.27),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	[9] = {
        location = vector3(-2243.64, -107.99, 96.71),
        heading = 334.49,
        model = "prop_plant_01b"
    },
    [10] = {
        location = vector3(-2254.22, -108.76, 97.25),
        heading = 329.56,
        model = "prop_plant_01b"
    },
    [11] = {
        location = vector3(-2247.33, -108.92, 97.70),
        heading = 25.16,
        model = "prop_plant_01b"
    },
    [12] = {
        location = vector3(-2250.96, -111.22, 97.50),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [13] = {
        location = vector3(-2740.75, 245.69, 123.96),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [14] = {
        location = vector3(-2742.85, 258.86, 125.67),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [15] = {
        location = vector3(-2734.38, 256.69, 131.12),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [16] = {
        location = vector3(-2728.65, 249.71, 128.73),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [17] = {
        location = vector3(-2727.64, 239.95, 122.81),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [18] = {
        location = vector3(-2733.73, 234.15, 119.36),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [19] = {
        location = vector3(-2740.97, 229.56, 115.98),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [20] = {
        location = vector3(-2749.9, 222.58, 109.44),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [21] = {
        location = vector3(-2758.92, 227.17, 106.40),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [22] = {
        location = vector3(-2763.76, 230.35, 103.60),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [23] = {
        location = vector3(-2752.92, 216.38, 104.72),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [24] = {
        location = vector3(-2742.69, 217.69, 107.78),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [25] = {
        location = vector3(-3082.9, 963.85, 46.40),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [26] = {
        location = vector3(-3075.56, 956.16, 48.10),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [27] = {
        location = vector3(-3071.9, 963.88, 51.58),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [28] = {
        location = vector3(-3065.3, 970.46, 54.97),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [29] = {
        location = vector3(-3064.27, 960.01, 55.57),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [30] = {
        location = vector3(-3052.19, 953.83, 59.90),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [31] = {
        location = vector3(-3047.98, 976.33, 61.40),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [32] = {
        location = vector3(-3057.56, 979.78, 56.80),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [33] = {
        location = vector3(-3044.55, 974.81, 62.75),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [34] = {
        location = vector3(-3038.61, 970.22, 64.72),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [35] = {
        location = vector3(-3032.95, 968.35, 67.04),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [36] = {
        location = vector3(-3046.9, 955.85, 61.64),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [37] = {
        location = vector3(-3056.83, 957.03, 57.60),
        heading = 21.52,
        model = "prop_plant_01b"
    },
	 [38] = {
        location = vector3(-3062.9, 954.07, 54.98),
        heading = 21.52,
        model = "prop_plant_01b"
    },

}

Config.shrooms = {
    [1] = {
        location = vector3(2185.14, 5183.81, 57.48),
        heading = 334.49,
        model = "prop_stoneshroom1"
    },
    [2] = {
        location = vector3(2174.45, 5187.85, 57.43),
        heading = 329.56,
        model = "prop_stoneshroom1"
    },
    [3] = {
        location = vector3(2166.22, 5196.56, 58.0),
        heading = 25.16,
        model = "prop_stoneshroom1"
    },
    [4] = {
        location = vector3(2166.82, 5204.83, 58.63),
        heading = 21.52,
        model = "prop_stoneshroom1"
    },
	[5] = {
        location = vector3(2174.84, 5205.82, 59.19),
        heading = 334.49,
        model = "prop_stoneshroom1"
    },
    [6] = {
        location = vector3(2184.46, 5201.23, 59.2),
        heading = 329.56,
        model = "prop_stoneshroom1"
    },
    [7] = {
        location = vector3(2192.45, 5194.89, 58.86),
        heading = 25.16,
        model = "prop_stoneshroom1"
    },
    [8] = {
        location = vector3(2207.53, 5187.81, 58.95),
        heading = 21.52,
        model = "prop_stoneshroom1"
    },
	[9] = {
        location = vector3(2213.46, 5191.11, 59.81),
        heading = 334.49,
        model = "prop_stoneshroom1"
    },
    [10] = {
        location = vector3(2218.31, 5180.0, 58.18),
        heading = 329.56,
        model = "prop_stoneshroom1"
    },
    [11] = {
        location = vector3(2212.75, 5172.35, 57.2),
        heading = 25.16,
        model = "prop_stoneshroom1"
    },
    [12] = {
        location = vector3(2208.56, 5167.06, 56.34),
        heading = 21.52,
        model = "prop_stoneshroom1"
    },
	 [13] = {
        location = vector3(2196.9, 5158.59, 54.84),
        heading = 21.52,
        model = "prop_stoneshroom1"
    },

    [14] = {
        location = vector3(2191.62, 5174.91, 56.68),
        heading = 21.52,
        model = "prop_stoneshroom1"
    },
    [15] = {
        location = vector3(2190.18, 5182.54, 57.47),
        heading = 21.52,
        model = "prop_stoneshroom1"
    },
    [16] = {
        location = vector3(2185.85, 5190.49, 58.1),
        heading = 21.52,
        model = "prop_stoneshroom1"
    },
    [17] = {
        location = vector3(2179.95, 5194.19, 58.26),
        heading = 21.52,
        model = "prop_stoneshroom1"
    },


}

Config.WeedPlant = {
    [1] = {
        location = vector3(1049.63, -3202.12, -39.15),
        heading = 334.49,
        model = "bkr_prop_weed_lrg_01b"
    },
    [2] = {
        location = vector3(1050.85, -3202.15, -39.15),
        heading = 329.56,
        model = "bkr_prop_weed_lrg_01b"
    },
    [3] = {
        location = vector3(1052.01, -3202.22, -39.13),
        heading = 25.16,
        model = "bkr_prop_weed_lrg_01b"
    },
    [4] = {
        location = vector3(1052.99, -3202.15, -39.15),
        heading = 21.52,
        model = "bkr_prop_weed_lrg_01b"
    },
    [5] = {
        location = vector3(1053.08, -3201.11, -39.13),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [6] = {
        location = vector3(1052.91, -3199.99, -39.14),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [7] = {
        location = vector3(1053.02, -3198.97, -39.11),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [8] = {
        location = vector3(1051.95, -3198.93, -39.11),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [9] = {
        location = vector3(1051.96, -3199.86, -39.12),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [10] = {
        location = vector3(1051.93, -3201.17, -39.12),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [11] = {
        location = vector3(1050.98, -3201.13, -39.14),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [12] = {
        location = vector3(1050.89, -3200.07, -39.12),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [13] = {
        location = vector3(1050.89, -3198.95, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [14] = {
        location = vector3(1049.72, -3198.95, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
	[15] = {
        location = vector3(1049.98, -3200.1, -39.14),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
	[16] = {
        location = vector3(1049.82, -3201.01, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
	[17] = {
        location = vector3(1053.07, -3194.51, -39.15),
        heading = 334.49,
        model = "bkr_prop_weed_lrg_01b"
    },
    [18] = {
        location = vector3(1052.97, -3195.55, -39.15),
        heading = 329.56,
        model = "bkr_prop_weed_lrg_01b"
    },
    [19] = {
        location = vector3(1052.82, -3196.58, -39.15),
        heading = 25.16,
        model = "bkr_prop_weed_lrg_01b"
    },
    [20] = {
        location = vector3(1052.94, -3197.59, -39.15),
        heading = 21.52,
        model = "bkr_prop_weed_lrg_01b"
    },
    [21] = {
        location = vector3(1051.92, -3197.54, -39.14),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [22] = {
        location = vector3(1051.88, -3196.61, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [23] = {
        location = vector3(1051.82, -3195.52, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [24] = {
        location = vector3(1051.95, -3194.38, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [25] = {
        location = vector3(1050.88, -3194.31, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [26] = {
        location = vector3(1050.78, -3195.29, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [27] = {
        location = vector3(1050.76, -3196.49, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [28] = {
        location = vector3(1050.77, -3197.62, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [29] = {
        location = vector3(1049.64, -3197.61, -39.14),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
    [30] = {
        location = vector3(1049.64, -3196.59, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
	[31] = {
        location = vector3(1049.62, -3195.51, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
	[32] = {
        location = vector3(1049.66, -3194.36, -39.15),
        heading = 202.97,
        model = "bkr_prop_weed_lrg_01b"
    },
}


Config.Mescaline = {
    [1] = {
        location = vector3(2598.73, 4207.89, 41.02),
        heading = 334.49,
        model = "prop_cactus_03"
    },
    [2] = {
        location = vector3(2601.46, 4199.34, 40.62),
        heading = 329.56,
        model = "prop_cactus_03"
    },
    [3] = {
        location = vector3(2611.63, 4194.18, 41.18),
        heading = 25.16,
        model = "prop_cactus_03"
    },
    [4] = {
        location = vector3(2620.18, 4202.69, 41.5),
        heading = 21.52,
        model = "prop_cactus_03"
    },
	[5] = {
        location = vector3(2624.26, 4211.75, 42.34),
        heading = 334.49,
        model = "prop_cactus_03"
    },
    [6] = {
        location = vector3(2635.21, 4207.5, 42.49),
        heading = 329.56,
        model = "prop_cactus_03"
    },
    [7] = {
        location = vector3(2644.97, 4193.51, 42.11),
        heading = 25.16,
        model = "prop_cactus_03"
    },
    [8] = {
        location = vector3(2654.21, 4195.31, 41.23),
        heading = 21.52,
        model = "prop_cactus_03"
    },
	[9] = {
        location = vector3(2653.32, 4206.49, 41.62),
        heading = 334.49,
        model = "prop_cactus_03"
    },
    [10] = {
        location = vector3(2647.45, 4213.94, 42.49),
        heading = 329.56,
        model = "prop_cactus_03"
    },
    [11] = {
        location = vector3(2636.3, 4218.49, 43.03),
        heading = 25.16,
        model = "prop_cactus_03"
    },
    [12] = {
        location = vector3(2627.37, 4223.2, 42.88),
        heading = 21.52,
        model = "prop_cactus_03"
    },
	 [13] = {
        location = vector3(2617.86, 4230.38, 42.63),
        heading = 21.52,
        model = "prop_cactus_03"
    },

    [14] = {
        location = vector3(2609.8, 4222.12, 41.19),
        heading = 21.52,
        model = "prop_cactus_03"
    },
    [15] = {
        location = vector3(2602.96, 4194.05, 41.01),
        heading = 21.52,
        model = "prop_cactus_03"
    },
    [16] = {
        location = vector3(2614.39, 4188.3, 41.68),
        heading = 21.52,
        model = "prop_cactus_03"
    },
    [17] = {
        location = vector3(2623.82, 4189.97, 41.44),
        heading = 21.52,
        model = "prop_cactus_03"
    },


}
---------------------- even though there is a comment out section since this feature was released i get constant questions about it. so ill make a note. if you ask for support saying these peds arent spawning ill delete your ticket.
---------------------- This only happens if the wholesale is a setup. They will spawn and shoot you. THEY ONLY SPAWN IF ITS A SETUP
Config.Cokepeds = { ------------- this is where the setup peds will spawn to kill you
	vector3(640.24, 644.18, 129.09),
	vector3(642.64, 649.71, 128.91),
	vector3(646.47, 650.65, 128.91),
	vector3(652.8, 649.88, 128.95),
	vector3(656.87, 631.85, 128.91),
	vector3(649.96, 620.57, 128.91),
}

Config.CrackPeds = { ------------- this is where the setup peds will spawn to kill you
	vector3(1873.25, 299.28, 164.27),
	vector3(1891.37, 292.12, 163.68),
	vector3(1886.68, 274.1, 162.96),
	vector3(1869.67, 265.97, 163.72),
	vector3(1836.88, 251.09, 162.56),
	vector3(1853.3, 230.64, 162.09),
}

Config.heroinPeds = { ------------- this is where the setup peds will spawn to kill you
	vector3(2740.93, 1389.09, 24.5),
	vector3(2713.38, 1392.31, 24.54),
	vector3(2703.66, 1355.09, 24.52),
	vector3(2680.34, 1363.39, 24.52),
	vector3(2766.1, 1388.15, 24.52),
	vector3(2764.76, 1364.16, 24.52),
}

Config.lsdPeds = { ------------- this is where the setup peds will spawn to kill you
	vector3(-1564.49, 838.85, 184.18),
	vector3(-1545.33, 863.67, 181.44),
	vector3(-1542.18, 802.71, 184.24),
	vector3(-1524.31, 820.44, 181.79),
}

-----------  deliveries (domo)


	Debug = false -- true / false - Currently prints the vector3 and label of locations when requesting a delivery
    Config.NearbyDeliveries = false -- true / false - Do you want deliveries to be within a certain amount of units?
    DeliveryWithin = 2000 -- int (Default 2000) - How many units do you want the delivery location to be within from the player when making a delivery request?
	Config.Dealers = {
		-- ["Dealer1"] = {
		-- 	name = "Biggie",  -- Add the name here
		-- 	coords = {x = 329.04, y = -198.93, z = 54.23}, -- example coord
		-- 	heading = 331.52, -- example heading
		-- 	time = {min = 6, max = 18}, -- active from 6am to 6pm
		-- 	products = {
		-- 		[1] = {name = "heroin", price = 15, amount = 150, info = {}, type = "item", slot = 1, minrep = 0},}
		-- },
	}

    --UseTarget =  GetConvar('UseTarget', 'false') == 'true', -- Use qb-target interactions (don't change this, go to your server.cfg and add setr UseTarget true)
    Config.PoliceCallChance = 99 --in percentage (if 99, theres the 99% to call the police)

    -- Shop Config
Config.Products = {
        [1] = {name = "weed_whitewidow_seed", price = 15, amount = 150, info = {}, type = "item", slot = 1, minrep = 0},
        [2] = {name = "weed_skunk_seed", price = 15, amount = 150, info = {}, type = "item", slot = 2, minrep = 0},
        [3] = {name = "weed_purplehaze_seed", price = 15, amount = 150, info = {}, type = "item", slot = 3, minrep = 0},
		[4] = {name = "weed_ogkush_seed", price = 15, amount = 150, info = {}, type = "item", slot = 4, minrep = 0},
		[5] = {name = "weed_amnesia_seed", price = 15, amount = 150, info = {}, type = "item", slot = 5, minrep = 0},
        [6] = {name = "cokeburner", price = 100, amount = 3, info = {}, type = "item", slot = 6, minrep = 30},
        [7] = {name = "crackburner", price = 100, amount = 3, info = {}, type = "item", slot = 7, minrep = 50},
        [8] = {name = "heroinburner", price = 100, amount = 3, info = {}, type = "item", slot = 8, minrep = 40},

}

Config.UseMarkedBills = true -- true for marked bills, false for cash
Config.DeliveryRepGain = 1 -- amount of rep gained per delivery
Config.DeliveryRepLoss = 1 -- amount of rep lost if delivery wrong or late
Config.PoliceDeliveryModifier = 2 -- amount to multiply active cop count by
Config.WrongAmountFee = 2 -- divide the payout by this value for wrong delivery amount
Config.OverdueDeliveryFee = 4 -- divide the payout by this value for overdue delivery

Config.DeliveryItems = {
   [1] = {
       ["item"] = "dealercase",
       ["minrep"] = 15,
       ['payout'] = 500
   },
   [2] = {
        ["item"] = "weed_whitewidow",
        ["minrep"] = 0,
        ['payout'] = 200
    },
    [3] = {
        ["item"] = "weed_skunk",
        ["minrep"] = 0,
        ['payout'] = 150
    },
    [4] = {
        ["item"] = "weed_ogkush",
        ["minrep"] = 0,
        ['payout'] = 175
    },
}

Config.DeliveryLocations = {
        [1] = {
            ["label"] = "Stripclub",
            ["coords"] = vector3(106.24, -1280.32, 29.24),
        },
        [2] = {
            ["label"] = "Vinewood Video",
            ["coords"] = vector3(223.98, 121.53, 102.76),
        },
        [3] = {
            ["label"] = "Taxi",
            ["coords"] = vector3(882.67, -160.26, 77.11),
        },
        [4] = {
            ["label"] = "Resort",
            ["coords"] = vector3(-1245.63, 376.21, 75.34),
        },
        [5] = {
            ["label"] = "Bahama Mamas",
            ["coords"] = vector3(-1383.1, -639.99, 28.67),
        },
 }


