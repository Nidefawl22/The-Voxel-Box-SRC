-----------------------------------------------------------------------------------------------
-- Fishing - Mossmanikin's version - Bobber Shark 0.0.6
-----------------------------------------------------------------------------------------------
local t=intllib.Getter()
-- Here's what you can catch if you use a fish as bait
local CaTCH_BiG = {
--	  MoD 						 iTeM				WeaR		 MeSSaGe ("You caught "..)	GeTBaiTBack		NRMiN  	CHaNCe (../120)
    {"fishing",  				"shark",			0,			t("small shark."),			false,			1,		2},
	{"fishing",  				"pike",				0,			t("northern pike."),			false,			3,		3}
}

local PLaNTS = {
 --	  MoD* 			iTeM				MeSSaGe ("You caught "..)
	{"flowers",		"waterlily",		t("water lily.") }, 
	{"flowers",		"waterlily_225",	t("water lily.") }, 
	{"flowers",		"waterlily_45",		t("water lily.") }, 
	{"flowers",		"waterlily_675",	t("water lily.") }, 
	{"flowers",		"waterlily_s1",		t("water lily.") }, 
	{"flowers",		"waterlily_s2",		t("water lily.") }, 
	{"flowers",		"waterlily_s3",		t("water lily.") }, 
	{"flowers",		"waterlily_s4",		t("water lily.") },
	{"flowers",		"seaweed",			t("seaweed.")}, 
	{"flowers",		"seaweed_2",		t("seaweed.")}, 
	{"flowers",		"seaweed_3",		t("seaweed.")}, 
	{"flowers",		"seaweed_4",		t("seaweed.")},
}
-- *as used in the node name

