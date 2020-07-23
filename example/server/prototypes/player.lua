--import alt from 'alt-server';

--[[
 * This is how you properly extend player functionality within the resource.
 * Prototyping is super simple but super useful.
]]

getmetatable(Player).__class.send = function(this, msg)
	msg = msg
		:gsub('<', '&lt;')
		:gsub("'", '&#39')
		:gsub('"', '&#34')
	alt.emitClient(this, "chat:Send", msg)
end

getmetatable(Player).__class.emit = function(this, emitRoute, ...)
	alt.emitClient(this, emitRoute, unpack(arg))
end
