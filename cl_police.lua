ESX = nil



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    PlayerLoaded = true
    ESX.PlayerData = ESX.GetPlayerData()
end)

local societypolicemoney = nil 



---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- POLICE ---------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



-----------------------------  Vestiaire


local vestiairepolice = {
Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Vestiaire" },
Data = { currentMenu = "Tenue :", ""},
Events = {
onSelected = function(self, _, btn, PMenu, menuData, result)
 
    if btn.name == "~b~Tenue~w~ Civil" then   
        ExecuteCommand("e adjusttie")
        Citizen.Wait(5000)
        TenueCivil()
    elseif btn.name == "~b~Tenue~w~ Cadet" and ESX.PlayerData.job.grade_name == 'recruit' then
        ExecuteCommand("e adjusttie")
        Citizen.Wait(5000)
        TenueCadet()
    elseif btn.name == "~b~Tenue~w~ Officier" and ESX.PlayerData.job.grade_name == 'officer' then
        ExecuteCommand("e adjusttie")
        Citizen.Wait(5000)
        TenueOfficier()
    elseif btn.name == "~b~Tenue~w~ Sergent" and ESX.PlayerData.job.grade_name == 'sergeant' then
        ExecuteCommand("e adjusttie")
        Citizen.Wait(5000)
        TenueSergent()

    elseif btn.name == "~b~Tenue~w~ Lieutenant" and ESX.PlayerData.job.grade_name == 'lieutenant' then
        ExecuteCommand("e adjusttie")
        Citizen.Wait(5000)
        TenueLieutenant()


    elseif btn.name == "~b~Tenue~w~ Commandant" and ESX.PlayerData.job.grade_name == 'boss' then
        ExecuteCommand("e adjusttie")
        Citizen.Wait(5000)
        TenueCommandant()

    elseif btn.name == "~y~Gilet Jaune " and ESX.PlayerData.job.grade_name == 'recruit' then
        ExecuteCommand("e adjusttie")
        Citizen.Wait(5000)
        SetPedArmour(PlayerPedId(), 25)
        GiletCadet()

    elseif btn.name == "~b~Gilet Par Balle" and ESX.PlayerData.job.grade_name == 'officer' then
        ExecuteCommand("e adjusttie")
        Citizen.Wait(5000)
        SetPedArmour(PlayerPedId(), 50)
        GiletOfficier()
    else
        ESX.ShowNotification('Vous n\'avez pas le grade necessaire !' )

    end 
end,
},
Menu = {
["Tenue :"] = {
    b = {
        {name = "~b~Tenue~w~ Civil", Description = 'Pour ~b~Mettre~w~ sa tenue de ~b~Civil', ask = '~b~>', askX = true},
        {name = "~b~Tenue~w~ Cadet", Description = 'Pour ~b~Mettre~w~ sa tenue de ~b~Cadet', ask = '~b~>', askX = true},
        {name = "~b~Tenue~w~ Officier", Description = 'Pour ~b~Mettre~w~ sa tenue de ~b~Officier', ask = '~b~>', askX = true},
        {name = "~b~Tenue~w~ Sergent", Description = 'Pour ~b~Mettre~w~ sa tenue de ~b~Sergent', ask = '~b~>', askX = true},
        {name = "~b~Tenue~w~ Lieutenant", Description = 'Pour ~b~Mettre~w~ sa tenue de ~b~Lieutenant', ask = '~b~>', askX = true},
        {name = "~b~Tenue~w~ Commandant", Description = 'Pour ~b~Mettre~w~ sa tenue de ~b~Commandant', ask = '~b~>', askX = true},
        {name = "------------------------------------------------------------------", ask = '', askX = true},
        {name = "~y~Gilet Jaune", Description = 'Pour ~y~Mettre~w~ un Gilet ~y~Jaune', ask = '~b~>', askX = true},
        {name = "~b~Gilet Par Balle", Description = 'Pour ~b~Mettre~w~ un ~b~Gilet par Balle', ask = '~b~>', askX = true},
    }
}
}
}




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(Pos.vestiairepolice) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x,v.y,v.z ) <= 2 and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
                DrawMarker(6, v.x, v.y, v.z-0.99, nil, nil, nil, -90, nil, nil, 1.0, 1.0, 1.0, 0, 102, 0, 200)
                DrawText3D(v.x,v.y,v.z, "~h~~w~Appuyez sur ~g~E ~w~pour se ~g~Changer")
                if IsControlJustPressed(1,38) then 
                   CreateMenu(vestiairepolice)
                end
            end
        end
    end
end)

-------------------------------------- GARAGE 


