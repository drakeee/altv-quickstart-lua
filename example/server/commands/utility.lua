require('systems.chat');

registerCmd('coords', '/coords | Returns current coordinates to chat and console.', function(player)
    local coords = player.position
    player:send(tostring(coords))
    alt.logInfo(tostring(coords))
end)

registerCmd('players', '/players | Returns current player count.', function(player)
    player:send("Player Count: " .. #Player.all)
end)
