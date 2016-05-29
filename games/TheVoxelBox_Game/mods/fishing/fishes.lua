-----------------------------------------------------------------------------------------------
-- Fishing - Mossmanikin's version - Fishes 0.0.4
-----------------------------------------------------------------------------------------------
local t=intllib.Getter()
-----------------------------------------------------------------------------------------------
-- Fish
-----------------------------------------------------------------------------------------------
blocklife.register_craftitem("fishing:fish_raw", {
	description = t("Fish"),
    groups = {eat=2},
    inventory_image = "fishing_fish.png",
})
	-----------------------------------------------------
	-- Roasted Fish
	-----------------------------------------------------
	blocklife.register_craftitem("fishing:fish", {
		description = t("Cooked fish"),
		groups = {eat=4},
		inventory_image = "fishing_fish_cooked.png",
	})
	-----------------------------------------------------
	-- Sushi
	-----------------------------------------------------
	blocklife.register_craftitem("fishing:sushi", {
		description = t("Sushi"),
		groups = {eat=8},
		inventory_image = "fishing_sushi.png",
	})

-----------------------------------------------------------------------------------------------
-- Whatthef... it's a freakin' Shark!
-----------------------------------------------------------------------------------------------
blocklife.register_craftitem("fishing:shark", {
	description = t("Small shark"),
    groups = {eat=4},
    inventory_image = "fishing_shark.png",
})
	-----------------------------------------------------
	-- Roasted Shark
	-----------------------------------------------------
	blocklife.register_craftitem("fishing:shark_cooked", {
		description = t("Small cooked shark"),
		groups = {eat=8},
		inventory_image = "fishing_shark_cooked.png",
	})
	
-----------------------------------------------------------------------------------------------
-- Pike
-----------------------------------------------------------------------------------------------
blocklife.register_craftitem("fishing:pike", {
	description = t("Northern pike"),
    groups = {eat=4},
    inventory_image = "fishing_pike.png",
})
	-----------------------------------------------------
	-- Roasted Pike
	-----------------------------------------------------
	blocklife.register_craftitem("fishing:pike_cooked", {
		description = t("Cooked northern pike"),
		groups = {eat=8},
		inventory_image = "fishing_pike_cooked.png",
	})
