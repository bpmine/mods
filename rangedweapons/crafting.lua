----------------------------
----------------------------

minetest.register_craft({
	output = "rangedweapons:ak47",
	recipe = {
		{"default:diamond", "default:steel_ingot", "default:tree"},
		{"default:tree", "default:mese", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:762mm 50",
	recipe = {
		{"default:bronze_ingot", "tnt:gunpowder", "default:bronze_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
	}
})