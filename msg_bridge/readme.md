# msg_bridge MOD

This module is an interface between minetest / lua mods and an external application

It communicates with a local webservice like the one defined into wsrabbit repository.

## Interface

Function|Description
--------|--------
msgBridge.send(msg)|Send a text message to the external application
msgBridge.register_on_msgs(callback)|Registers a callback to be called when messages income from external application

**Callback on messages is like that:**
```lua
function(msgs)
...
end
```
msgs is a table containing a list of messages received

**Important:** If you want to use this module into another minetest mod, you must add **msg_bridge** into the **"depends="** of the **mod.conf** file of the calling mod.

## Examples

### Send a message to external application
```lua
msgBridge.send({typ='chat',msg='Ceci est un message sur le chat externe'})
```

### Register a callback to manage incoming messages from external application
```lua
local myFunction=function(msgs)
  for _,msg in pairs(msgs) do
    ... Here we must manage msg ...
  end  
end

msgBridge.register_on_msgssend(myFunction);
```

