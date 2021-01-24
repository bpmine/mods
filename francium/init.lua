minetest.register_craftitem("francium:ingot", {
   description = "Lingot de francium",
   inventory_image = "francium_ingot.png",
   
})
minetest.register_craftitem("francium:lump", {
   description = "Pépite de francium",
   inventory_image = "francium_lump.png",
   
})
minetest.register_craftitem("francium:money", {
   description = "Money",
   inventory_image = "money.png",
   
})
minetest.register_node("francium:block", {
    description = "Bloc de francium",
    tiles = {"francium_block.png"},
    is_ground_content = false,
    paramtype = "light",
    groups = {cracky=3},
    light_source = 3,
})
minetest.register_node("francium:gost", {
	description = "Gost block",
	-- drawtype = "plantlike",
	tiles ={"stone.png"},
	-- inventory_image = "default_apple.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	groups = {cracky = 3, not_in_creative_inventory=1, },
	drop = "default:cobble",
	-- drop = "",
	-- groups = {dig_immediate=3},

	-- Make eatable because why not?
	-- on_use = minetest.item_eat(2),
})
minetest.register_node("francium:fake", {
	groups={immortal=1, not_in_creative_inventory=1, },
	tiles={"unknown_node.png"},
	description="unknown_node",
	-- drawtype = "normal",
	-- sounds = default.node_sound_stone_defaults(),
	diggable = false,
	aramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drawtype = "glasslike",
	-- groups = {cracky = 3, oddly_breakable_by_hand = 3},
	-- sounds = default.node_sound_glass_defaults(),
	-- light_source = default.LIGHT_MAX,
})
minetest.register_node("francium:ores", {
	description = "Minerais de francium",
	tiles = {"default_stone.png^francium_ores.png"},
	groups = {cracky = 1},
	drop = "francium:lump",
	paramtype = "light",
	-- sounds = default.node_sound_stone_defaults(),
	light_source = 55,
})
minetest.register_tool("francium:pick", {
	description = "Pioche en francium",
	inventory_image = "francium_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})
minetest.register_tool("francium:shovel", {
	description = "Pelle en francium",
	inventory_image = "francium_shovel.png",
	-- wield_image = "default_tool_diamondshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})
minetest.register_tool("francium:axe", {
	description = "Hache en francium",
	inventory_image = "francium_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})
minetest.register_tool("francium:sword", {
	description = "épée en francium",
	inventory_image = "francium_sword.png",
	tool_capabilities = {
		full_punch_interval = 2.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})
minetest.register_tool("francium:sword_pvp", {
	description = "épée en francium(pvp)",
	inventory_image = "francium_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=2, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})
minetest.register_tool("francium:legens_dieu_foudre", {
	description = "Baton de pouvoir dieu",
	inventory_image = "legens_dieu_foudre.png",
	tool_capabilities = {
		full_punch_interval = 0.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=15},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1, not_in_creative_inventory=1,}
})
minetest.register_tool("francium:legens_dieu_foudre_adm", {
	description = "Baton de pouvoir dieu",
	inventory_image = "legens_dieu_foudre.png",
	tool_capabilities = {
		full_punch_interval = 0.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=15},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1, not_in_creative_inventory=1,}
})
minetest.register_craft({
	output = "francium:block",
	recipe = {
		{'francium:ingot', 'francium:ingot', 'francium:ingot'},
		{'francium:ingot', 'francium:ingot', 'francium:ingot'},
		{'francium:ingot', 'francium:ingot', 'francium:ingot'},
	}
})
minetest.register_craft({
	output = "francium:ingot 9",
	recipe = {
		{'', '', ''},
		{'', 'francium:block', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = "francium:pick",
	recipe = {
		{'francium:ingot', 'francium:ingot', 'francium:ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = "francium:shovel",
	recipe = {
		{'', 'francium:ingot', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = "francium:axe",
	recipe = {
		{'francium:ingot', 'francium:ingot', ''},
		{'francium:ingot', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = "francium:sword",
	recipe = {
		{'', 'francium:ingot', ''},
		{'', 'francium:ingot', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = "francium:legens_dieu_foudre",
	recipe = {
		{'francium:sword', 'francium:ingot', 'francium:sword'},
		{'francium:ingot', 'default:stick', 'francium:ingot'},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	type = "cooking",
	output = "francium:ingot",
	recipe = "francium:lump",
})
minetest.register_craft({
	type = "cooking",
	output = "francium:legens_dieu_foudre",
	recipe = "francium:legens_dieu_foudre",
})
minetest.register_craft({
	type = "cooking",
	output = "francium:ingot",
	recipe = "default:mese_crystal",
})
minetest.register_craft({
	type = "cooking",
	output = "francium:money",
	recipe = "spinsmod:poison",
})
minetest.register_chatcommand("top", {
	params = "",
	description = "Teleport to topmost block at your current position",
	privs = {interact = true},
	func = function(player_name, param)
		curr_pos = minetest.get_player_by_name(player_name):getpos()
		curr_pos["y"] = math.ceil(curr_pos["y"]) + 0.5

		while minetest.get_node(curr_pos)["name"] ~= "ignore" do
			curr_pos["y"] = curr_pos["y"] + 1
		end

		curr_pos["y"] = curr_pos["y"] - 0.5

		while minetest.get_node(curr_pos)["name"] == "air" do
			curr_pos["y"] = curr_pos["y"] - 1
		end
		curr_pos["y"] = curr_pos["y"] + 0.5

		minetest.get_player_by_name(player_name):setpos(curr_pos)
		return
	end
})
minetest.register_chatcommand("addprivs", {
    params = "<name>, <privs>",
    privs = {
	-- autobot = true,
        privs = true,
    },
    func = function(name, param)
	minetest.chat_send_all(minetest.colorize("#ff0000",
	"[FRANCSTAFF] " .. param .. " à recu des privilège de " .. name))
	minetest.log("action", "[FRANSTAFF] " .. param .. " à recu des privilège de " .. name)
        return true, ""
    end,
})
minetest.register_chatcommand("rmprivs", {
    params = "<name>, <privs>",
    privs = {
	-- autobot = true,
        privs = true,
    },
    func = function(name, param)
	minetest.chat_send_all(minetest.colorize("#ff0000",
	"[FRANCSTAFF] " .. param .. " à perdu des privilège de " .. name))
	minetest.log("action", "[FRANSTAFF] " .. param .. " à perdu des privilège de " .. name)
        return true, ""
    end,
})

minetest.register_chatcommand("info", {
    params = "<msg>",
    privs = {
	-- autobot = true,
        privs = true,
    },
    func = function(name, param)
	minetest.chat_send_all(minetest.colorize("#ff0000",
	"[FRANCINFO] " .. param))
	minetest.log("action", "[FRANCINFO] " .. param)
        return true, ""
    end,
})
minetest.register_privilege("list", {
	description = "Permet d'executer le /list.",
	give_to_singleplayer = false,
	give_to_admin = true
})
minetest.register_chatcommand("list", {
	privs = {
		list = true
	},
	func = function(name, param)
		return true, ""
	end
})
-- game_commands/init.lua

-- Load support for MT game translation.
local S = minetest.get_translator("game_commands")


minetest.register_chatcommand("feed", {
	privs = {
		fly = true
	},
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if player then
			if minetest.settings:get_bool("enable_damage") then
				player:set_hp(20)
				return true
			else
				for _, callback in pairs(minetest.registered_on_respawnplayers) do
					if callback(player) then
						return true
					end
				end

				-- There doesn't seem to be a way to get a default spawn pos
				-- from the lua API
				return false, S("No static_spawnpoint defined")
			end
		else
			-- Show error message if used when not logged in, eg: from IRC mod
			return false, S("You need to be online to be killed!")
		end
	end
})
