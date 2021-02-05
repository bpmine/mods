minetest.register_node("homekitdomotic:dalle", {
	description = "Dalle de detection",
	drawtype = "nodebox",
	paramtype = "light",
	is_ground_content = false,
	tiles = {"hkd_blocks_dalle.png"},
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
		domotic.hue.off("bureau Paul")
		domotic.hue.off("Lampe Paul")
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		domotic.hue.on("bureau Paul")
		domotic.hue.on("Lampe Paul")
	end,
	hue_name="bureau Paul"
})
minetest.register_node("homekitdomotic:tour", {
	description = "Tour",
	is_ground_content = false,
	tile_images = {"hkd_blocks_wood.png", "hkd_blocks_wood.png", "hkd_blocks_tour.png",
		"hkd_blocks_wood.png", "hkd_blocks_wood.png", "hkd_blocks_wood.png"},
})

-- Toutes les 100 ms on detecte si un joueur se trouve sur une dalle magique
local state=false
local elapsed=0
minetest.register_globalstep(function(dtime)

        elapsed=elapsed+dtime
        if (elapsed>0.1) then
		local players=minetest.get_connected_players()
		local new_state=false
		for _,p in pairs(players) do
			pos=p:get_pos()
			node = minetest.get_node(pos)
			if (node.name=="homekitdomotic:dalle") then
				new_state=true
			end
		end

		if (new_state~=state) then
			if (new_state==true) then
				domotic.hue.on("bureau Paul")
			else
				domotic.hue.off("bureau Paul")
			end

			state=new_state
		end
	end
end)

