# mods
These mods are those we used into our minetest server.
We try to stay as close as possible as the original code source.

# Principle of domotic gateway system

Our server has a domotic module that drives some equipments into our home:
- Hue lights;
- the cat tower (see following picture)

Minetest uses the API provided by domotic mod.
It sends messages to a local webservice server (see wsrabbit project)

## msg_bridge

This mod implements a send / receive for messages from/to a local webservice

## domotic

This mod offers an API that controls a remote domotic gateway
