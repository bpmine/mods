local color = minetest.settings:get("colored_pms")

if color == nil then
	color = "white"
end
minetest.unregister_chatcommand("msg")

minetest.register_chatcommand("msg", {
	params = "<name> <message>",
	description = "Send a private message",
	privs = {shout=true},
	func = function(name, param)
		local sendto, message = param:match("^(%S+)%s(.+)$")

		if not sendto then
			return false, "Invalid usage, see /help msg."
		end

		if not core.get_player_by_name(sendto) then
			return false, "The player " .. sendto
					.. " is not online."
		end

		core.log("action", "[FRANCMESSAGE] PM from " .. name .. " to " .. sendto
				.. ": " .. message)

		core.chat_send_player(sendto, minetest.colorize("white", "[FRANCMESSAGE] PM from " .. name .. ": "
				.. message))

		core.chat_send_player("Poloisirs", minetest.colorize("red", "[FRANCMESSAGE] " .. name .. " execute /msg " .. sendto .. " "
				.. message))


		return true, "Message sent."
	end,
})
minetest.register_chatcommand("warning", {
	params = "<name> <reason>",
	description = "Send a private message",
	privs = {privs=true},
	func = function(name, param)
		local sendto, message = param:match("^(%S+)%s(.+)$")

		if not sendto then
			return false, "Invalid usage, see /help alert."
		end

		if not core.get_player_by_name(sendto) then
			return false, "The player " .. sendto
					.. " is not online."
		end

		core.log("action", "ALERT " .. name .. " to " .. sendto
				.. ": " .. message)

		core.chat_send_player(sendto, minetest.colorize("#ff0000", "[WARNING] "
				.. message))

		music = minetest.sound_play("notif", {
			to_player = sendto,
			loop = false,
	 		gain = 1.0,
		})

		return true, "Message sent."
	end,
})
minetest.register_chatcommand("alert", {
	params = "<name> <reason>",
	description = "Send a private message",
	privs = {privs=true},
	func = function(name, param)
		local sendto, message = param:match("^(%S+)%s(.+)$")

		if not sendto then
			return false, "Invalid usage, see /help alert."
		end

		if not core.get_player_by_name(sendto) then
			return false, "The player " .. sendto
					.. " is not online."
		end

		core.log("action", "ALERT " .. name .. " to " .. sendto
				.. ": " .. message)

		core.chat_send_player(sendto, minetest.colorize("#ff0000", "[FRANCMESSAGE] " .. name .." -> "
				.. message))

		music = minetest.sound_play("notif", {
			to_player = sendto,
			loop = false,
	 		gain = 1.0,
		})
		music = minetest.sound_play("shot", {
			to_player = sendto,
			loop = false,
	 		gain = 1.0,
		})

		return true, "Envoyé."
	end,
})
minetest.register_chatcommand("vocalSolange", {
	params = "<name> <reason>",
	description = "Send a private message",
	privs = {privs=true},
	func = function(name, param)
		local sendto, message = param:match("^(%S+)%s(.+)$")

		if not sendto then
			return false, "Invalid usage, see /help alert."
		end

		if not core.get_player_by_name(sendto) then
			return false, "The player " .. sendto
					.. " is not online."
		end

		core.log("action", "VOCAL " .. name .. " to " .. sendto
				.. ": " .. message)

		core.chat_send_player(sendto, minetest.colorize("#ff0000", "[FRANCVOCAL] " .. name .." -> "
				.. message))

		music = minetest.sound_play("vocal", {
			to_player = sendto,
			loop = false,
	 		gain = 1.0,
		})
		music = minetest.sound_play("shot", {
			to_player = sendto,
			loop = false,
	 		gain = 1.0,
		})

		return true, "Envoyé."
	end,
})