local garagepolice = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Garage LSPD" },
    Data = { currentMenu = "Discussion", ""},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)
            if btn.name == "Cruiser | Cadet" and ESX.PlayerData.job.grade_name == 'recruit' and ESX.PlayerData.job.grade_name == 'officer' and ESX.PlayerData.job.grade_name == 'sergeant' and ESX.PlayerData.job.grade_name == 'lieutenant' and ESX.PlayerData.job.grade_name == 'boss' then  
                spawnCarPol("police")
            elseif btn.name == "Buffalo | Officier" and ESX.PlayerData.job.grade_name == 'officer' and ESX.PlayerData.job.grade_name == 'sergeant' and ESX.PlayerData.job.grade_name == 'lieutenant' and ESX.PlayerData.job.grade_name == 'boss' then 
                spawnCarPol("police2")
            elseif btn.name == "Cruiser | Sergent" and ESX.PlayerData.job.grade_name == 'sergeant' and ESX.PlayerData.job.grade_name == 'lieutenant' and ESX.PlayerData.job.grade_name == 'boss' then
                spawnCarPol("police3")
            elseif btn.name == "Ford Interceprtor - Lieutenant" and ESX.PlayerData.job.grade_name == 'lieutenant' and ESX.PlayerData.job.grade_name == 'boss' then 
                spawnCarPol("police3")
            elseif btn.name == "VIR - Commandant" and ESX.PlayerData.job.grade_name == 'boss' then 
                spawnCarPol("policefug") 
            elseif btn.name == "Felon - Banalisé" and ESX.PlayerData.job.grade_name == 'sergeant' and ESX.PlayerData.job.grade_name == 'lieutenant' and ESX.PlayerData.job.grade_name == 'boss' then 
                spawnCarPol("policefelon") 
            elseif btn.name == "Buffalo - Banalisé" and ESX.PlayerData.job.grade_name == 'sergeant' and ESX.PlayerData.job.grade_name == 'lieutenant' and ESX.PlayerData.job.grade_name == 'boss' then 
                spawnCarPol("fbi") 
            elseif btn.name == "Granger - Banalisé" and ESX.PlayerData.job.grade_name == 'sergeant' and ESX.PlayerData.job.grade_name == 'lieutenant' and ESX.PlayerData.job.grade_name == 'boss' then 
                spawnCarPol("fbi2") 
            elseif btn.name == "Bonjour, Je souhaite voir le garage !" then
                DrawSub('Voici le garage faites votre choix !', 2000)
                Citizen.Wait(2000)
                OpenMenu('Garage') 
            elseif btn.name == "Bonjour, Je souhaite vous parler !" then 
                DrawSub('Je n\'ai pas le temps de vous parlez, Aurevoir !', 2000)
                CloseMenu()
            else
                ESX.ShowNotification('Vous n\'avez pas le grade necessaire !' )
            end 
    end,
},
    Menu = {
        ["Garage"] = {
                b = {
                    {name = "Cruiser | Cadet", ask = '', askX = true},
                    {name = "Buffalo - Officier", ask = '', askX = true},
                    {name = "Cruiser - Sergent", ask = '', askX = true},
                    {name = "Ford Interceprtor - Lieutenant", ask = '', askX = true},
                    {name = "VIR - Commandant", ask = '', askX = true},
                    {name = "Riot - Unité Lourd", ask = '', askX = true},
                    {name = "------------------------------------------------------------------", ask = '', askX = true},
                    {name = "Felon - Banalisé", ask = '', askX = true},
                    {name = "Buffalo - Banalisé", ask = '', askX = true},
                    {name = "Granger - Banalisé", ask = '', askX = true},
                    {name = "Cruiser - Banalisé", ask = '', askX = true},
            }
        },
        ["Discussion"] = {
            b = {
                {name = "Bonjour, Je souhaite voir le garage !", ask = '', askX = true},
                {name = "Bonjour, Je souhaite vous parler !", ask = '', askX = true},
            }
        }
    }
} 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(Pos.garagepolice) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x,v.y,v.z ) <= 2 and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
                DrawText3D(459.0092590332,-1017.3430175781, 29.190690994263,"Parler à ~r~Jack")
                if IsControlJustPressed(1,38) then	
                    DrawSub("Bonjour, Que voulez vous ~b~Agent~w~ ?", 2000)
                    Citizen.Wait(2000)	
                   CreateMenu(garagepolice)
                end
            end
        end
    end
end)



-----------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(Pos.rangepolice) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x,v.y,v.z ) <= 3.5 and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
                DrawMarker(6, v.x, v.y, v.z-0.99, nil, nil, nil, -90, nil, nil, 1.0, 1.0, 1.0, 0, 102, 0, 200)
                DrawText3D(v.x,v.y,v.z, "Appuyez sur ~g~E ~w~pour ranger votre ~g~Véhicule")
                if IsControlJustPressed(1,38) then 
                    RangerVeh('sultan')
                end                
            end
        end
    end
end)


--------------------- ACTION PATRON

local bosspolice = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Action Commandant" },
    Data = { currentMenu = "Action", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)
                if btn.name == "Retirer de l'Argent" then
                          local amount = KeyboardInput("Montant", "", 10)
                          amount = tonumber(amount)
                          if amount == nil then
                            ESX.ShowNotification('Montant invalide')
                          else
                              TriggerServerEvent('esx_society:withdrawMoney', 'police', amount)
                              RefreshpoliceMoney('police')	
                          end
                elseif btn.name == "Déposer de l'Argent" then
                          local amount = KeyboardInput("Montant", "", 10)
                          amount = tonumber(amount)
                          if amount == nil then
                            ESX.ShowNotification('Montant invalide')
                          else
                              TriggerServerEvent('esx_society:depositMoney', 'police', amount)
                              RefreshpoliceMoney('police')
                          end
                elseif btn.name == "Recruter" then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            TriggerServerEvent('Ppatron:recruter', "police", false, GetPlayerServerId(closestPlayer))
                         else
                            ESX.ShowNotification('Aucun joueur à proximité')
                        end 
                elseif btn.name == "Promouvoir" then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            TriggerServerEvent('patron:promouvoir', "police", false, GetPlayerServerId(closestPlayer))
                         else
                            ESX.ShowNotification('Aucun joueur à proximité')
                        end 
                elseif btn.name == "Rétrograder" then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            TriggerServerEvent('patron:descendre', "police", false, GetPlayerServerId(closestPlayer))
                         else
                            ESX.ShowNotification('Aucun joueur à proximité')
                         end
                elseif btn.name == "Virer" then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            TriggerServerEvent('patron:virer', "police", false, GetPlayerServerId(closestPlayer))
                         else
                            ESX.ShowNotification('Aucun joueur à proximité')
                        end 			
                    end 
                end,
            },   

Menu = {
["Action"] = {
    b = {
        {name = "Argent société :", ask = '$0' , askX = true,},
        {name = "Retirer de l'Argent", ask = '>>', askX = true},
        {name = "Déposer de l'Argent", ask = '>>', askX = true},
        {name = "Virer", ask = '>>', askX = true},
        {name = "Recruter", ask = '>>', askX = true},
        {name = "Promouvoir", ask = '>>', askX = true},
        {name = "Rétrograder", ask = '>>', askX = true},
    }
}
}
}

