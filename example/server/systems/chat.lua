local commands = {}

--[[
/**
 * Register commands for players to use.
 * @param  {string} commandName
 * @param  {string} description
 * @param  {Function} callback
 */
]]
function registerCmd(commandName, description, callback)
	commandName = commandName:lower()
	if (commands[commandName] ~= nil) then
		alt.logError('Failed to register command /'..commandName..', already registered')
		return
	end

	alt.logInfo("Registering command: " .. commandName)
	commands[commandName] = {
		callback = callback,
		description = description
	}
end

function invokeCmd(player, commandName, args)
	local commandName2 = commandName:lower()
	if (not commands[commandName2]) then
		player:send('{FF0000} Unknown command /' .. commandName2)
		return
	end

	local callback = commands[commandName2].callback
	if (type(callback) ~= "function") then
		player:send('{FF0000} Unknown command /' .. commandName2)
		return
	end

	callback(player, args)
end

function mysplit (inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

function chatSend(player, msg)
	if (string.sub(msg, 1, 1) == '/') then
		alt.logInfo('[Command] '..player.name..' '..msg..'');
		msg = msg:sub(2, #msg)

		if (#msg > 0) then
			local args = mysplit(msg, ' ')
			local commandName = table.remove(args, 1)
			invokeCmd(player, commandName, args)
		end
		return
	end

	-- msg = msg.trim();
	-- if (msg.length <= 0) {
	--     return;
	-- }

	alt.logInfo('[Message] '..player.name..': '..msg..'')

	-- Cleanse Message
	msg = msg
		:gsub('<', '&lt;')
		:gsub("'", '&#39')
		:gsub('"', '&#34')

	alt.emitClient(nil, 'chat:Send', player.name .. ' says: ' .. msg)
end
alt.onClient('chat:Send', chatSend)