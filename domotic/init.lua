

domotic={}

print("Load domotic mod")

msgBridge.send({typ='chat',msg='Start of minetest domotic MOD'})

function domotic.sendChat(message)
	msgBridge.send({typ='chat',msg=message})
end

local listCB={}
function domotic.register_on_chat(callback)
	table.insert(listCB,callback)
end


function domotic.setHue(name,state)
	if (state==true) then
		msgBridge.send({typ='hue',name=name,cmd='on'})
	else
		msgBridge.send({typ='hue',name=name,cmd='on'})
	end
end

domotic.tour={}
function domotic.tour.setLeds(num_start,num_end,col)
	msgBridge.send({typ='tour',num_start=num_start,num_end=num_end,col=col})
end

function domotic.tour.setHaut(col)
	msgBridge.send({typ='tour',num_start=0,num_end=25,col=col})
end

function domotic.tour.setBas(col)
	msgBridge.send({typ='tour',num_start=26,num_end=33,col=col})
end



minetest.register_on_chat_message(function(name, message)
	domotic.sendChat(message)
	return false
end)


minetest.register_on_dignode(function(pos, oldnode, digger)

end)


minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)

end)

