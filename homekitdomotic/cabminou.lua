-- PILOTAGE CABANE DE MINOU
--
-- Ce block permet d'afficher un menu de contrôle de la cabane de minou
--

minetest.register_node("homekitdomotic:cabminou", {
        description = "Cabane du minou",
	groups={cracky=3},
        is_ground_content = false,
        tile_images = {"hkd_blocks_wood.png", "hkd_blocks_wood.png", "hkd_blocks_cabane.png",
                "hkd_blocks_wood.png", "hkd_blocks_wood.png", "hkd_blocks_wood.png"},

	after_place_node = function(pos, placer)

	        local meta = minetest.get_meta(pos)
		meta:set_string("infotext","Clique droit pour piloter l'éclairage de la cabane de minou")
    	end,
	
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)

                local formspec="size[6,7]"..
                "label[0,0;PILOTAGE DE LA CABANE DE MINOU]"..
                "label[0,0.5;En haut...]"..
				"button[0,1;1,1;haut;Vert]button[1,1;1,1;haut;Rouge]button[2,1;1,1;haut;Bleu]"..
                "label[0,2;En bas...]"..
				"button[0,2.5;1,1;bas;Vert]button[1,2.5;1,1;bas;Rouge]button[2,2.5;1,1;bas;Bleu]"..
				"label[0,3.5;Animation en haut]"..
				"button[0,4;1,1;animhaut;1]button[1,4;1,1;animhaut;2]button[2,4;1,1;animhaut;3]"
				"label[0,5.5;Animation en bas]"..
				"button[0,6;1,1;animbas;1]button[1,6;1,1;animbas;2]button[2,6;1,1;animbas;3]"

                minetest.show_formspec(player:get_player_name(),"homekitdomotic:cabminou",formspec)

        end,

})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname == "homekitdomotic:cabminou" then

        if fields.haut=="Vert" then
			domotic.cabane.haut.enableAnim(false)
			domotic.cabane.haut.setCol("g")
		elseif fields.haut=="Rouge" then
			domotic.cabane.haut.enableAnim(false)
			domotic.cabane.haut.setCol("r")
		elseif fields.haut=="Bleu" then
			domotic.cabane.haut.enableAnim(false)
			domotic.cabane.haut.setCol("b")
		end

        if fields.bas=="Vert" then
			domotic.cabane.bas.enableAnim(false)
			domotic.cabane.bas.setCol("g")
		elseif fields.bas=="Rouge" then
			domotic.cabane.bas.enableAnim(false)
			domotic.cabane.bas.setCol("r")
		elseif fields.bas=="Bleu" then
			domotic.cabane.bas.enableAnim(false)
			domotic.cabane.bas.setCol("b")
		end

		PROG_1_CABANE='D2LrAWLgAWLbAW*'

		if fields.animhaut=="1" then
			domotic.cabane.haut.enableAnim(false)
			domotic.cabane.haut.setAnimProg(PROG_1_CABANE)
			domotic.cabane.haut.enableAnim(true)
		elseif fields.animhaut=="2" then
			domotic.cabane.haut.enableAnim(false)
			domotic.cabane.haut.setAnimProg("Z")
			domotic.cabane.haut.enableAnim(true)
		elseif fields.animhaut=="3" then
			domotic.cabane.haut.enableAnim(false)
			domotic.cabane.haut.setAnimProg("Z")
			domotic.cabane.haut.enableAnim(true)
		end

		if fields.animbas=="1" then
			domotic.cabane.bas.enableAnim(false)
			domotic.cabane.bas.setAnimProg(PROG_1_CABANE)
			domotic.cabane.bas.enableAnim(true)
		elseif fields.animbas=="2" then
			domotic.cabane.bas.enableAnim(false)
			domotic.cabane.bas.setAnimProg("Z")
			domotic.cabane.bas.enableAnim(true)
		elseif fields.animbas=="3" then
			domotic.cabane.bas.enableAnim(false)
			domotic.cabane.bas.setAnimProg("Z")
			domotic.cabane.bas.enableAnim(true)
		end

    end

end)

