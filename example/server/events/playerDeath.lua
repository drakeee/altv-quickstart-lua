require('utility.vector')
require('configuration.config')
require('gamedata.weapons')

alt.logInfo('Loaded: events/playerDeath')

function playerDeath(victim, killer, weaponHash)
	if (not victim or not victim.valid) then
		return
	end
	
	if (killer and WEAPON_BY_HASH[weaponHash]) then
		alt.emitClient(
			nil,
			'chat:Send',
			victim.name .. ' was killed by '..killer.name..' with '..WEAPON_BY_HASH[weaponHash]..''
		)
	end
	
	local randomPosition = randomPositionAround(DEFAULT_CONFIG.SPAWN, DEFAULT_CONFIG.SPAWN_RANGE)
	victim.spawn(randomPosition.x, randomPosition.y, randomPosition.z, 0)
	victim.send('You have died and you were respawned.')
end
alt.on('playerDeath', playerDeath)