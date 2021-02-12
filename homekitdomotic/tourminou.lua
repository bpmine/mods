

minetest.register_node("homekitdomotic:tour", {
        description = "Tour",
        is_ground_content = false,
        tile_images = {"hkd_blocks_wood.png", "hkd_blocks_wood.png", "hkd_blocks_tour.png",
                "hkd_blocks_wood.png", "hkd_blocks_wood.png", "hkd_blocks_wood.png"},

	on_rightclick = function(pos, node, player, itemstack, pointed_thing)

                context[player:get_player_name()]=pos


                if node.hue_name==nil then
                        node.hue_name=""
                end

                meta=minetest.get_meta(pos)
                node.hue_name=meta:get_string("hue_name")

                formspec="size[8,3]"..
                "label[0,0;CONFIGURATION DE LA DALLE DOMOTIQUE]"..
                "field[1,1.5;6,1;name;Nom de l'équipement HUE;".. node.hue_name .."]"..

                "button_exit[1,2;2,1;exit;Sauver]"

                minetest.show_formspec(player:get_player_name(),"homekitdomotic:dalle_cfg",formspec)

        end,

})

