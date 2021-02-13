-- PILOTAGE TOUR DE MINOU
--
-- Ce block permet d'afficher un menu de contrôle de la tour de minou
--

minetest.register_node("homekitdomotic:tour", {
        description = "Tour",
	groups={cracky=3},
        is_ground_content = false,
        tile_images = {"hkd_blocks_wood.png", "hkd_blocks_wood.png", "hkd_blocks_tour.png",
                "hkd_blocks_wood.png", "hkd_blocks_wood.png", "hkd_blocks_wood.png"},

	after_place_node = function(pos, placer)

	        local meta = minetest.get_meta(pos)
		meta:set_string("infotext","Clique droit pour piloter l'éclairage de la tour de minou")
    	end,
	
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)

                local formspec="size[4,3]"..
                "label[0,0;PILOTAGE DE LA TOUR DE MINOU]"..
                "label[0,0.5;En haut...]"..
		"button[0,1;1,1;haut;Vert]button[1,1;1,1;haut;Rouge]button[2,1;1,1;haut;Bleu]"..
                "label[0,2;En bas...]"..
		"button[0,2.5;1,1;bas;Vert]button[1,2.5;1,1;bas;Rouge]button[2,2.5;1,1;bas;Bleu]"

                minetest.show_formspec(player:get_player_name(),"homekitdomotic:tour",formspec)

        end,

})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname == "homekitdomotic:tour" then

        if fields.haut=="Vert" then
		domotic.tour.setHaut("g")
	elseif fields.haut=="Rouge" then
		domotic.tour.setHaut("r")
	elseif fields.haut=="Bleu" then
		domotic.tour.setHaut("b")
	end

        if fields.bas=="Vert" then
		domotic.tour.setBas("g")
	elseif fields.bas=="Rouge" then
		domotic.tour.setBas("r")
	elseif fields.bas=="Bleu" then
		domotic.tour.setBas("b")
	end

    end

end)