Citizen.CreateThread(function()
while true do
    Citizen.Wait(0)
    for k,v in pairs(Pos.bosspolice) do                           
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x,v.y,v.z ) <= 1.5 and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'boss' then
            DrawText3D(446.9455871582,-974.42253417969,31.255392837524, "Utiliser ~y~l'ordianteur")
            if IsControlJustPressed(1,38) then
                RefreshpoliceMoney('police')
                ExecuteCommand('e type')
                CreateMenu(bosspolice)          
                Citizen.Wait(3000)
                ClearPedTasksImmediately(PlayerPedId())                
            end
        end
    end
end
end)

--------------------------------- ARMUERIE 

local armuerie = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Armuerie LSPD" },
    Data = { currentMenu = "Kadomish#5500", ""},
    Events = {
    onSelected = function(self, _, btn, PMenu, menuData, result)
        if btn.name == "Equipement Cadet" and ESX.PlayerData.job.grade_name == 'recruit' then
            TriggerServerEvent('equipementbase')
        elseif btn.name == "Equipement Officier" and ESX.PlayerData.job.grade_name == 'officer' then
             TriggerServerEvent('equipementoff')

        elseif btn.name == "Equipement Sergent" and ESX.PlayerData.job.grade_name == 'sergeant' then
             TriggerServerEvent('equipementserg')

        elseif btn.name == "Equipement Lieutenant" and ESX.PlayerData.job.grade_name == 'lieutenant' then
             TriggerServerEvent('equipementlieu')
      
        elseif btn.name == "Equipement Commandant" and ESX.PlayerData.job.grade_name == 'boss' then
             TriggerServerEvent('equipementboss')
    
        elseif btn.name == "~r~Fermer le Menu~s~" then
            self:CloseMenu()   
        elseif btn.name == "Salut François, Je veux prendre mon équipement !" then
            DrawSub('Parfait ! Je te laisse prendre l\'équipement adéquat à ton grade !', 3000)
            Citizen.Wait(3000)
            OpenMenu('Armuerie') 
        elseif btn.name == "Salut François, Je souhaite savoir où est le garage !" then 
            DrawSub('Il se trouve à l\'extérieur du commisariat à gauche en sortant ! ', 2000)
            CloseMenu()
        else
            ESX.ShowNotification('Vous n\'avez pas le grade necessaire !' )
        end 
    end,

    },

Menu = {
    ["Armuerie"] = {
        b = {
            {name = "Equipement Cadet", ask = '', askX = true},
            {name = "Equipement Officier", ask = '', askX = true},
            {name = "Equipement Sergent", ask = '', askX = true},
            {name = "Equipement Lieutenant", ask = '', askX = true},
            {name = "Equipement Commandant", ask = '', askX = true},
            {name = "~r~Fermer le Menu~s~", ask = '', askX = true}
        }
        },
        ["Kadomish#5500"] = {
            b = {
                {name = "Salut François, Je veux prendre mon équipement !", ask = '', askX = true},
                {name = "Salut François, Je souhaite savoir où est le garage !", ask = '', askX = true},
            }
        }
    }
}
        
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(Pos.armuerie) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x,v.y,v.z ) <= 2 and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
                DrawText3D(454.14584350586,-980.03607177734,31.689577102661, "Parler à ~b~François")
                if IsControlJustPressed(1,38) then 
                    DrawSub('Salut Agent ! Que veux tu faire ?', 2000)
                    Citizen.Wait(2000)
                   CreateMenu(armuerie)
                end
            end
        end
    end
end)





local cam = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Menu Caméra"},
	Data = { currentMenu = "Menu Caméra", "" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local btn = btn.name
			if btn == "Supérettes" then
				OpenMenu('Supérettes')
			elseif btn == "Gang" then
				OpenMenu('Gang')
			elseif btn == "Banques" then
				OpenMenu('Banques')

		elseif btn == "Caméra 1" then
			TriggerEvent('cctv:camera', 1) 
			
		elseif btn == "Caméra 2" then
			TriggerEvent('cctv:camera', 2)
			
		elseif btn == "Caméra 3" then
			TriggerEvent('cctv:camera', 3) 

		elseif btn == "Caméra 4" then
			TriggerEvent('cctv:camera', 4) 
			
		elseif btn == "Caméra 5" then
			TriggerEvent('cctv:camera', 5) 

		elseif btn == "Caméra 6" then
			TriggerEvent('cctv:camera', 6) 
				
		elseif btn == "Caméra 7" then
			TriggerEvent('cctv:camera', 7) 

		elseif btn == "Caméra 8" then
			TriggerEvent('cctv:camera', 8) 
				
		elseif btn == "Caméra 9" then
			TriggerEvent('cctv:camera', 9) 

		elseif btn == "Caméra 10" then
			TriggerEvent('cctv:camera', 10) 
			
		elseif btn == "Caméra 11" then
			TriggerEvent('cctv:camera', 11) 

		elseif btn == "Caméra 12" then
			TriggerEvent('cctv:camera', 12) 

		elseif btn == "Caméra 13" then
			TriggerEvent('cctv:camera', 13) 
			
		elseif btn == "Caméra 14" then
			TriggerEvent('cctv:camera', 14) 

		elseif btn == "Caméra 15" then
			TriggerEvent('cctv:camera', 15) 
			
		elseif btn == "Caméra 16" then
			TriggerEvent('cctv:camera', 16) 

		elseif btn == "Caméra 17" then
			TriggerEvent('cctv:camera', 17) 
			
		elseif btn == "Caméra 18" then
			TriggerEvent('cctv:camera', 18) 

		elseif btn == "Caméra 19" then
			TriggerEvent('cctv:camera', 19) 
			
		elseif btn == "Caméra 20" then
			TriggerEvent('cctv:camera', 20) 

		elseif btn == "Caméra 21" then
			TriggerEvent('cctv:camera', 21) 
			
		elseif btn == "Caméra 22" then
			TriggerEvent('cctv:camera', 22) 

		elseif btn == "Caméra 23" then
			TriggerEvent('cctv:camera', 23) 
			
		elseif btn == "Caméra 24" then
			TriggerEvent('cctv:camera', 24) 

		elseif btn == "Caméra 25" then
			TriggerEvent('cctv:camera', 25) 
			
		elseif btn == "Caméra 26" then
			TriggerEvent('cctv:camera', 26) 

		elseif btn == "Caméra 27" then
			TriggerEvent('cctv:camera', 27) 

		elseif btn == "~r~Fermer le Menu~s~" then
			self:CloseMenu()

		elseif btn == "~r~Retour~s~" then
			self:Back()

		end
	end, 
},

