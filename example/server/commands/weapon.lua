require('systems.chat')
require('gamedata.weapons')

function summonWeapon(player, args)
    if (not args or not args[1]) then
        player:send('/weapon <name>')
        return
	end

    local weaponName = args[1]
    if (not HASH_BY_NAME[weaponName]) then
        player:send('{FF0000}' .. args[1] .. ' is not a valid weapon.')
        return
	end

    player:giveWeapon(HASH_BY_NAME[weaponName], 999, true)
end
registerCmd('weapon', '/weapon <name> | Summon a weapon by name.', summonWeapon)
registerCmd('wep', '/wep <name> | Summon a weapon by name.', summonWeapon)
registerCmd('addwep', '/addwep <name> | Summon a weapon by name.', summonWeapon)