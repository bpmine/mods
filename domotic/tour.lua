-- Module fait par Bernard
--
-- Pilotage de la tour de Minou
--
-- 	- Faire toujours setHttp(http) en premier
-- 	- 'http' est obtenu en faisant "local http=minetest.request_http_api()"
-- 	    mais seulement a partir de "init.lua"
-- 	- Ensuite, on peut appeller les autres fonctions
-- 	- set_leds(0,33,'r') allume tout en rouge
-- 	- set_haut('b') allume le haut en bleu
-- 	- ...
--
--

local _M={}
local _cmd=nil;

function _M.setCmd(cmd)
	_cmd=cmd;
end	

function _M.set_leds(num_start,num_end,col)
	if (_cmd==nil) then
		return	
	end

	_cmd.send({typ='tour',src='minetest',num_start=num_start,num_end=num_end,col=col})

end

function _M.set_haut(col)
	_M.set_leds(0,25,col)
end

function _M.set_bas(col)
	_M.set_leds(26,33,col)
end

function _M.clearall()
	_M.set_leds(0,33,"0");
end

return _M
