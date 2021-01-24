minetest.register_craftitem("spinsmod:spins", {
   description = "lingot de spins",
   inventory_image = "spins.png",
   
})
minetest.register_craftitem("spinsmod:event", {
   description = "item légendaire",
   inventory_image = "event.png",
   
})
minetest.register_tool("spinsmod:sword", {
   description = "épée en spins",
   inventory_image = "sword.png",
   damage_groups = {fleshy=5}
   
})
minetest.register_craftitem("spinsmod:spins_bleu", {
   description = "lingot de spins bleu",
   inventory_image = "spins_bleu.png",
   
})
minetest.register_tool("spinsmod:houe", {
   description = "houe en spins",
   inventory_image = "houe.png"
})
minetest.register_tool("spinsmod:pioche", {
   description = "pioche en spins",
   inventory_image = "pioche.png",
   tool_capabilities = {
      full_punch_interval = 1.3,
      max_drop_level=0,
      groupcaps={
         cracky = {times={[2]=2.0, [3]=1.20}, uses=20, maxlevel=5},
      },
      damage_groups = {fleshy=3},
   },
   after_use = function(itemstack, user, node, digparams)
      itemstack:add_wear(digparams.wear)
      return itemstack
   end
})
minetest.register_tool("spinsmod:hammer", {
   description = "hammer en spins",
   inventory_image = "hammer.png",
   tool_capabilities = {
      full_punch_interval = 10.3,
      max_drop_level=0,
      groupcaps={
         cracky = {times={[1]=2.0, [0]=1.20}, uses=0, maxlevel=500},
      },
      damage_groups = {fleshy=20},
   },
   after_use = function(itemstack, user, node, digparams)
      itemstack:add_wear(digparams.wear)
      return itemstack
   end
})
minetest.register_tool("spinsmod:pioche_event", {
   description = "pioche légendaire",
   inventory_image = "pioche.png",
   tool_capabilities = {
      full_punch_interval = 1.3,
      max_drop_level=0,
      groupcaps={
         cracky = {times={[2]=2.0, [3]=1.20}, uses=30, maxlevel=5},
      },
      damage_groups = {fleshy=3},
   },
   after_use = function(itemstack, user, node, digparams)
      itemstack:add_wear(digparams.wear)
      return itemstack
   end
})
minetest.register_tool("spinsmod:pioche_bleu", {
   description = "pioche en spins bleu",
   inventory_image = "pioche_bleu.png",
   tool_capabilities = {
      full_punch_interval = 1.3,
      max_drop_level=0,
      groupcaps={
         cracky = {times={[2]=2.0, [3]=1.20}, uses=20, maxlevel=5},
      },
      damage_groups = {fleshy=3},
   },
   after_use = function(itemstack, user, node, digparams)
      itemstack:add_wear(digparams.wear)
      return itemstack
   end
})
minetest.register_craftitem("spinsmod:banane", {
	description = "banane en spins",
	inventory_image = "helloworld_hellopick2.png",
	on_use = function(itemstack, user, pointed_thing)
		hp_change = 20
		replace_with_item = nil

		minetest.chat_send_player(user:get_player_name(), "miam!")

		-- Support for hunger mods using minetest.register_on_item_eat
		for _ , callback in pairs(minetest.registered_on_item_eats) do
			local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing)
			if result then
				return result
			end
		end

		if itemstack:take_item() ~= nil then
			user:set_hp(user:get_hp() + hp_change)
		end

		return itemstack
	end
})
minetest.register_craftitem("spinsmod:poison", {
	description = "banane en spins",
	inventory_image = "helloworld_hellopick2.png",
	on_use = function(itemstack, user, pointed_thing)
		hp_change = -20
		replace_with_item = nil

		minetest.chat_send_player(user:get_player_name(), "vengence")

		-- Support for hunger mods using minetest.register_on_item_eat
		for _ , callback in pairs(minetest.registered_on_item_eats) do
			local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing)
			if result then
				return result
			end
		end

		if itemstack:take_item() ~= nil then
			user:set_hp(user:get_hp() + hp_change)
		end

		return itemstack
	end
})
minetest.register_node("spinsmod:block", {
    description = "bloc de spins",
    tiles = {"block.png"},
    is_ground_content = false,
    groups = {cracky=3}
})
minetest.register_craft({
	output = "spinsmod:pioche",
	recipe = {
		{'spinsmod:spins', 'spinsmod:spins', 'spinsmod:spins'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
        output = "spinsmod:houe",
        recipe = {
                {'spinsmod:spins', 'spinsmod:spins', ' '},
                {'', 'default:stick', ''},
                {'', 'default:stick', ''},
        }
})
minetest.register_node("spinsmod:solpaul", {
   description = "incassable!",
   inventory_image = "wool_magenta.png",
   tiles = {"wool_magenta.png"}
})
minetest.register_craft({
        output = "spinsmod:banane",
        recipe = {
                {'spinsmod:spins', 'spinsmod:spins', 'spinsmod:spins'},
                {'', '', ''},
                {'', 'spinsmod:poison', ''},
        }
})
minetest.register_craft({
        output = "spinsmod:poison",
        recipe = {
                {'default:apple', 'default:apple', 'default:apple'},
                {'default:apple', 'default:apple', 'default:apple'},
                {'default:apple', 'default:apple', 'default:apple'},
        }
})
minetest.register_craft({
        output = "spinsmod:spins",
        recipe = {
                {'spinsmod:poison', 'spinsmod:poison', 'spinsmod:poison'},
                {'default:dirt', 'default:cobble', 'default:dirt'},
                {'default:wood', 'default:cobble', 'default:wood'},
        }
})
minetest.register_craft({
        output = "spinsmod:pioche_bleu",
        recipe = {
                {'spinsmod:spins_bleu', 'spinsmod:spins_bleu', 'spinsmod:spins_bleu'},
                {'', 'default:stick', ''},
                {'', 'default:stick', ''},
        }
})
minetest.register_craft({
        output = "default:apple 9",
        recipe = {
                {'', '', ''},
                {'', 'bones:bones', ''},
                {'', '', ''},
        }
})
minetest.register_craft({
        output = "spinsmod:solpaul 16",
        recipe = {
                {'', 'spinsmod:spins', ''},
                {'spinsmod:spins', 'spinsmod:poison', 'spinsmod:spins'},
                {'', 'spinsmod:spins', ''},
        }
})
minetest.register_craft({
        output = "spinsmod:block",
        recipe = {
                {'spinsmod:spins', 'spinsmod:spins', 'spinsmod:spins'},
                {'spinsmod:spins', 'spinsmod:spins', 'spinsmod:spins'},
                {'spinsmod:spins', 'spinsmod:spins', 'spinsmod:spins'},
        }
})
minetest.register_craft({
        output = "spinsmod:spins 9",
        recipe = {
                {'', '', ''},
                {'', 'spinsmod:block', ''},
                {'', '', ''},
        }
})
minetest.register_craft({
        output = "spinsmod:sword",
        recipe = {
                {'', 'spinsmod:spins', ''},
                {'', 'spinsmod:spins', ''},
                {'', 'default:stick', ''},
        }
})
minetest.register_craft({
        output = "spinsmod:pioche_event",
        recipe = {
                {'spinsmod:event', 'spinsmod:event', 'spinsmod:event'},
                {'spinsmod:event', 'default:stick', 'spinsmod:event'},
                {'', 'default:stick', ''},
        }
})




