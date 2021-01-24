local staff = {}
minetest.register_chatcommand("sadm", {
	params = "<msg>",
	description = "Send a message on the staff channel",
	privs = {privs=true},
	func = function(name, param)
		for _, toname in pairs(staff) do
			minetest.chat_send_player(toname, minetest.colorize("#ff0000",
				"[ADMINISTRATEUR] <" .. name .. "> " .. param))
			minetest.log("action", "CHAT [ADMINISTRATEUR]: <" .. name .. "> " .. param)
		end
	end
})
minetest.register_chatcommand("sres", {
	params = "<msg>",
	description = "Send a message on the staff channel",
	privs = {RESPONSABLE=true},
	func = function(name, param)
		for _, toname in pairs(staff) do
			minetest.chat_send_player(toname, minetest.colorize("#ffff00",
				"[RESPONSABLE] <" .. name .. "> " .. param))
			minetest.log("action", "CHAT [RESPONSABLE]: <" .. name .. "> " .. param)
		end
	end
})
minetest.register_chatcommand("smodo", {
	params = "<msg>",
	description = "Send a message on the staff channel",
	privs = {fly=true},
	func = function(name, param)
		for _, toname in pairs(staff) do
			minetest.chat_send_player(toname, minetest.colorize("#00ff00",
				"[MODO] <" .. name .. "> " .. param))
			minetest.log("action", "CHAT:[MODO] <" .. name .. "> " .. param)
		end
	end
})
minetest.register_chatcommand("ssay", {
	params = "<msg>",
	description = "Send a message on the staff channel",
	privs = {server=true},
	func = function(name, param)
		for _, toname in pairs(staff) do
			minetest.chat_send_player(toname, minetest.colorize("#ff5500",
				"[server] " .. param))
			minetest.log("action", "CHAT: <" .. name .. "> " .. param)
		end
	end
})
minetest.register_chatcommand("s", {
	params = "<msg>",
	description = "Send a message on the staff channel",
	privs = {kick=true},
	func = function(name, param)
		for _, toname in pairs(staff) do
			minetest.chat_send_player(toname, minetest.colorize("#ff5500",
				"[" .. name .. "] " .. param))
			minetest.log("action", "CHAT: <" .. name .. "> " .. param)
		end
	end
})

minetest.register_on_joinplayer(function(player)
	if minetest.check_player_privs(player, {kick=true}) then
		table.insert(staff, player:get_player_name())
	end
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	local idx = table.indexof(staff, name)
	if idx ~= -1 then
		table.remove(staff, idx)
	end
end)
