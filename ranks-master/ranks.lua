-- ranks/ranks.lua

ranks.register("administrateur", {
	prefix = "[Administrateur]",
	colour = {a = 255, r = 255, g = 0, b = 0},
})

ranks.register("responsable", {
	prefix = "[Responsable]",
	colour = {a = 255, r = 83, g = 83, b = 255},
})

ranks.register("moderateur", {
	prefix = "[Moderateur]",
	colour = {a = 255, r = 255, g = 83, b = 37},
})

ranks.register("builder", {
	prefix = "[Builder]",
	colour = {a = 255, r = 255, g = 132, b = 0},
})

ranks.register("youtuber", {
	prefix = "[Youtuber]",
	colour = {a = 255, r = 255, g = 80, b = 71},
})

ranks.register("superJoueur", {
	prefix = "[SuperJoueur]",
	colour = {a = 255, r = 0, g = 80, b = 0},
})

ranks.register("none", {
	prefix = "",
	colour = {a = 255, r = 0, g = 0, b = 0},
})
