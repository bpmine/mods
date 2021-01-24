# mods
These mods are those we used into our minetest server.
We try to stay as close as possible as the original code source.

# Principle of domotic gateway system

Our server has a domotic module that drives some equipments into our home:
- Hue lights;
- the cat tower (see following picture)

Minetest uses the API provided by domotic mod.
It sends messages to a local webservice server (see wsrabbit project)

The domotic module is composed of 2 minetest mods.

## msg_bridge

This mod implements a send / receive for messages from/to a local webservice

## domotic

This mod offers an API that controls a remote domotic gateway.
It sends JSON messages to the msg_bridge module.

The JSON messages required are defined into the **domgw** project. See https://github.com/bpmine/domgw.

The caller of this modulhe will use a more comprehensive basic API to interact with docotic equipments.
