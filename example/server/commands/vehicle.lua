require('systems.chat')
require('utility.vector')

local playersVehicle = {}

function handleAddVehicle(player, args)
	if (not args or not args[1]) then
		player:send('/vehicle <name>')
		return
	end
	
	if (playersVehicle[player]) then
		playersVehicle[player]:destroy()
	end
	
	local vehicleName = args[1]
	local fwdVector = getForwardVectorServer(player.rotation)
	local positionInFront = {
		x = player.position.x + fwdVector.x * 4,
		y = player.position.y + fwdVector.y * 4,
		z = player.position.z
	}
	
	local vehicle = alt.Vehicle(
		vehicleName,
		positionInFront.x,
		positionInFront.y,
		positionInFront.z,
		0,
		0,
		0
	)
	
	if vehicle then
		player:send('{00FF00}'..vehicleName..' was successfully spawned.')
		playersVehicle[player] = vehicle
	else
		player:send('{FF0000}'..vehicleName..' is not a valid vehicle name.')
	end
end
registerCmd('vehicle', '/vehicle <name> | Summons a vehicle in front of a player.', handleAddVehicle)
