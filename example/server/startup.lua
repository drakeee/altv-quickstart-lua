-- alt:V Files to Load
-- Prototypes
require('prototypes.player')

-- Commands
require('commands.respawn')
require('commands.utility')
require('commands.vehicle')
require('commands.weapon')

-- Configuration Files
require('configuration.config')

-- Events
require('events.playerConnect')
require('events.playerDeath')
require('events.playerDisconnect')

-- Systems
require('systems.chat')

-- Utility
--require('./utility/array')
require('utility.vector')

alt.logInfo('The resource has now started! PogChamp')
