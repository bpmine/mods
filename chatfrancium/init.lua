--minetest.register_on_prejoinplayer(function(name, ip)
--	return "Francium@erreur:] Le serveur est en maintenance"
--end)


minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		if not player or not player:is_player() then
			return
		end
		--minetest.chat_send_player(player:get_player_name(), "Francium@player:] " .. player:get_player_name() .. " rejoin le serveur.")
		local has, missing = minetest.check_player_privs(player:get_player_name(), {
        	privs = true})

		if has then
			if player:get_player_name()=="Admin" then
				prop = {
      				visual_size = {x = 0, y = 0},
      				collisionbox = {0, 0, 0, 0, 0, 0},
    				}
    				player:set_nametag_attributes({
      				color = {a = 0, r = 255, g = 0, b = 0},
				text = ("Francium@staff: Administrateur] Poloisirs"),
    				})
			elseif player:get_player_name()=="Admin2" then
				prop = {
      				visual_size = {x = 0, y = 0},
      				collisionbox = {0, 0, 0, 0, 0, 0},
    				}
    				player:set_nametag_attributes({
      				color = {a = 0, r = 255, g = 0, b = 0},
				text = ("Francium@staff: Administrateur] Solange"),
    				})
			else

    				prop = {
      				visual_size = {x = 0, y = 0},
      				collisionbox = {0, 0, 0, 0, 0, 0},
    				}
    				player:set_nametag_attributes({
      				color = {a = 0, r = 255, g = 0, b = 0},
				text = ("Francium@staff: Administrateur] " .. player:get_player_name()),
    				})
			end
		else
    		prop = {
      		visual_size = {x = 0, y = 0},
      		collisionbox = {0, 0, 0, 0, 0, 0},
    		}
    		player:set_nametag_attributes({
      		color = {a = 0, r = 255, g = 255, b = 255},
		text = ("Francium@joueur: Joueur] " .. player:get_player_name()),
    		})
		end
	end
	minetest.after(2.0, cb, player)
end)

minetest.register_on_leaveplayer(function(player)
	local cb = function(player)
		if not player or not player:is_player() then
			return true
		end
		--minetest.chat_send_player(player:get_player_name(), "Francium@player: " .. name .. "] Quitte le serveur.")
	end
	minetest.after(2.0, cb, player)
end)

minetest.register_on_chat_message(function(name, message)
    if minetest.check_player_privs(name, {interact=true, shout=true, home=true}) then
	minetest.chat_send_all("Survie]: Francium@chat: " .. name .. "] " .. message)
    else
	minetest.chat_send_player(name, "Francium@chat:] Impossible de parler dans le chat.")
    end
    
    return true
end)

minetest.register_chatcommand("cache", {
    privs = {
        multihome = true,
    },
    func = function(name, param)
	local player = minetest.get_player_by_name(name)
        prop = {
      		visual_size = {x = 0, y = 0},
      		collisionbox = {0, 0, 0, 0, 0, 0},
    		}
    		player:set_nametag_attributes({
      		color = {a = 0, r = 0, g = 0, b = 0},
    	})
    end,
}) 

minetest.register_chatcommand("co", {
    privs = {
        multihome = true,
    },
    func = function(name, param)
	local player = minetest.get_player_by_name(name)
        local object = minetest.get_player_by_name(param)
	local pos    = object:get_pos()
	minetest.chat_send_player(name, "Francium@co: " .. name .. "] se trouve en " .. param:get_pos())
    end,
}) 

minetest.register_chatcommand("stop", {
    privs = {
        server = true,
    },
    func = function(name, param)
	minetest.chat_send_all("Francium@info: Le serveur ferme dans 15 secondes... "
	.."Revenez bientôt")
	minetest.after(15, minetest.request_shutdown)
    end,
}) 

minetest.register_chatcommand("kickall", {
    privs = {
        server = true,
    },
    func = function(name, param)
	for _,player in pairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local privs = minetest.get_player_privs(name)
		if not privs.multihome then
			minetest.kick_player(name, "Francium@kick: Vous avez été kick pour libérer de la place sur le serveur.")
			minetest.register_on_prejoinplayer(function(name, ip)
			if name==admin then
				return "Francium@erreur:] Il y a trop de joueurs sur le serveur."
			else
			end
			end)

		else
			minetest.chat_send_player(name, "Francium@kick: Vous n'avez pas été kick pour libérer de la place...")
		end
	end
    end,
}) 

-- Show form when the /formspec command is used.
minetest.register_chatcommand("nick", {
	privs = {
        multihome = true,
    	},
	func = function(name, param)
		minetest.show_formspec(name, "mymod:form",
				"size[4,3]" ..
				"label[0,0;Bonjour, " .. name .. "]" ..
				"field[1,1.5;3,1;name;Pseudo;]" ..
				"button_exit[1,2;2,1;exit;Changer le pseudo]")
	end
})

-- Register callback
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "mymod:form" then
		-- Formname is not mymod:form,
		-- exit callback.
		return false
	end
	--local player = minetest.get_player_by_name(name)
        prop = {
      		visual_size = {x = 0, y = 0},
      		collisionbox = {0, 0, 0, 0, 0, 0},
    		}
    		player:set_nametag_attributes({
      		color = {a = 0, r = 255, g = 255, b = 255},
		text = ("Francium@joueur: Joueur] " .. fields.name),
    	})
	return true
end)
