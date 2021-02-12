--
-- Generic bridge between LUA minetest ecosystem and a local webservice
--
-- This module is a HTTP client that send messages to the server
-- and poll received messages from the server
--
-- Messages must be encoded with JSON
--
--To be used, the minetest.request_attp_api() must return a valid table
--
-- It doesn't do if:
--
--    - minetest (server) was not built with cURL support
--    - mod is not allowed to access to http fetch methods
--    - ...
--
-- See https://dev.minetest.net/minetest.request_http_api() for more details
--
--
-- The callers must use the global msgBridge variable to access to api
-- All mods that uses this mod must indicate it as a dependance to force it to be loaded first
--
-- Functions:
--
--   - msgBridge.send: Sends a message
--   - msgBridge.register_on_msgs: Register a callback to manage messages list reception
--

if msgBridge~=nil then
	error ("msgBridge was already defined. There is a conflit with another mod !!")
end

msgBridge={}

local _http=minetest.request_http_api()
if (_http==nil) then
	error("Impossible to load _haat. Check that this mod is inside secure.http_mods and secure.trusted_mods of the .conf file.")
end

function msgBridge.send(msg)
	if (_http==nil) then
		error("ERREUR NIL pour _http. Le mod doit avoir les droits de securite")
	end

	local cb=function (result)
	end

	local json=minetest.write_json(msg)
	_http.fetch({url="http://127.0.0.1:5000/send",method="POST",enctype="application/json",data=json},cb)

end

local function poll()
	if (_http==nil) then
		error("ERROR _http is NIL")
	end

	local h=_http.fetch_async({url="http://127.0.0.1:5000/poll"})
	local res=_http.fetch_async_get(h)
	while res==nil or res.completed==false do
		res=_http.fetch_async_get(h)
	end

	-- print(res.data)

	return minetest.parse_json(res.data)
end


local listCallbacks={}
function msgBridge.register_on_msgs(callback)
	if callback~=nil then
		table.insert(listCallbacks,callback)
	end
end

-- Execution periodique du polling pour consulter les messages entrants
local elapsed=0
minetest.register_globalstep(function(dtime)

        elapsed=elapsed+dtime
        if (elapsed>1) then
                local res=poll()

                if (res~=nil) and (res.result==true) then

			for _,cb in pairs(listCallbacks) do
				if (cb~=nil) then
					cb(res.msgs)
				end
			end
                end

                elapsed=0
        end
end)

