nsspf = {}
local mod = nsspf

mod.version = '20230616'
mod.mod_name = minetest.get_current_modname()
mod.path = minetest.get_modpath(mod.mod_name)
mod.world = minetest.get_worldpath()
mod.nssm = minetest.get_modpath("nssm")
mod.tnt = minetest.get_modpath("tnt")
mod.dat = {}

dofile(mod.path.."/mushrooms.lua")
dofile(mod.path.."/spawn.lua")

print("[MOD] loaded nsspf")
