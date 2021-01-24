minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		if not player or not player:is_player() then
			return
		end
		minetest.chat_send_player(player:get_player_name(), "[FRANCJOUEUR] bienvenue à toi sur francium.")
	--	minetest.chat_send_all(minetest.colorize("#ff0000",
	--	"[FRANCINFO] Le serveur est en maintenance"))
		minetest.log("warning", "[FRANCPLAYER] Bienvenue à toi")
	end
	minetest.after(2.0, cb, player)
end)
