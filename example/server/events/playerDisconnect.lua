alt.logInfo('Loaded: events/playerDisconnect')

function playerDisconnect(player)
    if (not player or not player.valid) then
        return
	end
	
    alt.log(player.name .. ' has disconnected from the server.')
end
alt.on('playerDisconnect', playerDisconnect)