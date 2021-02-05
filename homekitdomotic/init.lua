-- HOME KIT DOMOTIQUE
--
-- Quelques interactions entre minetest et notre maison
-- en utilisant le MOD domotic
--

dofile(minetest.get_modpath("homekitdomotic") .. "/blocks.lua")

domotic.chat.send('Start of minetest HOME KIT DOMOTIC MOD')


local function cbMsgReception(dst,msg)
	print("MESSAGE RECU")
	print(msg)
	if (dst=='all') then
		minetest.chat_send_all(msg)
	else	
		minetest.chat_send_player(dst,msg)

	end
end	

-- Relayage du chat
domotic.chat.register_on_msg(cbMsgReception)


-- Quand une carte est inseree
local function cbCardInserted(idCard)
	minetest.chat_send_all("Carte " .. idCard .. " inseree")
end

domotic.badge.register_on_card_inserted(cbCardInserted)


local function get_formspec(name)
    -- TODO: display whether the last guess was higher or lower
    local text = "I'm thinking of a number... Make a guess!"

    local formspec = {
        "formspec_version[4]",
        "size[6,3.476]",
        "label[0.375,0.5;", minetest.formspec_escape(text), "]",
        "field[0.375,1.25;5.25,0.8;number;Number;]",
        "button[1.5,2.3;3,0.8;guess;Guess]"
    }

    -- table.concat is faster than string concatenation - `..`
    return table.concat(formspec, "")
end

local function show_to(name)
    minetest.show_formspec(name, "guessing:game", get_formspec(name))
end

minetest.register_chatcommand("game", {
    func = function(name)
        show_to(name)
    end,
})


minetest.register_chatcommand("tv", {
    func = function(name)
	name="bureau Paul" 
       	domotic.hue.off(name)
    end,
})