Menu = {
	["Menu Caméra"] = {
		b = {
			{name = "Supérettes", ask = "~b~>", askX = true},
			{name = "Gang", ask = "~b~>", askX = true},
			{name = "Banques", ask = "~b~>", askX = true},
			{name = "~r~Fermer le Menu~s~", ask = "", askX = true}
		}
	},

	["Supérettes"] = {
		b = {
			{name = "Caméra 1",ask = "~b~→", askX = true, Description = 'Superette 1'},
			{name = "Caméra 2",ask = "~b~→", askX = true, Description = 'Superette 2'},
            {name = "Caméra 3",ask = "~b~→", askX = true, Description = 'Superette 3'},
			{name = "Caméra 4",ask = "~b~→", askX = true, Description = 'Superette 4'},
			{name = "Caméra 5",ask = "~b~→", askX = true, Description = 'Superette 5'},
			{name = "Caméra 6",ask = "~b~→", askX = true, Description = 'Superette 6'},
            {name = "Caméra 7",ask = "~b~→", askX = true, Description = 'Superette 7'},
			{name = "Caméra 8",ask = "~b~→", askX = true, Description = 'Superette 8'},
			{name = "Caméra 9",ask = "~b~→", askX = true, Description = 'Superette 9'},
			{name = "Caméra 10",ask = "~b~→", askX = true, Description = 'Superette 10'},
            {name = "Caméra 11",ask = "~b~→", askX = true, Description = 'Superette 11'},
			{name = "Caméra 12",ask = "~b~→", askX = true, Description = 'Superette 12'},
			{name = "Caméra 13",ask = "~b~→", askX = true, Description = 'Superette 13'},
			{name = "Caméra 14",ask = "~b~→", askX = true, Description = 'Superette 14'},
            {name = "Caméra 15",ask = "~b~→", askX = true, Description = 'Superette 15'},
			{name = "Caméra 16",ask = "~b~→", askX = true, Description = 'Superette 16'},
			{name = "Caméra 17",ask = "~b~→", askX = true, Description = 'Superette 17'},
			{name = "Caméra 18",ask = "~b~→", askX = true, Description = 'Superette 18'},
			{name = "~r~Retour~s~",ask = "", askX = true, Description = 'Retour'}
		}
	},
	
	["Gang"] = {
		b = {
			{name = "Caméra 25",ask = "~b~→", askX = true, Description = 'Ballas'},
			{name = "Caméra 26",ask = "~b~→", askX = true, Description = 'Famillies'},
			{name = "Caméra 27",ask = "~b~→", askX = true, Description = 'Vagos'},
			{name = "~r~Retour~s~",ask = "", askX = true, Description = 'Retour'}

		}
	},

	["Banques"] = {
		b = {
			{name = "Caméra 22",ask = "~b~→", askX = true, Description = 'Bijouterie'},
			{name = "Caméra 23",ask = "~b~→", askX = true, Description = 'Paleto Banque'},
			{name = "Caméra 24",ask = "~b~→", askX = true, Description = 'Banque Centrale'},
			{name = "~r~Retour~s~",ask = "", askX = true, Description = 'Retour'}
		}
	},
	}
}



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(Pos.cam) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x,v.y,v.z ) <= 2 and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
                DrawText3D(441.51986694336,-979.69732666016,31.094416809082, "~b~Utilisez l'ordinateur")
                if IsControlJustPressed(1,38) then 
                    ExecuteCommand('e type3')
                    Citizen.Wait(1500)
                   CreateMenu(cam)
                end
            end
        end
    end
end)




-------------------- F6


Service = false

function functionCheckBox()
    if not Service then
        Service = true  
        local info = 'prise'
        TriggerServerEvent('police:PriseEtFinservice', info)
        OpenMenu('Liste des actions :')
    elseif Service then  
        Service = false     
        local info = 'fin'
        TriggerServerEvent('police:PriseEtFinservice', info)
        CloseMenu('Liste des actions :')
    end
end

-------------------- F6 -------------------
 

