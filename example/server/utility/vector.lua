--[[
/**
 * Get all players in a certain range of a position.
 * @param  {} pos
 * @param  {} range
 * @param  {} dimension=0
 * @returns {Array<alt.Player>}
 */
]]
function getPlayersInRange(pos, range, dimension)
    if (pos == nil or range == nil) then
		alt.logError('GetPlayersInRange => pos or range is undefined')
		return
	end

	local players = {}
	for k,player in ipairs(Player) do
		if(player.dimension == dimension and distance2d(pos, player.position)) <= range then
			players.insert(player)
		end
	end

	return players
end

--[[
/**
 * Get the forward vector of a player.
 * @param  {} rot
 * @returns {{x,y,z}}
 */
]]
function getForwardVectorServer(rot)
	print(tostring(rot))

    local z = -rot.z;
    local x = rot.x;
    local num = math.abs(math.cos(x));
    return {
        x = -math.sin(z) * num,
        y = math.cos(z) * num,
        z = math.sin(x)
    }
end

--[[
/**
 * Get the distance from one vector to another.
 * Does take Z-Axis into consideration.
 * @param  {} vector1
 * @param  {} vector2
 * @returns {number}
 */
]]
function distance(vector1, vector2)
    if (vector1 == nil or vector2 == nil) then
		alt.logError('AddVector => vector1 or vector2 is undefined')
		return;
	end

    return math.sqrt(
        math.pow(vector1.x - vector2.x, 2) + math.pow(vector1.y - vector2.y, 2) + math.pow(vector1.z - vector2.z, 2)
    )
end

--[[
/**
 * Get the distance from one vector to another.
 * Does not take Z-Axis into consideration.
 * @param  {} vector1
 * @param  {} vector2
 * @returns {{x,y,z}}
 */
]]
function distance2d(vector1, vector2)
    if (vector1 == nil or vector2 == nil) then
		alt.logError('AddVector => vector1 or vector2 is undefined')
		return
	end

    return math.sqrt(math.pow(vector1.x - vector2.x, 2) + math.pow(vector1.y - vector2.y, 2));
end

--[[
/**
 * Check if a position is between two vectors.
 * @param  {} pos
 * @param  {} vector1
 * @param  {} vector2
 * @returns {boolean}
 */
]]
function isBetween(pos, vector1, vector2)
    local validX = (pos.x > vector1.x and pos.x < vector2.x)
    local validY = (pos.y > vector1.y and pos.y < vector2.y)
    return (validX and validY) and true or false
end

--[[
/**
 * Get a random position around a position.
 * @param  {} position
 * @param  {} range
 * @returns {{x,y,z}}
 */
]]
function randomPositionAround(position, range)
    return {
        x = position.x + math.random() * (range * 2) - range,
        y = position.y + math.random() * (range * 2) - range,
        z = position.z
    };
end

--[[
/**
 * Get the closest vector from a group of vectors.
 * @param  {} pos
 * @param  {Array<{x,y,z}> | Array<{pos}} arrayOfPositions
 * @returns {Array<any>}
 */
]]
function getClosestVectorFromGroup(pos, arrayOfPositions)
    if (not arrayOfPositions[1].pos and not arrayOfPositions[1].x) then
		alt.logError('The specified vectors do not contain x,y,z or pos in their object.')
		return
	end

    --[[arrayOfPositions.sort((a, b) => {
        if (a.pos && b.pos) {
            return distance(pos, a.pos) - distance(pos, b.pos);
        }

        return distance(pos, a.pos) - distance(pos, b.pos);
    });]]

    return arrayOfPositions[1];
end

--[[
/**
 * Get the closest player to a player.
 * @param  {} player
 * @returns {Array<alt.Player>}
 */
]]
function getClosestPlayer(player)
    return getClosestVector(player.position, alt.Player.all);
end

--[[
/**
 * Get the closest vehicle to a player.
 * @param  {} player
 * @returns {Array<alt.Vehicle>}
 */
]]
function getClosestVehicle(player)
    return getClosestVehicle(player.position, alt.Vehicle.all);
end