local FISHING_BOBBER_ENTITY_SHARK={
	hp_max = 605,
	water_damage = 1,
	physical = true,
	timer = 0,
	env_damage_timer = 0,
	visual = "wielditem",
	visual_size = {x=1/3, y=1/3, z=1/3},
	textures = {"fishing:bobber_box"},
	--			   {left ,bottom, front, right,  top ,  back}
	collisionbox = {-2/16, -4/16, -2/16,  2/16, 0/16,  2/16},
	view_range = 7,
--	DESTROY BOBBER WHEN PUNCHING IT
	on_punch = function (self, puncher, time_from_last_punch, tool_capabilities, dir)
		local player = puncher:get_player_name()
		if MESSAGES == true then blocklife.chat_send_player(player, t("Your fish escaped."), false) end -- fish escaped
		blocklife.sound_play("fishing_bobber1", {
			pos = self.object:getpos(),
			gain = 0.5,
		})
		self.object:remove()
	end,
--	WHEN RIGHTCLICKING THE BOBBER THE FOLLOWING HAPPENS	(CLICK AT THE RIGHT TIME WHILE HOLDING A FISHING POLE)	
	on_rightclick = function (self, clicker)
		local item = clicker:get_wielded_item()
		local player = clicker:get_player_name()
		local say = blocklife.chat_send_player
		if item:get_name() == "fishing:pole" then
			local inv = clicker:get_inventory()
			local pos = self.object:getpos()
			-- catch visible plant
			if blocklife.get_node(pos).name ~= "air" then
				for i in ipairs(PLaNTS) do
					local PLaNT = PLaNTS[i][1]..":"..PLaNTS[i][2]
					local MeSSaGe = PLaNTS[i][3]
					local DRoP = blocklife.registered_nodes[PLaNT].drop
					if blocklife.get_node(pos).name == PLaNT then
						blocklife.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="air"})
						if inv:room_for_item("main", {name=DRoP, count=1, wear=0, metadata=""}) then
							inv:add_item("main", {name=DRoP, count=1, wear=0, metadata=""})
							if MESSAGES == true then say(player, t("You caught").." "..MeSSaGe, false) end -- caught Plant				
						end
						if not blocklife.setting_getbool("creative_mode") then
							if inv:room_for_item("main", {name="fishing:fish_raw", count=1, wear=0, metadata=""}) then
								inv:add_item("main", {name="fishing:bait_worm", count=1, wear=0, metadata=""})
								if MESSAGES == true then say(player, t("Bait is still here."), false) end -- bait still there
							end
						end
					end
				end
			end
			--elseif blocklife.get_node(pos).name == "air" then
			if self.object:get_hp() <= 300 then
				if math.random(1, 100) < SHARK_CHANCE then
					local 	chance = 		math.random(1, 5) -- ><((((º>
					for i in pairs(CaTCH_BiG) do
						local 	MoD = 			CaTCH_BiG[i][1]
						local 	iTeM = 			CaTCH_BiG[i][2]
						local 	WeaR = 			CaTCH_BiG[i][3]
						local 	MeSSaGe = 		CaTCH_BiG[i][4]
						local 	GeTBaiTBack = 	CaTCH_BiG[i][5]
						local 	NRMiN = 		CaTCH_BiG[i][6]
						local 	CHaNCe = 		CaTCH_BiG[i][7]
						local 	NRMaX = 		NRMiN + CHaNCe - 1
						if chance <= NRMaX and chance >= NRMiN then
							if blocklife.get_modpath(MoD) ~= nil then
								if inv:room_for_item("main", {name=MoD..":"..iTeM, count=1, wear=WeaR, metadata=""}) then
									inv:add_item("main", {name=MoD..":"..iTeM, count=1, wear=WeaR, metadata=""})
									if MESSAGES == true then say(player, t("You caught").." "..MeSSaGe, false) end -- caught somethin'					
								end
								if not blocklife.setting_getbool("creative_mode") then
									if GeTBaiTBack == true then
										if inv:room_for_item("main", {name="fishing:fish_raw", count=1, wear=0, metadata=""}) then
											inv:add_item("main", {name="fishing:fish_raw", count=1, wear=0, metadata=""})
											if MESSAGES == true then say(player, t("Bait is still here."), false) end -- bait still there?
										end
									end
								end
							end
						end
					end
				else --if math.random(1, 100) > FISH_CHANCE then
					if MESSAGES == true then say(player, t("Your fish escaped."), false) end -- fish escaped
				end
			end
			if self.object:get_hp() > 300 and blocklife.get_node(pos).name == "air" then 
				if MESSAGES == true then say(player, t("You caught nothing."), false) end -- fish escaped
				if not blocklife.setting_getbool("creative_mode") then
					if math.random(1, 3) == 1 then
						if inv:room_for_item("main", {name="fishing:fish_raw", count=1, wear=0, metadata=""}) then
							inv:add_item("main", {name="fishing:fish_raw", count=1, wear=0, metadata=""})
							if MESSAGES == true then say(player, t("Bait is still here."), false) end -- bait still there
						end	
					end
				end
			end
			--end
		else 
			if MESSAGES == true then say(player, t("Your fish escaped."), false) end -- fish escaped		
		end
		blocklife.sound_play("fishing_bobber1", {
			pos = self.object:getpos(),
			gain = 0.5,
		})
		self.object:remove()
	end,
-- AS SOON AS THE BOBBER IS PLACED IT WILL ACT LIKE
	on_step = function(self, dtime)
		local pos = self.object:getpos()
		if BOBBER_CHECK_RADIUS > 0 then
			local objs = blocklife.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, BOBBER_CHECK_RADIUS)
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name == "fishing:bobber_entity_shark" then
						if obj:get_luaentity() ~= self then
							self.object:remove()
						end
					end
				end
			end
		end
		if math.random(1, 4) == 1 then
			self.object:setyaw(self.object:getyaw()+((math.random(0,360)-180)/2880*math.pi))
		end
		for _,player in pairs(blocklife.get_connected_players()) do
			local s = self.object:getpos()
			local p = player:getpos()
			local dist = ((p.x-s.x)^2 + (p.y-s.y)^2 + (p.z-s.z)^2)^0.5
			if dist > self.view_range then
				blocklife.sound_play("fishing_bobber1", {
					pos = self.object:getpos(),
					gain = 0.5,
				})
				self.object:remove()
			end
		end	
		local do_env_damage = function(self)
			self.object:set_hp(self.object:get_hp()-self.water_damage)
			if self.object:get_hp() == 600 then
				self.object:moveto({x=pos.x,y=pos.y-0.015625,z=pos.z})
			elseif self.object:get_hp() == 595 then
				self.object:moveto({x=pos.x,y=pos.y+0.015625,z=pos.z})
			elseif self.object:get_hp() == 590 then
				self.object:moveto({x=pos.x,y=pos.y+0.015625,z=pos.z})
			elseif self.object:get_hp() == 585 then
				self.object:moveto({x=pos.x,y=pos.y-0.015625,z=pos.z})
				self.object:set_hp(self.object:get_hp()-(math.random(1, 200)))
			elseif self.object:get_hp() == 300 then
				blocklife.sound_play("fishing_bobber1", {
					pos = self.object:getpos(),
					gain = 0.7,
				})
				blocklife.add_particlespawner(40, 0.5,   -- for how long (?)             -- Particles on splash
					{x=pos.x,y=pos.y-0.0625,z=pos.z}, {x=pos.x,y=pos.y-0.2,z=pos.z}, -- position min, pos max
					{x=-3,y=-0.0625,z=-3}, {x=3,y=5,z=3}, -- velocity min, vel max
					{x=0,y=-9.8,z=0}, {x=0,y=-9.8,z=0},
					0.3, 2.4,
					0.25, 0.5,  -- min size, max size
					false, "default_snow.png")
				self.object:moveto({x=pos.x,y=pos.y-0.625,z=pos.z})
			elseif self.object:get_hp() == 295 then
				self.object:moveto({x=pos.x,y=pos.y+0.425,z=pos.z})
			elseif self.object:get_hp() == 290 then
				self.object:moveto({x=pos.x,y=pos.y+0.0625,z=pos.z})
			elseif self.object:get_hp() == 285 then
				self.object:moveto({x=pos.x,y=pos.y-0.0625,z=pos.z})
			elseif self.object:get_hp() < 284 then	
				self.object:moveto({x=pos.x+(0.001*(math.random(-8, 8))),y=pos.y,z=pos.z+(0.001*(math.random(-8, 8)))})
				self.object:setyaw(self.object:getyaw()+((math.random(0,360)-180)/720*math.pi))
			elseif self.object:get_hp() == 0 then
				blocklife.sound_play("fishing_bobber1", {
					pos = self.object:getpos(),
					gain = 0.5,
				})
				self.object:remove()
			end
		end
		do_env_damage(self)
	end,
}

blocklife.register_entity("fishing:bobber_entity_shark", FISHING_BOBBER_ENTITY_SHARK)
