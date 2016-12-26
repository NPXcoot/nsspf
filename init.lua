minetest.register_node("nsspf:boletus_edulis", {
	description = "Boletus edulis",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"boletus_edulis.png"},
	groups = {snappy=3},
--  drop = 'default:dirt',
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("nsspf:boletus_satanas", {
	description = "Boletus satanas",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"boletus_satanas.png"},
	groups = {snappy=3},
--  drop = 'default:dirt',
	selection_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.28, -0.49, -0.28, 0.28, 0.06, 0.28}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("nsspf:amanita_phalloides", {
	description = "Amanita phalloides",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"amanita_phalloides.png"},
	groups = {snappy=3},
--  drop = 'default:dirt',
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("nsspf:amanita_muscaria", {
	description = "Amanita muscaria",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"amanita_muscaria.png"},
	groups = {snappy=3},
--  drop = 'default:dirt',
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

minetest.register_node("nsspf:macrolepiota_procera", {
	description = "macrolepiota_procera",
	drawtype = "mesh",
	mesh = "macrolepiota_procera.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"macrolepiota_procera.png"},
	groups = {snappy=3},
--  drop = 'default:dirt',
	selection_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-0.05, -0.49, -0.05, 0.05, 0.2, 0.05}, -- Right, Bottom, Back, Left, Top, Front
      },
})

function nsspf_register_mycorrhizalmycelium (name, descr, fruit)

minetest.register_node("nsspf:"..name.."_mycelium", {
	description = descr,
	tiles = {"mycorrhizalmycelium.png"},
	groups = {crumbly = 2},
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {"default:tree"},
	interval = 30.0,
	chance = 20,
	action = function(pos, node)
		local flag = 0
			for dx = -2,2 do
				for dy = -2,2 do
					for dz = -2,1 do
						local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
						local n = minetest.env:get_node(pos1).name
						if n == "nsspf:amanita_muscaria_mycelium" or n == "nsspf:amanita_phalloides_mycelium" or n == "nsspf:boletus_edulis_mycelium" or n == "nsspf:boletus_satanas_mycelium" then
							flag = 1
							return
						end
					end
				end
			end
		if flag == 0 then
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_mycelium"})
		end
	end
})

minetest.register_abm({
	nodenames = {"nsspf:"..name.."_mycelium"},
	neighbors = {"air"},
	interval = 1,
	chance = 1,
	action =
	function(pos, node)
		minetest.set_node(pos, {name="default:dirt"})
	end
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {"nsspf:"..name.."_mycelium"},
	interval = 30.0,
	chance = 20,
	action = function(pos, node)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_mycelium"})
	end
})

minetest.register_abm({
	nodenames = {"nsspf:"..name.."_mycelium"},
	neighbors = {"default:dirt_with_grass"},
	interval = 30.0,
	chance = 20,
	action = function(pos, node)
		local pos1 = {x=pos.x, y=pos.y+2, z=pos.z}
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = minetest.env:get_node(pos1).name
		local nn = minetest.env:get_node(pos2).name
		if n== "air" and nn== "default:dirt_with_grass" then
			minetest.set_node({x = pos1.x, y = pos1.y, z = pos1.z}, {name = "nsspf:"..name})
		end
	end
})

end


nsspf_register_mycorrhizalmycelium ('amanita_muscaria','Amanita muscaria Mycelium')
nsspf_register_mycorrhizalmycelium ('amanita_phalloides','Amanita phalloides Mycelium')
nsspf_register_mycorrhizalmycelium ('boletus_edulis','Boletus edulis Mycelium')
nsspf_register_mycorrhizalmycelium ('boletus_satanas','Boletus satanas mycelium')
--nsspf_register_mycelium ('macrolepiota_procera_mycelium','')
--nsspf_register_mycelium ('','')


--tuber: il frutto, il cubo che lo droppa, il micelio, il micelio morto, le spore
function nsspf_register_tuber (name, descr, tree)

minetest.register_node("nsspf:"..name.."_tuber_mycelium", {
	description = descr,
	tiles = {"tuber_mycelium.png"},
	groups = {crumbly = 2},
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {tree},
	interval = 20.0,
	chance = 10,
	action = function(pos, node)
		local flag = 0
			for dx = -2,2 do
				for dy = -2,2 do
					for dz = -2,1 do
						local pos1 = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
						local n = minetest.env:get_node(pos1).name
						if n == "nsspf:tuber_magnatum_pico" or n == "nsspf:tuber_melanosporum" or n == "nsspf:tuber_borchii" or n == "nsspf:terfezia_arenaria" then
							flag = 1
							return
						end
					end
				end
			end
		if flag == 0 then
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_tuber_mycelium"})
		end
	end
})

minetest.register_abm({
	nodenames = {"nsspf:"..name.."_tuber_mycelium"},
	neighbors = {"air"},
	interval = 1,
	chance = 1,
	action =
	function(pos, node)
		minetest.set_node(pos, {name="nsspf:"..name.."_fungusdirt"})
	end
})

minetest.register_node("nsspf:"..name.."_fruit", {
	description = descr.." Fruit",
	tiles = {"default_dirt.png"},
	drop = "nsspf:"..name,
	groups = {crumbly = 3},
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {"nsspf:"..name.."_tuber_mycelium"},
	interval = 20.0,
	chance = 10,
	action = function(pos, node)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_tuber_mycelium"})
	end
})

minetest.register_craftitem("nsspf:"..name, {
	description = descr,
	image = name..".png",
})

minetest.register_craftitem("nsspf:"..name.."_spores", {
	description = descr.." Spores",
	image = "spores.png",
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {"nsspf:"..name.."_tuber_mycelium"},
	interval = 30.0,
	chance = 20,
	action = function(pos, node)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nsspf:"..name.."_fruit"})
	end
})

end

nsspf_register_tuber ("tuber_magnatum_pico","Tuber magnatum pico","default:tree")
nsspf_register_tuber ("tuber_melanosporum","Tuber melanosporum","default:pine_tree")
nsspf_register_tuber ("tuber_borchii","Tuber borchii","default:aspen_tree")
nsspf_register_tuber ("terfezia_arenaria","Terfezia arenaria","default:acacia_tree")


minetest.register_node("nsspf:tuber_melanosporum_fungusdirt", {
	description = "Tuber melanosporum Dirt",
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "nsspf:tuber_melanosporum_spores" 1'},
                 rarity = 20
             },
		}
	},
	groups = {crumbly = 3},
})

minetest.register_node("nsspf:tuber_magnatum_pico_fungusdirt", {
	description = "Tuber magnatum pico Dirt",
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "nsspf:tuber_magnatum_pico_spores" 1'},
                 rarity = 30
             },
		}
	},
	groups = {crumbly = 3},
})

minetest.register_node("nsspf:tuber_borchii_fungusdirt", {
	description = "Tuber borchii Dirt",
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "nsspf:tuber_borchii_spores" 1'},
                 rarity = 10
             },
		}
	},
	groups = {crumbly = 3},
})

minetest.register_node("nsspf:terfezia_arenaria_fungusdirt", {
	description = "Terfezia arenaria Dirt",
	tiles = {"default_dirt.png"},
	drop = {
         max_items = 1,
         items = {
			{
                 items = {'node "nsspf:terfezia_arenaria_spores" 1'},
                 rarity = 10
             },
		}
	},
	groups = {crumbly = 3},
})