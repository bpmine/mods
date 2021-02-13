-- BLOCK DE DALLE MAGIQUE
--
-- Allume une lampe hue lorsqu'un joueur monte dessus
--
--

local context={}

minetest.register_on_leaveplayer(function(player)
      local name = player:get_player_name()
      context[name] = nil
end)


minetest.register_node("homekitdomotic:dalle", {
	description = "Dalle de commande Hue",
	drawtype = "nodebox",
	paramtype = "light",
	is_ground_content = false,
	tiles = {"hkd_blocks_dalle_hue.png"},
	groups={cracky=3},
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		--fixed = {
			--{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			--{-0.5, 0, 0, 0.5, 0, 0.5},
			--{-0.5, 0, 0, 0.5, 0.5, 0.5},
			--{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
			--{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5},
			--{-0.5, 0.0, -0.5, 0.0, 0.5, 0.0},
		
	},
	on_blast=function(pos,intensity)
	
	end,

	after_place_node = function(pos, placer)

                local meta = minetest.get_meta(pos)
                meta:set_string("infotext","Clic droit pour configurer la dalle")
        end,

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


minetest.register_on_player_receive_fields(function(player, formname, fields)

        if formname == "homekitdomotic:dalle_cfg" then

		local pos=context[player:get_player_name()]

                if (pos~=nil) then
                        local nme=fields["name"]
			if nme==nil then
				nme=""
			end

                        meta=minetest.get_meta(pos)
                        meta:set_string("hue_name",nme)
			meta:set_string("infotext","Monter dessus pour allumer "..nme)

                        context[player:get_player_name()]=nil
                end
        end
end)



-- Table contenant la liste des lampes actives en ce moment
--
-- old: Valeur precedente
-- new: Nouvelle valeur
--
local allumes={}


-- Toutes les 100 ms on detecte si un joueur se trouve sur une dalle magique
local state=false
local elapsed=0
minetest.register_globalstep(function(dtime)

        elapsed=elapsed+dtime
        if (elapsed>0.1) then
                local players=minetest.get_connected_players()
                local nme=nil

		-- Tous les new sont mis a false par defaut
		-- On mettra a true ceux qui correspondent a une dalle avec un joueur dessus
                for _,a in pairs(allumes) do
                        a.new=false
                end

		-- Detecte les dalles avec un joueur dessus
                for _,p in pairs(players) do
                        local pos=p:get_pos()
                        local node = minetest.get_node(pos)
                        if (node.name=="homekitdomotic:dalle") then
                                local meta=minetest.get_meta(pos)
                                nme=meta:get_string("hue_name")

				if (nme~=nil) and (nme~="") then
                                	if (allumes[nme]==nil) then
                                        	allumes[nme]={old=false,new=true}
                                	else
                                        	allumes[nme].new=true
                                	end
				end	
                        end
                end

		-- Si l'etat d'une lampe doit changer, on l'applique
                for nme,a in pairs(allumes) do
                        if a.old~=a.new then
                                if (a.new==true) then
                                        domotic.hue.on(nme)
                                else
                                        domotic.hue.off(nme)
                                end

                                a.old=a.new
                        end
                end

        end
end)

