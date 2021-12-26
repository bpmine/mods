-- HOME KIT DOMOTIQUE
--
-- Quelques interactions entre minetest et notre maison
-- en utilisant le MOD domotic
--

dofile(minetest.get_modpath("homekitdomotic") .. "/dallehue.lua")
--dofile(minetest.get_modpath("homekitdomotic") .. "/blockhue.lua")
dofile(minetest.get_modpath("homekitdomotic") .. "/tourminou.lua")

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

	if idCard=="ca32ffa9" then
		domotic.hue.on("bureau Paul")
		domotic.hue.on("Bureau")
	end
end

domotic.badge.register_on_card_inserted(cbCardInserted)


minetest.register_chatcommand("tv", {
    func = function(name)
	name="bureau Paul" 
       	domotic.hue.off(name)
    end,
})