local menuf623 = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Los Santos Police Department" },
    Data = { currentMenu = "Non", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)
            local slide = btn.slidenum
            if btn.name == "Infos LSPD" then 
                OpenMenu('Infos LSPD')
            elseif btn.name == "Intéractions sur personne" then 
                OpenMenu('Intéractions sur personne')
            elseif btn.name == "Intéractions sur véhicules" then 
                OpenMenu('Intéractions sur véhicules')
            elseif btn.name == "Demande de renfort" then 
                OpenMenu('Demande de renfort')
            elseif btn.name == "Donner une Amende" then 
                ExecuteCommand("e notepad")
            Citizen.Wait(1500)
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer == -1 or closestDistance > 3.0 then
                ESX.ShowNotification('Personne autour')
            else
                local amount = KeyboardInput('Veuillez saisir le montant de la facture', '', 4)
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_police', 'police', amount)
            end  
            elseif btn.name == "Fouiller" then 
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer ~= -1 and closestDistance <= 3.0 then
					OpenBodySearchMenu(closestPlayer)
                    ExecuteCommand("me La personne fouille")
                    CloseMenu()
					else
						ESX.ShowNotification('Personne autour')
                end    
            elseif btn.name == "Service LSPD" then 
                functionCheckBox()
            elseif slide == 1 and btn.name == "Service" then
                local info = 'prise'
				TriggerServerEvent('police:PriseEtFinservice', info)
                Citizen.Wait(50)
            elseif slide == 2 and btn.name == "Service" then	 
                local info = 'fin'
				TriggerServerEvent('police:PriseEtFinservice', info)
                Citizen.Wait(50)
            elseif slide == 3 and btn.name == "Service" then	 
                local info = 'pause'
				TriggerServerEvent('police:PriseEtFinservice', info)
                Citizen.Wait(50)
            elseif slide == 4 and btn.name == "Service" then	 
                local info = 'control'
				TriggerServerEvent('police:PriseEtFinservice', info)
                Citizen.Wait(50)
            elseif slide == 5 and btn.name == "Service" then	 
                local info = 'crime'
				TriggerServerEvent('police:PriseEtFinservice', info)
                Citizen.Wait(50)
            end
            if slide == 1 and btn.name == "~r~Menotter~w~/~g~Démenotter" then
                local target, distance = ESX.Game.GetClosestPlayer()
				playerheading = GetEntityHeading(GetPlayerPed(-1))
				playerlocation = GetEntityForwardVector(PlayerPedId())
				playerCoords = GetEntityCoords(GetPlayerPed(-1))
				local target_id = GetPlayerServerId(target)
				if distance <= 2.0 then 
                    TriggerServerEvent('nk:handcuff2', target_id, playerheading, playerCoords, playerlocation)
                end
            elseif slide == 2 and btn.name == "~r~Menotter~w~/~g~Démenotter" then	 
                local target, distance = ESX.Game.GetClosestPlayer()
                playerheading = GetEntityHeading(GetPlayerPed(-1))
                playerlocation = GetEntityForwardVector(PlayerPedId())
                playerCoords = GetEntityCoords(GetPlayerPed(-1))
                local target_id = GetPlayerServerId(target)
                if distance <= 2.0 then 
                    TriggerServerEvent('nk:handcuff2', target_id, playerheading, playerCoords, playerlocation)
                end
            elseif slide == 1 and btn.name == "PPA" then
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent('oui', "weapon")
                ESX.ShowNotification('Le joueur a bien reçu son PPA')
            else
                ESX.ShowNotification('Aucun joueur à proximité')
            end   
            elseif slide == 2 and "Intéractions sur personne" and btn.name == "PPA" then	 
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					TriggerServerEvent('non', "weapon")
			    else
				ESX.ShowNotification('Aucun joueurs à proximité')
			    end 
            elseif btn.name == "Grosse demande" then 
                    local raison = 'omgad'
                local elements  = {}
                local playerPed = PlayerPedId()
                local coords  = GetEntityCoords(playerPed)
                local name = GetPlayerName(PlayerId())
            TriggerServerEvent('renfort', coords, raison)
            elseif slide == 1 and btn.name == "Demande de Renfort" then
                local raison = 'petit'
				local elements  = {}
				local playerPed = PlayerPedId()
				local coords  = GetEntityCoords(playerPed)
				local name = GetPlayerName(PlayerId())
			TriggerServerEvent('renfort', coords, raison)
            elseif slide == 2 and btn.name == "Demande de Renfort" then	 
                local raison = 'importante'
                local elements  = {}
                local playerPed = PlayerPedId()
                local coords  = GetEntityCoords(playerPed)
                local name = GetPlayerName(PlayerId())
            TriggerServerEvent('renfort', coords, raison)
            elseif slide == 3 and btn.name == "Demande de Renfort" then	 
                local raison = 'omgad'
                local elements  = {}
                local playerPed = PlayerPedId()
                local coords  = GetEntityCoords(playerPed)
                local name = GetPlayerName(PlayerId())
            TriggerServerEvent('renfort', coords, raison)
            elseif btn.name == "Rechercher une plaque" then 
                LookupVehicle()
                CloseMenu()
            elseif btn.name == "Mettre en fourrière" then 
                local coords  = GetEntityCoords(playerPed)
                TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
					currentTask.busy = true
					currentTask.task = ESX.SetTimeout(10000, function()
						ClearPedTasks(playerPed)
						ESX.Game.DeleteVehicle(vehicle)
						ESX.ShowNotification("~o~Mise en fourrière effectuée")
						currentTask.busy = false
						Citizen.Wait(100) 
					end)
				-- 	Citizen.CreateThread(function()
				-- 		while currentTask.busy do
				-- 			Citizen.Wait(1000)
				-- 			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
				-- 			if not DoesEntityExist(vehicle) and currentTask.busy then
				-- 				ESX.ShowNotification("~r~Le véhicule a bougé!")
				-- 				ESX.ClearTimeout(currentTask.task)
				-- 				ClearPedTasks(playerPed)
				-- 				currentTask.busy = false
				-- 				break
				-- 			end
				-- 		end
				-- end)
        end
    end
},
    Menu = {
        ["Non"] = {
            b = {
            {name = "Service LSPD", checkbox = false},
        }
        },
        ["Liste des actions :"] = {
            b = {
            {name = "Service LSPD", checkbox = true},
            {name = "Infos LSPD", ask = '', askX = true},
            {name = "Intéractions sur personne", ask = '', askX = true},
            {name = "Intéractions sur véhicules", ask = '', askX = true},
            {name = "Demande de renfort", ask = '', askX = true},
        }
        },
        ["Infos LSPD"] = {
            b = {
                {name = "Service", slidemax = {"~g~Prise de service", "~r~Fin de service", "~o~Pause de service", "~y~Control en cours", "~p~Crime en cours"}} 
            }
        },
        ["Intéractions sur personne"] = {
            b = {
                {name = "~r~Menotter~w~/~g~Démenotter", slidemax = {"Menotter", "Démenotter"}},

                {name = "PPA", slidemax = {"Donner", "Retirer"}},
                {name = "Donner une Amende", ask = '', askX = true},
                {name = "Fouiller", ask = '', askX = true},   
            }
        },
    
        ["Intéractions sur véhicules"] = {
            b = {
                {name = "Rechercher une plaque", ask = '', askX = true},
                {name = "Mettre en fourrière", ask = '', askX = true}
            }
        },
    
        ["Demande de renfort"] = {
             b = {
                {name = "Demande de Renfort", slidemax = {"~g~Petite demande", "~y~Moyenne demande", "~r~Grosse demande"} },
            }
        },
    }
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then 
		if IsControlJustReleased(0 ,167) then
            CreateMenu(menuf623)
            if Service then 
                OpenMenu('Liste des actions :')
            end
        end
	end
	end
