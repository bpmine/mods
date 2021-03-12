-- engine const
local SUNLIGHT = 1

-- mod config
local night_light = math.max(math.min(tonumber(minetest.settings:get("bright_night_light")) or 4, 15), 3)
local dawn = ({0.1979, 0.2049, 0.2118, 0.2170, 0.2216, 0.2259, 0.2299, 0.2339, 0.2374, 0.2409, 0.2443, 0.2497, 0.25})[night_light-2]
local dusk = ({0.7952, 0.7882, 0.7831, 0.7784, 0.7741, 0.7702, 0.7662, 0.7626, 0.7592, 0.7557, 0.7503, 0.7402, 0.74})[night_light-2]

-- mod active values
local night_mode = false

local function set_night(player)
	player:override_day_night_ratio(night_light / SUNLIGHT)
end

local function unset_night(player)
	player:override_day_night_ratio(nil)
end


-------------------------------------------
-- Example Cape                          --
-------------------------------------------
	armor:register_armor("3d_armor_flyswim:demo_cape", {
		description = "Someones Cape",
		inventory_image = "3d_armor_flyswim_demo_cape_inv.png",
		groups = {armor_capes=1, physics_speed=1.5, armor_use=1000},
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
		on_equip = function(player)
					local privs = minetest.get_player_privs(player:get_player_name())				
					privs.fly = true
					minetest.set_player_privs(player:get_player_name(), privs)
				  end,
				  
		on_unequip = function(player)
					local privs = minetest.get_player_privs(player:get_player_name())
					privs.fly = nil
					minetest.set_player_privs(player:get_player_name(), privs)
				  end,
	})
	armor:register_armor("3d_armor_flyswim:fort", {
		description = "Cape du fort",
		inventory_image = "3d_armor_flyswim_fort_inv.png",
		groups = {armor_capes=2, physics_speed=1.5, armor_use=1},
		armor_groups = {fleshy=1},
		damage_groups = {cracky=1, snappy=1, choppy=1, crumbly=1, level=1},
		on_equip = function(player)
					local privs = minetest.get_player_privs(player:get_player_name())				
					privs.fly = true
					minetest.set_player_privs(player:get_player_name(), privs)
					--player:override_day_night_ratio(night_light / SUNLIGHT)
				  end,
				  
		on_unequip = function(player)
					local privs = minetest.get_player_privs(player:get_player_name())
					privs.fly = nil
					minetest.set_player_privs(player:get_player_name(), privs)
					--player:override_day_night_ratio(nil)
				  end,
	})
