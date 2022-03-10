ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




-----------------------------------------------------------------------------------------------------------
--------------------------------------- POLICE ------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------


TriggerEvent('esx_phone:registerNumber', 'police', 'alerte police', true, true)

TriggerEvent('esx_society:registerSociety', 'police', 'Police', 'society_police', 'society_police', 'society_police', {type = 'public'})

---------- ARMUERIE

RegisterNetEvent('equipementbase')
AddEventHandler('equipementbase', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

xPlayer.addWeapon('WEAPON_NIGHTSTICK', 42)
xPlayer.addWeapon('WEAPON_STUNGUN', 42)
xPlayer.addWeapon('WEAPON_FLASHLIGHT', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre ~b~équipement de Cadet")
end)

RegisterNetEvent('equipementoff')
AddEventHandler('equipementoff', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

xPlayer.addWeapon('WEAPON_COMBATPISTOL', 42)
xPlayer.addWeapon('WEAPON_STUNGUN', 42)
xPlayer.addWeapon('WEAPON_FLASHLIGHT', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre ~b~équipement d'Officier")
end)

RegisterNetEvent('equipementserg')
AddEventHandler('equipementserg', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

xPlayer.addWeapon('WEAPON_COMBATPISTOL', 42)
xPlayer.addWeapon('WEAPON_STUNGUN', 42)
xPlayer.addWeapon('WEAPON_FLASHLIGHT', 42)
xPlayer.addWeapon('WEAPON_PUMPSHOTGUN', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre ~b~équipement de Sergent")
end)

RegisterNetEvent('equipementlieu')
AddEventHandler('equipementlieu', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

xPlayer.addWeapon('WEAPON_COMBATPISTOL', 42)
xPlayer.addWeapon('WEAPON_STUNGUN', 42)
xPlayer.addWeapon('WEAPON_FLASHLIGHT', 42)
xPlayer.addWeapon('WEAPON_PUMPSHOTGUN', 42)
xPlayer.addWeapon('WEAPON_SMG', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre ~b~équipement de Lieutenant")
end)

RegisterNetEvent('equipementboss')
AddEventHandler('equipementboss', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

xPlayer.addWeapon('WEAPON_COMBATPISTOL', 42)
xPlayer.addWeapon('WEAPON_STUNGUN', 42)
xPlayer.addWeapon('WEAPON_FLASHLIGHT', 42)
xPlayer.addWeapon('WEAPON_PUMPSHOTGUN', 42)
xPlayer.addWeapon('WEAPON_SMG', 42)
xPlayer.addWeapon('WEAPON_CARBINERIFLE', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre ~b~équipement de Commandant")
end)

--------- AUTRES


RegisterNetEvent('armurerie')
AddEventHandler('armurerie', function(arme, prix)
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.addWeapon(arme, 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre arme~b~")
end)


ESX.RegisterServerCallback('esx_policejob:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then

			MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
				else
					cb(result2[1].name, true)
				end

			end)
		else
			cb(_U('unknown'), false)
		end
	end)
end)



--------------- ALERTE LSPD


RegisterServerEvent('police:PriseEtFinservice')
AddEventHandler('police:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('police:InfoService', xPlayers[i], _raison, name)
		end
	end
end)



RegisterServerEvent('renfort')
AddEventHandler('renfort', function(coords, raison)
	local _source = source
	local _raison = raison
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, _raison)
		end
	end
end)

--------------------------------- ACTION PATRON


RegisterServerEvent('Ppatron:recruter')
AddEventHandler('Ppatron:recruter', function(societe, job2, target)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(target)

  
  if job2 == false then
  	if xPlayer.job.grade_name == 'boss' then
  	xTarget.setJob(societe, 0)
  	TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été recruté")
  	TriggerClientEvent('esx:showNotification', target, "Bienvenue chez la police !")
  	else
	TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'êtes pas Patron...")
end
  else
  	if xPlayer.job2.grade_name == 'boss' then
  	xTarget.setJob2(societe, 0)
  	TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été recruté")
  	TriggerClientEvent('esx:showNotification', target, "Bienvenue chez la police !")
  	else
	TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'êtes pas Patron...")
end
  end
end)



RegisterServerEvent('patron:promouvoir')
AddEventHandler('patron:promouvoir', function(societe, job2, target)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(target)

  
  if job2 == false then
  	if xPlayer.job.grade_name == 'boss' and xPlayer.job.name == xTarget.job.name then
  	xTarget.setJob(societe, tonumber(xTarget.job.grade) + 1)
  	TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été promu")
  	TriggerClientEvent('esx:showNotification', target, "Vous avez été promu ")
  	else
	TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'êtes pas Patron ou alors le joueur ne peut pas être promu")
end
  else
  	if xPlayer.job2.grade_name == 'boss' and xPlayer.job2.name == xTarget.job2.name then
  	xTarget.setJob2(societe, tonumber(xTarget.job2.grade) + 1)
  	TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été promu")
  	TriggerClientEvent('esx:showNotification', target, "Vous avez été promu !")
  	else
	TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'êtes pas Patron ou alors le joueur ne peut pas être promu")
end
  end
end)

RegisterServerEvent('patron:descendre')
AddEventHandler('patron:descendre', function(societe, job2, target)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(target)

  
  if job2 == false then
  	if xPlayer.job.grade_name == 'boss' and xPlayer.job.name == xTarget.job.name then
  	xTarget.setJob(societe, tonumber(xTarget.job.grade) - 1)
  	TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été rétrogradé")
  	TriggerClientEvent('esx:showNotification', target, "Vous avez été rétrogradé de "..societe.."!")
  	else
	TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'êtes pas Patron ou alors le joueur ne peut pas être promu")
end
  else
  	if xPlayer.job2.grade_name == 'boss' and xPlayer.job2.name == xTarget.job2.name then
  	xTarget.setJob2(societe, tonumber(xTarget.job2.grade) - 1)
  	TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été rétrogradé")
  	TriggerClientEvent('esx:showNotification', target, "Vous avez été rétrogradé de "..societe.."!")
  	else
	TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'êtes pas Patron ou alors le joueur ne peut pas être promu")
end
  end
end)

RegisterServerEvent('patron:virer')
AddEventHandler('patron:virer', function(societe, job2, target)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(target)

  
  if job2 == false then
  	if xPlayer.job.grade_name == 'boss' and xPlayer.job.name == xTarget.job.name then
  	xTarget.setJob("unemployed", 0)
  	TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été viré")
  	TriggerClientEvent('esx:showNotification', target, "Vous avez été viré de "..societe.."!")
  	else
	TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'êtes pas Patron ou alors le joueur ne peut pas être viré")
end
  else
  	if xPlayer.job2.grade_name == 'boss' and xPlayer.job2.name == xTarget.job2.name then
  	xTarget.setJob2("unemployed2", 0)
  	TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été viré")
  	TriggerClientEvent('esx:showNotification', target, "Vous avez été viré de "..societe.."!")
  	else
	TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'êtes pas Patron ou alors le joueur ne peut pas être viré")
end
  end
end)

------------------------------------------------ Intéraction


RegisterServerEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('esx_policejob:drag', target, source)
	else
		print(('esx_policejob: %s attempted to drag (not cop)!'):format(xPlayer.identifier))
	end
end)



------------------------ PPA

RegisterServerEvent('oui')
AddEventHandler('oui', function(permis)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(target)

    MySQL.Async.execute('INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)', {
        ['@type'] = permis,
        ['@owner'] = xTarget.identifier
    })
end)

RegisterServerEvent('non')
AddEventHandler('non', function(permis)
	local xPlayer = ESX.GetPlayerFromId(source)
  	local xTarget = ESX.GetPlayerFromId(target)

    MySQL.Async.execute('DELETE INTO user_licenses (type, owner) VALUES (@type, @owner)', {
        ['@type'] = permis,
        ['@owner'] = xTarget.identifier
    })
end)
