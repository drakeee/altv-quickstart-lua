require('systems.chat')
require('configuration.config')
require('utility.vector')


function handleRespawn(player)
    local randomPosition = randomPositionAround(DEFAULT_CONFIG.SPAWN, DEFAULT_CONFIG.SPAWN_RANGE)
    player:spawn(randomPosition.x, randomPosition.y, randomPosition.z, 0)
    player:send('You were respawned.')
end
registerCmd('respawn', '/respawn | Respawn the player at spawn.', handleRespawn)
registerCmd('spawn', '/spawn | Respawn the player at spawn.', handleRespawn)