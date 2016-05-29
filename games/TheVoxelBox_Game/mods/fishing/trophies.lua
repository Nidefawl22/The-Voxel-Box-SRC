-----------------------------------------------------------------------------------------------
-- Fishing - Mossmanikin's version - Trophies 0.0.2
-- Contains code from: 		default
-- Supports:				animal_clownfish, animal_fish_blue_white
-----------------------------------------------------------------------------------------------
local t=intllib.Getter()
local TRoPHY = {
--	  MoD						 iTeM				 NaMe				iCoN
    {"fishing",  				"fish_raw",			t("Fish"),				"fishing_fish.png"},
	{"fishing",  				"pike",				t("Northern pike"),	"fishing_pike.png"},
	{"fishing",  				"shark",			t("Small shark"),			"fishing_shark.png"},
	{"animal_clownfish",		"clownfish",		t("Clownfish"),		"animal_clownfish_clownfish_item_16.png"},
	{"animal_fish_blue_white",	"fish_blue_white",	t("Blue-white fish"),	"animal_fish_blue_white_fish_blue_white_item_16.png"},
}

local function has_trophy_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end

for i in pairs(TRoPHY) do
	local 	MoD = 			TRoPHY[i][1]
	local 	iTeM = 			TRoPHY[i][2]
	local 	NaMe = 			TRoPHY[i][3]
	local 	iCoN = 			TRoPHY[i][4]
	blocklife.register_node("fishing:trophy_"..iTeM, {
		description = NaMe.." - "..t("trophy"),
		inventory_image = "default_chest_top.png^"..iCoN.."^fishing_trophy_label.png",
		drawtype = "nodebox",
		tiles = {
			"default_chest_top.png", -- top
			"default_chest_top.png", -- bottom
			"default_chest_top.png", -- right
			"default_chest_top.png", -- left
			"default_chest_top.png", -- back
			"default_chest_top.png^"..iCoN.."^fishing_trophy_label.png", -- front
		},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		node_box = {
			type = "fixed",
			fixed = {
			--	{ left	, bottom , front  ,  right ,  top   ,  back  }
				{ -1/2  , -1/2   ,  7/16  , 1/2    ,  1/2   ,  1/2  },
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -1/2  , -1/2   ,  7/16  , 1/2    ,  1/2   ,  1/2  },
		}
		},
		groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
		sounds = default.node_sound_wood_defaults(),
		after_place_node = function(pos, placer)
			local meta = blocklife.get_meta(pos)
			meta:set_string("owner", placer:get_player_name() or "")
			meta:set_string("infotext", t("This giant catch of species").." "..NaMe.." "..t("was caught by excellent fisher").." "..
				meta:get_string("owner").."!")
		end,
		on_construct = function(pos)
			local meta = blocklife.get_meta(pos)
			meta:set_string("infotext", NaMe)
			meta:set_string("owner", "")
		end,
		can_dig = function(pos,player)
			local meta = blocklife.get_meta(pos);
			return has_trophy_privilege(meta, player)
		end,
	})
	
	blocklife.register_craft({
		type = "shapeless",
		output = "fishing:trophy_"..iTeM,
		recipe = {MoD..":"..iTeM, "default:sign_wall"},
	})
	
end
