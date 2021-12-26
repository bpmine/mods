-- MOD DOMOTIC
--
-- This module offers an API to access to domotic functions of our home
--
-- domotic.hue.set: Set a Hue light
--
-- domotic.chat.send: Send a message (like a chat)
-- domotic.chat.register_on_msg: Register a callback to manage incoming messages
--
-- domotic.tour.setLeds: Set LEDs of cat's tower
-- domotic.tour.setHaut: set roof LEDs
-- domotic.tour.setBas: set inside LEDs
--

domotic={}

print("Load domotic mod")

msgBridge.send({typ='chat',msg='Start of minetest domotic MOD'})

domotic.chat={}
function domotic.chat.send(message)
	msgBridge.send({typ='chat',msg=message})
end

local listCbsChat={}
function domotic.chat.register_on_msg(callback)
	if (callback~=nil) then
		table.insert(listCbsChat,callback)

	end
end	

domotic.hue={}
function domotic.hue.set(name,state)

	print("set hue: " .. name .. ": " .. tostring(state))

	if (state==true) then
		msgBridge.send({typ='hue',name=name,cmd='on'})
	else
		msgBridge.send({typ='hue',name=name,cmd='off'})
	end
end

function domotic.hue.on(name)
	domotic.hue.set(name,true)
end

function domotic.hue.off(name)
	domotic.hue.set(name,false)
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

function domotic.tour.setAnimProg(prog)
        msgBridge.send({typ='tour',prog=prog})
end

function domotic.tour.enableAnim(enable)
        msgBridge.send({typ='tour',anim=enable})
end

function domotic.tour.setWdgTime(time)
        msgBridge.send({typ='tour',wdg_time=time})
end

function domotic.tour.setWdgEnable(enable)
        msgBridge.send({typ='tour',wdg_enable=enable})
end

domotic.cabane={}
function domotic.cabane.setWdgTime(time)
        msgBridge.send({typ='cabane',wdg_time=time})
end

function domotic.cabane.setWdgEnable(enable)
        msgBridge.send({typ='cabane',wdg_enable=enable})
end

domotic.cabane.haut={}
function domotic.cabane.haut.setLeds(num_start,num_end,col)
	msgBridge.send({typ='cabh',num_start=num_start,num_end=num_end,col=col})
end

function domotic.cabane.haut.setAnimProg(prog)
        msgBridge.send({typ='cabh',prog=prog})
end

function domotic.cabane.haut.enableAnim(enable)
        msgBridge.send({typ='cabh',anim=enable})
end

domotic.cabane.bas={}
function domotic.cabane.bas.setLeds(num_start,num_end,col)
	msgBridge.send({typ='cabb',num_start=num_start,num_end=num_end,col=col})
end

function domotic.cabane.bas.setAnimProg(prog)
        msgBridge.send({typ='cabb',prog=prog})
end

function domotic.cabane.bas.enableAnim(enable)
        msgBridge.send({typ='cabb',anim=enable})
end


domotic.badge={}
local lstCbsBadge={}
domotic.badge.register_on_card_inserted=function(callback)
	if (callback~=nil) then
		table.insert(lstCbsBadge,callback)
	end
end


local cbMsgsReception=function(msgs)
	for i,m in pairs(msgs) do
		local event=minetest.parse_json(m.msg)

		if event.typ=="chat" then
			if event.dst~=nil and event.msg~=nil then
				for _,cb in pairs(listCbsChat) do
					cb(event.dst,event.msg)
				end
			end	
		elseif event.typ=="badge" then
			if event.id~=nil then
				for _,cb in pairs(lstCbsBadge) do
					cb(event.id)
				end
			end
		end

	end
end

msgBridge.register_on_msgs(cbMsgsReception)


