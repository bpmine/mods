unified_inventory.register_button("boujour", {
	type = "image",
	image = "bonjour.png",
	tooltip = "bonjour",
	hide_lite=true,
    action = function(player)
        name = player:get_player_name()
        minetest.show_formspec(name, "solpaul",
        "size[4,2]" ..
        "label[0,0;voulez vous dir bonjour?]" ..
        "button_exit[0,1;2,1;kill;oui]"..
        "button_exit[2,1;2,1;cancel;non]"
    )
	end,
	condition = function(player)
		return minetest.check_player_privs(player:get_player_name(), {privs=true})
	end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "solpaul" then
        if fields.kill then
            minetest.chat_send_all(minetest.colorize("#ff0000",
	    "[ADMINISTRATEUR] <" .. name .."> bonjour"))
        end
	end
end)
