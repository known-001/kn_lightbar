ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local lightbarCars = {}
local lightbarCars2 = {}

if Config.Item then
	ESX.RegisterUsableItem('lightbar', function(playerId)
		TriggerClientEvent('lightbar:lightbar:itemUse', playerId)
	end)
end

RegisterServerEvent('lightbar:addLightbar')
AddEventHandler('lightbar:addLightbar', function(hostVehPlate, lightbarNetworkID, hvp)
	local source = source
	for k,v in pairs(lightbarCars) do 
		if v["LP"] == hostVehPlate then
			table.insert(v.lights, lightbarNetworkID)
			return
		end
	end
	table.insert(lightbarCars, {["hostVehiclePointer"] = hvp, ["LP"] = hostVehPlate, ["lights"] = {lightbarNetworkID}, ["lightStatus"] = false, ["sirenStatus"] = false} )
end)			

RegisterServerEvent('lightbar:toggleLights2')
AddEventHandler('lightbar:toggleLights2', function(hostVehPlate)
	local source = source
	local veh = nil
	for k,v in pairs(lightbarCars) do 
		if v["LP"] == hostVehPlate then
			TriggerClientEvent("lightbar:clientToggleLights", source, v.lights, v.lightStatus, v.hostVehiclePointer) 
			v.lightStatus = not v.lightStatus
		end
	end
end)

RegisterServerEvent("lightbar:ToggleSound1Server")
AddEventHandler("lightbar:ToggleSound1Server", function(plate)
	local source = source
	local toggle = nil
	for k,v in pairs(lightbarCars) do 
		if v["LP"] == plate then
			toggle = not v.sirenStatus
			v.sirenStatus = toggle
			TriggerClientEvent("lightbar:sound1Client", -1, source, toggle)
		end
	end
end)

RegisterServerEvent('lightbar:returnLightBarVehiclePlates')
AddEventHandler('lightbar:returnLightBarVehiclePlates', function()
	local source = source
	local plates = {}
	for k,v in pairs(lightbarCars) do 
		table.insert(plates, v.LP)
	end
	TriggerClientEvent("lightbar:sendLightBarVehiclePlates", source, plates) 
end)


RegisterServerEvent('lightbar:returnLightbarsForMainVeh')
AddEventHandler('lightbar:returnLightbarsForMainVeh', function(mainVehPlate)
	local source = source
	local plates = {}
	for k,v in pairs(lightbarCars) do 
		if v.LP == mainVehPlate then
			plates = v.lights
			lightbarCars[k] = nil -- removes main vehicle from arr
		end
	end
	--removeAllFromTable(mainVehPlate)
	TriggerClientEvent("lightbar:updateLightbarArray", source, plates) 
end)

function removeKey(key)
	lightbarCars[key] = nil
end

function removeAllFromTable(mainVehPlate)
	for k,v in pairs(lightbarCars) do 
		if v.LP == mainVehPlate then
			table.remove(k)
			return
		end
	end
end