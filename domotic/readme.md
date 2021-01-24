# domotic MOD

This module is an interface to control our home equipments

**Important:** If you want to use this module into another minetest mod, you must add **domotic** into the **"depends="** of the **mod.conf** file of the calling mod.

## Functions

### External chat functions
Function | Description
-- | --
domotic.chat.send(msg)|Sends a message to the external chat
domotic.chat.register_on_msg(callback)|Register a callback function to manage a message incoming from the external chat

### Control Hue Lights
Function | Description
-- | --
domotic.hue.on(name)|Light on the given light
domotic.hue.off(name)|Light off the given light
domotic.hue.set(name)|Set on or off the given light

### Control the cat's tower LEDs
Function | Description
-- | --
domotic.tour.set(num_start,num_end,color)|Set a color for the given LEDs
domotic.tour.setHaut(color)|Set a color for the LEDs on the roof of the tower
domotic.tour.setBas(color)|Set a color for the LEDs inside the tower

**Colors are:**
- "r" : Red
- "g" : Green
- "b" : Blue
- "w" : White
- "0" : Black (Zero)
- ...

***NB:*** See the arduino cattower project for more details. 

## Examples

### Manage external chat

The following example send a message to external chat and displays all incoming messages

```lua
domotic.chat.send("Ceci est un message vers l'exterieur")

local myFunc=function(msg)
  print("Message " .. " received!")
end

domotic.chat.register_on_msg(myFunc)
```

### Manage Hue

The following example turns on "bureau Paul" and turns off "Lampe TV" and "Lampe 4"

```lua
domotic.hue.on("bureau Paul")
domotic.hue.off("Lampe TV")

domotic.hue.set("Lampe 4",true)
```

### Manage cat(s tower

The following example lights on green the uppper part of the cat's tower
Then it lights on red the lower part

```lua
domotic.tour.setHaut("g")
domotic.tour.setBas("r")
```

The following example turns off all the LEDs
Then it turns on the LED number 1 in blue

```lua
domotic.tour.setLeds(0,33,"0")   -- It is a zero not 'O' letter
domotic.tour.setLeds(1,1,"b")
```
