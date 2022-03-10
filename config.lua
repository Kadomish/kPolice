Config                            = {}

-------------------------- POLICE -----------------

Config.Type = 21

Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
    


------------------------------- POSITION --------------------------


Blips = {}

Blips = {
	["Police"] = {
        { Position = vector3(441.84457397461,-983.34600830078,30.689582824707), Sprite = 526, Display = 4, Scale = 0.7, Colour = 38, Name = "~b~Commissariat"},
		{ Position = vector4(459.0092590332,-1017.3430175781, 27.190690994263, 97.01), PedType = "PED_TYPE_CIVMALE", Ped = "s_m_y_cop_01"},
		{ Position = vector4(454.14584350586,-980.03607177734,29.689577102661, 96.67), PedType = "PED_TYPE_CIVMALE", Ped = "s_m_y_cop_01"},
    },
}

Pos = {}

Pos = {
	cam = { 
		{x = 441.29132080078, y = -978.85229492188, z = 30.68959236145},
	},
	bosspolice = { 
        {x = 447.96829223633, y = -973.35992431641, z = 30.689598083496}
    },
    vestiairepolice = { 
        {x = 452.16687011719, y = -993.27777099609, z = 30.689584732056} 
    },  
    rangepolice = { 
        {x = 462.47113037109, y = -1019.4180908203, z = 28.102695465088} -- Suppression pos
    },
    garagepolice = { 
        { x = 458.35473632813, y = -1017.4713134766, z = 28.229591369629} -- Point pour sortir le vehicule
    },
    armuerie = { 
        { x = 452.37164306641, y = -979.90026855469, z = 30.689584732056}
    },
}
