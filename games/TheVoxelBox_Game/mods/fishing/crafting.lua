-----------------------------------------------------------------------------------------------
-- Fishing - Mossmanikin's version - Recipes 0.0.7
-----------------------------------------------------------------------------------------------
-- Contains code from: 		animal_clownfish, animal_fish_blue_white, fishing (original), stoneage
-- Looked at code from:
-- Dependencies: 			default, farming
-- Supports:				animal_clownfish, animal_fish_blue_white, animal_rat, mobs
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Fishing Pole
-----------------------------------------------------------------------------------------------

blocklife.register_craft({
	output = "fishing:pole",
	recipe = { 
		{"", 				"",					"default:stick"	},
		{"", 				"default:stick",	"farming:string"},
		{"default:stick",	"",					"farming:string"},
	}
})


-----------------------------------------------------------------------------------------------
-- Roasted Fish
-----------------------------------------------------------------------------------------------
blocklife.register_craft({
	type = "cooking",
	output = "fishing:fish",
	recipe = "fishing:fish_raw",
	cooktime = 2,
})

-----------------------------------------------------------------------------------------------
-- Sushi
-----------------------------------------------------------------------------------------------
blocklife.register_craft({
	type = "shapeless",
	output = "fishing:sushi",
	recipe = {"fishing:fish_raw","farming:seed_wheat","flowers:seaweed"},
})

blocklife.register_craft({
	type = "shapeless",
	output = "fishing:sushi",
	recipe = {"fishing:fish_raw","farming:seed_wheat","seaplants:kelpgreen"},
		
})

blocklife.register_craft({
	type = "shapeless",
	output = "fishing:sushi",
	recipe = {"fishing:fish_raw","farming:seed_wheat","seaplants:kelpgreenmiddle"},
		
})

-----------------------------------------------------------------------------------------------
-- Roasted Shark
-----------------------------------------------------------------------------------------------
blocklife.register_craft({
	type = "cooking",
	output = "fishing:shark_cooked",
	recipe = "fishing:shark",
	cooktime = 2,
})

-----------------------------------------------------------------------------------------------
-- Roasted Pike
-----------------------------------------------------------------------------------------------
blocklife.register_craft({
	type = "cooking",
	output = "fishing:pike_cooked",
	recipe = "fishing:pike",
	cooktime = 2,
})
