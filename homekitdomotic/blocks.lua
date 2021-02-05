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
		
	}
})