end)



------------------------------------------ POLICE 
    
----------------------- REFRESHMONEY ( ACTION PATRON )

function RefreshpoliceMoney(p)
    
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then  
        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
            UpdatesocietypoliceMoney(money , p)
        end, ESX.PlayerData.job.name)
    end
   
end
    
function UpdatesocietypoliceMoney(money, p)
    societypolicemoney = money 
    if p ~= nil then  
        bosspolice.Menu.Action.b[1].ask =  "$".. societypolicemoney 
    end
end

----------------------- SPAWNCAR

function spawnCarPol(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)   
    end
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, 450.97198486328,-1017.6273193359,28.506114959717, 960.04, true, false)   ---- spawn du vehicule (position)
    TriggerEvent("notify", 1, "LSPD", "Vous avez sorti votre véhicule, Faites y attention !", 2500)
end


----------------- Vestiaire 


function TenueCadet()
    local model = GetEntityModel(GetPlayerPed(-1))
    TriggerEvent('skinchanger:getSkin', function(skin)
        if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
            ['tshirt_1'] = 43,  ['tshirt_2'] = 0,
            ['torso_1'] = 106,   ['torso_2'] = 25,
            ['decals_1'] = 15,   ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 34,    ['pants_2'] = 0,
            ['shoes_1'] = 45,   ['shoes_2'] = 0,
            ['chain_1'] = 0,  ['chain_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
  end

  function TenueOfficier()
    local model = GetEntityModel(GetPlayerPed(-1))
    TriggerEvent('skinchanger:getSkin', function(skin)
        if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
            ['tshirt_1'] = 43,  ['tshirt_2'] = 0,
            ['torso_1'] = 106,   ['torso_2'] = 25,
            ['decals_1'] = 15,   ['decals_2'] = 1,
            ['arms'] = 12,
            ['pants_1'] = 34,    ['pants_2'] = 0,
            ['shoes_1'] = 45,   ['shoes_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
  end



  function TenueSergent()
    local model = GetEntityModel(GetPlayerPed(-1))
    TriggerEvent('skinchanger:getSkin', function(skin)
        if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
            ['tshirt_1'] = 43,  ['tshirt_2'] = 0,
            ['torso_1'] = 106,   ['torso_2'] = 25,
            ['decals_1'] = 42,   ['decals_2'] = 0,
            ['arms'] = 17,
            ['pants_1'] = 34,    ['pants_2'] = 0,
            ['shoes_1'] = 45,   ['shoes_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
  end


  function TenueLieutenant()
    local model = GetEntityModel(GetPlayerPed(-1))
    TriggerEvent('skinchanger:getSkin', function(skin)
        if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
            ['tshirt_1'] = 69,  ['tshirt_2'] = 0,
            ['torso_1'] = 104,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 34,    ['pants_2'] = 0,
            ['shoes_1'] = 45,   ['shoes_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
  end

  function TenueCommandant()
    local model = GetEntityModel(GetPlayerPed(-1))
    TriggerEvent('skinchanger:getSkin', function(skin)
        if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
            ['tshirt_1'] = 43,  ['tshirt_2'] = 0,
            ['torso_1'] = 85,   ['torso_2'] = 17,
            ['decals_1'] = 28,   ['decals_2'] = 0,
            ['arms'] = 77,
            ['pants_1'] = 34,    ['pants_2'] = 0,
            ['shoes_1'] = 45,   ['shoes_2'] = 0,
            ['chain_1'] = 0,  ['chain_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
  end

function GiletCadet()
local model = GetEntityModel(GetPlayerPed(-1))
TriggerEvent('skinchanger:getSkin', function(skin)
    if model == GetHashKey("mp_m_freemode_01") then
      clothesSkin = {
        ['bproof_1'] = 24,  ['bproof_2'] = 0
      }
  end
  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
end)
end

function GiletBalle()
local model = GetEntityModel(GetPlayerPed(-1))
TriggerEvent('skinchanger:getSkin', function(skin)
    if model == GetHashKey("mp_m_freemode_01") then
      clothesSkin = {
        ['bproof_1'] = 33,  ['bproof_2'] = 0
      }
  end
  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
end)
end

--------------------------------



-------------------- F6 -------------------



function LookupVehicle()
ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle', {
    title = 'Recherche de la Plaque',
}, function(data, menu)
    local length = string.len(data.value)
    if not data.value or length < 2 or length > 8 then
        ESX.ShowNotification('Plaque non trouvé')
    else
        ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(retrivedInfo)
            local elements = {{label = retrivedInfo.plate}}
            menu.close()

            if not retrivedInfo.owner then
                table.insert(elements, {label = 'Propriétaire Inconnu'})
            else
                table.insert(elements, {label = 'Propriétaire :', retrivedInfo.owner})
            end

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
                title    = 'Véhicule Info',
                align    = 'top-left',
                elements = elements
            }, nil, function(data2, menu2)
                menu2.close()
            end)
        end, data.value)

    end
end, function(data, menu)
    menu.close()
end)
end


RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
if raison == 'petit' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-2\n~w~Importance: ~g~Légère.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    color = 2
elseif raison == 'importante' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-3\n~w~Importance: ~o~Importante.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    color = 47
elseif raison == 'omgad' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-99\n~w~Importance: ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
    color = 1
end
local blipId = AddBlipForCoord(coords)
SetBlipSprite(blipId, 161)
SetBlipScale(blipId, 1.2)
SetBlipColour(blipId, color)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString('Demande renfort')
EndTextCommandSetBlipName(blipId)
Wait(80 * 1000)
RemoveBlip(blipId)
end)

RegisterNetEvent('police:InfoService')
AddEventHandler('police:InfoService', function(service, nom)
if service == 'prise' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Prise de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-8\n~w~Information: ~g~Prise de service.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
elseif service == 'fin' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Fin de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-10\n~w~Information: ~g~Fin de service.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
elseif service == 'pause' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Pause de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-6\n~w~Information: ~g~Pause de service.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
elseif service == 'standby' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Mise en standby', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-12\n~w~Information: ~g~Standby, en attente de dispatch.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
elseif service == 'control' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Control routier', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-48\n~w~Information: ~g~Control routier en cours.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
elseif service == 'refus' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Refus d\'obtemperer', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-30\n~w~Information: ~g~Refus d\'obtemperer / Delit de fuite en cours.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
elseif service == 'crime' then
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Crime en cours', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-31\n~w~Information: ~g~Crime en cours / poursuite en cours.', 'CHAR_CALL911', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
end
end)

-------------------------- Intéraction 




RegisterNetEvent('nk:handcuff')
AddEventHandler('nk:handcuff', function()

  IsHandcuffed    = not IsHandcuffed;
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed then

        RequestAnimDict('mp_arresting')
        while not HasAnimDictLoaded('mp_arresting') do
            Citizen.Wait(100)
        end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      DisableControlAction(2, 37, true)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      DisableControlAction(0, 24, true) -- Attack
      DisableControlAction(0, 257, true) -- Attack 2
      DisableControlAction(0, 25, true) -- Aim
      DisableControlAction(0, 263, true) -- Melee Attack 1
      DisableControlAction(0, 37, true) -- Select Weapon
      DisableControlAction(0, 47, true)  -- Disable weapon

    else

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)

    end

  end)
end)





---------------------------- FUNCTIONS 

------------------------ TEXT EN BAS


function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end

------------------ TEXT 3D ---------------


function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.25)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
    for a,b in pairs(Blips) do  
        for c,d in pairs(b) do
            local blip = AddBlipForCoord(d.Position)
            SetBlipSprite (blip, d.Sprite)
            SetBlipDisplay(blip, d.Display)
            SetBlipScale  (blip, d.Scale)
            SetBlipColour (blip, d.Colour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(d.Name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)


Citizen.CreateThread(function()
    for a,b in pairs(Blips) do
        for c,d in pairs(b) do
            local hash = GetHashKey(d.Ped)
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Citizen.Wait(20)
            end
            ped = CreatePed(d.PedType, d.Ped, d.Position, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end
    end
end)


-------------------------

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Citizen.Wait(0) end 
    if UpdateOnscreenKeyboard() ~= 2 then local result = GetOnscreenKeyboardResult() Citizen.Wait(500) blockinput = false return result else Citizen.Wait(500) blockinput = false return nil end
end

-------------------------- CAMERA

scanId = 0
cityRobbery = false
local myspawns = {}

CCTVCamLocations = {
	[1] =  { ['x'] = 24.18,['y'] = -1347.35,['z'] = 29.5,['h'] = 271.32, ['info'] = ' Store Camera 1', ["recent"] = false },
	[2] =  { ['x'] = -46.56,['y'] = -1757.98,['z'] = 29.43,['h'] = 48.68, ['info'] = ' Store Camera 2', ["recent"] = false },
	[3] =  { ['x'] = -706.02,['y'] = -913.61,['z'] = 19.22,['h'] = 85.61, ['info'] = ' Store Camera 3', ["recent"] = false },
	[4] =  { ['x'] = -1221.97,['y'] = -908.42,['z'] = 12.33,['h'] = 31.1, ['info'] = ' Store Camera 4', ["recent"] = false },
	[5] =  { ['x'] = 1164.99,['y'] = -322.78,['z'] = 69.21,['h'] = 96.91, ['info'] = ' Store Camera 5', ["recent"] = false },
	[6] =  { ['x'] = 372.25,['y'] = 326.43,['z'] = 103.57,['h'] = 252.9, ['info'] = ' Store Camera 6', ["recent"] = false },
	[7] =  { ['x'] = -1819.98,['y'] = 794.57,['z'] = 138.09,['h'] = 126.56, ['info'] = ' Store Camera 7', ["recent"] = false },
	[8] =  { ['x'] = -2966.24,['y'] = 390.94,['z'] = 15.05,['h'] = 84.58, ['info'] = ' Store Camera 8', ["recent"] = false },
	[9] =  { ['x'] = -3038.92,['y'] = 584.21,['z'] = 7.91,['h'] = 19.43, ['info'] = ' Store Camera 9', ["recent"] = false },
	[10] =  { ['x'] = -3242.48,['y'] = 999.79,['z'] = 12.84,['h'] = 351.35, ['info'] = ' Store Camera 10', ["recent"] = false },
	[11] =  { ['x'] = 2557.14,['y'] = 380.64,['z'] = 108.63,['h'] = 353.01, ['info'] = ' Store Camera 11', ["recent"] = false },
	[12] =  { ['x'] = 1166.02,['y'] = 2711.15,['z'] = 38.16,['h'] = 175.0, ['info'] = ' Store Camera 12', ["recent"] = false },
	[13] =  { ['x'] = 549.32,['y'] = 2671.3,['z'] = 42.16,['h'] = 94.96, ['info'] = ' Store Camera 13', ["recent"] = false },
	[14] =  { ['x'] = 1959.96,['y'] = 3739.99,['z'] = 32.35,['h'] = 296.38, ['info'] = ' Store Camera 14', ["recent"] = false },
	[15] =  { ['x'] = 2677.98,['y'] = 3279.28,['z'] = 55.25,['h'] = 327.81, ['info'] = ' Store Camera 15', ["recent"] = false },
	[16] =  { ['x'] = 1392.88,['y'] = 3606.7,['z'] = 34.99,['h'] = 201.69, ['info'] = ' Store Camera 16', ["recent"] = false },
	[17] =  { ['x'] = 1697.8,['y'] = 4922.69,['z'] = 42.07,['h'] = 322.95, ['info'] = ' Store Camera 17', ["recent"] = false },
	[18] =  { ['x'] = 1728.82,['y'] = 6417.38,['z'] = 35.04,['h'] = 233.94, ['info'] = ' Store Camera 18', ["recent"] = false },
	[19] =  { ['x'] = 733.45,['y'] = 127.58,['z'] = 80.69,['h'] = 285.51, ['info'] = ' Cam Power' },
	[20] =  { ['x'] = 1887.25,['y'] = 2605.35,['z'] = 50.40,['h'] = 111.88, ['info'] = ' Cam Jail Front' },
	[21] =  { ['x'] = 1709.37,['y'] = 2569.90,['z'] = 56.18,['h'] = 50.18, ['info'] = ' Cam Jail Prisoner Drop Off' },
	[22] =  { ['x'] = -644.24,['y'] = -241.11,['z'] = 37.97,['h'] = 282.81, ['info'] = ' Cam Jewelry Store' },
	[23] =  { ['x'] = -115.3,['y'] = 6441.41,['z'] = 31.53,['h'] = 341.95, ['info'] = ' Cam Paleto Bank Outside' },
	[24] =  { ['x'] = 240.07,['y'] = 218.97,['z'] = 106.29,['h'] = 276.14, ['info'] = ' Cam Main Bank 1' },
	[25] =  { ['x'] = 92.17,['y'] = -1923.14,['z'] = 29.5,['h'] = 205.95, ['info'] = ' Ballas', ["recent"] = false },
	[26] =  { ['x'] = -176.26,['y'] = -1681.15,['z'] = 47.43,['h'] = 313.29, ['info'] = ' Famillies', ["recent"] = false },
	[27] =  { ['x'] = 285.95,['y'] = -2003.95,['z'] = 35.0,['h'] = 226.0, ['info'] = ' Vagos', ["recent"] = false },	
}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	  PlayerData = ESX.GetPlayerData()
	end
end)

inCam = false
cctvCam = 0
RegisterNetEvent("cctv:camera")
AddEventHandler("cctv:camera", function(camNumber)
	camNumber = tonumber(camNumber)
	if inCam then
		inCam = false
		PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
		-- TriggerEvent('animation:tablet',false)
		Wait(250)
		ClearPedTasks(GetPlayerPed(-1))
	else
		if camNumber > 0 and camNumber < #CCTVCamLocations+1 then
			PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
			TriggerEvent("cctv:startcamera",camNumber)
		else
			exports['mythic_notify']:SendAlert('error', "This camera appears to be faulty")
		end
	end
end)

RegisterNetEvent("cctv:startcamera")
AddEventHandler("cctv:startcamera", function(camNumber)

	TriggerEvent('animation:tablet',true)
	local camNumber = tonumber(camNumber)
	local x = CCTVCamLocations[camNumber]["x"]
	local y = CCTVCamLocations[camNumber]["y"]
	local z = CCTVCamLocations[camNumber]["z"]
	local h = CCTVCamLocations[camNumber]["h"]

	print("starting cam")
	inCam = true

	SetTimecycleModifier("heliGunCam")
	SetTimecycleModifierStrength(1.0)
	local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	local lPed = GetPlayerPed(-1)
	cctvCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	SetCamCoord(cctvCam,x,y,z+1.2)						
	SetCamRot(cctvCam, -15.0,0.0,h)
	SetCamFov(cctvCam, 110.0)
	RenderScriptCams(true, false, 0, 1, 0)
	PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	PopScaleformMovieFunctionVoid()

	while inCam do
		SetCamCoord(cctvCam,x,y,z+1.2)						
		-- SetCamRot(cctvCam, -15.0,0.0,h)
		PushScaleformMovieFunction(scaleform, "SET_ALT_FOV_HEADING")
		PushScaleformMovieFunctionParameterFloat(GetEntityCoords(h).z)
		PushScaleformMovieFunctionParameterFloat(1.0)
		PushScaleformMovieFunctionParameterFloat(GetCamRot(cctvCam, 2).z)
		PopScaleformMovieFunctionVoid()
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		Citizen.Wait(1)
	end
	ClearFocus()
	ClearTimecycleModifier()
	RenderScriptCams(false, false, 0, 1, 0)
	SetScaleformMovieAsNoLongerNeeded(scaleform)
	DestroyCam(cctvCam, false)
	SetNightvision(false)
	SetSeethrough(false)	

end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if inCam then

			local rota = GetCamRot(cctvCam, 2)

			if IsControlPressed(1, Keys['N4']) then
				SetCamRot(cctvCam, rota.x, 0.0, rota.z + 0.7, 2)
			end

			if IsControlPressed(1, Keys['N6']) then
				SetCamRot(cctvCam, rota.x, 0.0, rota.z - 0.7, 2)
			end

			if IsControlPressed(1, Keys['N8']) then
				SetCamRot(cctvCam, rota.x + 0.7, 0.0, rota.z, 2)
			end

			if IsControlPressed(1, Keys['N5']) then
				SetCamRot(cctvCam, rota.x - 0.7, 0.0, rota.z, 2)
			end
		end
	end
end)

