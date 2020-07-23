require('utility.vector')
require('configuration.config')

alt.logInfo('Loaded: events/playerConnect')

function playerConnect(player)
	alt.logInfo(player.name .. ' has connected to the server.')
	alt.emitClient(player, 'chat:Init')
	local randomModelNumber = math.random(#DEFAULT_CONFIG.RANDOM_PLAYER_MODELS)
	local randomModel = DEFAULT_CONFIG.RANDOM_PLAYER_MODELS[randomModelNumber]
	local randomPosition = randomPositionAround(DEFAULT_CONFIG.SPAWN, DEFAULT_CONFIG.SPAWN_RANGE)
	
	-- Set Model, Set Spawn, Send Message
	alt.logInfo("Model: " .. tostring(randomModel) .. " - " .. tostring(randomModelNumber))
	player.model = randomModel
	player:spawn(randomPosition.x, randomPosition.y, randomPosition.z, 0)
	player:send('Welcome to the server!')

	print("Position: " .. tostring(player.position))
	print("Rotation: " .. tostring(player.rotation))
end
alt.on('playerConnect', playerConnect)