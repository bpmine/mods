minetest.register_craftitem("rename:seal", {
	description = "A seal",
	inventory_image = "seal.png",
})


minetest.register_privilege("rename", {
	description = "Can rename Items and Nodes",
	give_to_singleplayer = false
})



minetest.register_chatcommand("rename", {
    func = function(name, param)
        minetest.show_formspec(name, "rename:renameform",
                "size[4,4.5]" ..
                "label[0,0;rename]" ..
                "field[1,1.5;3,1;name;New Node/Item name;]" ..
								"field[1,2.5;3,1;color;New Color;]" ..
                "button_exit[1,3;2,1;exit;Rename Now!]")
    end
})


minetest.register_on_player_receive_fields(function(player,
        formname, fields)
    if formname ~= "rename:renameform" then

        return false
    end


    ----------------------------------------------
    local has, missing = minetest.check_player_privs(player:get_player_name(), {
            rename = true})

    if has then
      local itemstack = player:get_wielded_item()
      local meta = itemstack:get_meta()
      meta:set_string("description", fields.name)
			meta:set_string("color", fields.color)
      player:set_wielded_item(itemstack)

      return true
    else
        minetest.chat_send_player(player:get_player_name(), "You have no privilige to rename things :( ")
    end






end)
