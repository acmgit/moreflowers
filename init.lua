herbs = {}
local hb = herbs

hb.modname = minetest.get_current_modname()
hb.version = 1
hb.revision = 1

local modname = hb.modname

-- Load support for MT game translation.
local S = minetest.get_translator(modname)

--[[
local T = minetest.get_translator(modname)
local function S(text)
    local line = string.gsub(text, "\27%([^()]*%)", "")
   return T(line)
]]--

dofile(minetest.get_modpath(modname) .. "/mapgen.lua")

-- Flower registration
function hb.add_simple_flower(name, desc, box, f_groups)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node(modname .. ":" .. name, {
		description = desc,
		drawtype = "plantlike",
		waving = 1,
		tiles = {modname .. "_" .. name .. ".png"},
		inventory_image = modname .. "_" .. name .. ".png",
		wield_image = modname .. "_" .. name .. ".png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		groups = f_groups,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = box
		}
	})
end

function hb.register_mushroom(name, descript, tile, heal)

    minetest.register_node(modname .. ":" .. name, {
        description = descript,
        tiles = {modname .. "_" .. tile},
        inventory_image = modname .. "_" .. tile,
        wield_image = modname .. "_" .. tile,
        drawtype = "plantlike",
        paramtype = "light",
        sunlight_propagates = true,
        walkable = false,
        buildable_to = true,
        groups = {mushroom = 1, food_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
        sounds = default.node_sound_leaves_defaults(),
        on_use = minetest.item_eat(heal),
        selection_box = {
            type = "fixed",
            fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
        }
    })
end

hb.flowerdatas = {
	{
		"campanula_blue",
		S("Campanula Blue"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 5 / 16, 4 / 16},
		{color_blue = 1, flammable = 1}
	},
	{
		"trifolium_red",
		S("Trifolium Red"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 5 / 16, 4 / 16},
		{color_violet = 1, flammable = 1}
	},
	{
		"trifolium_white",
		S("Trifolium White"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 3 / 16, 4 / 16},
		{color_green = 1, flammable = 1}
	},
	{
		"centaurea",
		S("Centaurea"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 5 / 16, 4 / 16},
		{color_blue = 1, flammable = 1}
	},
    {
		"anagallis_yellow",
		S("Anagallis Yellow"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 5 / 16, 4 / 16},
		{color_yellow = 1, flammable = 1}
	},
	{
		"iris",
		S("Iris"),
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{color_blue = 1, flammable = 1}
	},
	{
		"leucanthemum_white",
		S("Leucanthemum White"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 5 / 16, 4 / 16},
		{color_white = 1, flammable = 1}
	},
	{
		"leontopodium_white",
		S("Leontopodium White"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16},
		{color_grey = 1, flammable = 1}
	},
	{
		"papaver_red",
		S("Papaver Red"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 5 / 16, 4 / 16},
		{color_red = 1, flammable = 1}
	},
	{
		"plantago",
		S("Plantago"),
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{color_brown = 1, flammable = 1}
	},
	{
		"antirrhinum",
		S("Antirrhinum"),
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{color_pink = 1, flammable = 1}
	},
	{
		"dosera",
		S("Dosera round"),
		{-4 / 16, -0.5, -4 / 16, 4 / 16, 5 / 16, 4 / 16},
		{color_red = 1, flammable = 1}
	},
	{	"digitalis_blue",
		S("Digitalis Blue"),
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{color_blue = 1, flammable = 1}
	},
	{
		"digitalis_yellow",
		S("Digitalis Yellow"),
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{color_yellow = 1, flammable = 1}
	},
	{
		"achillea_white",
		S("Achillea White"),
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{color_white = 1, flammable = 1}
	}
}

hb.mushroomdatas = {
                        {   "mushroom_amanita_green",
                            S("Amanita Green"),
                            "mushroom_amanita_green.png",
                            1,
                            -10
                        },
                        {
                            "mushroom_cantharellus",
                            S("Cantharellus"),
                            "mushroom_cantharellus.png",
                            3,
                            0
                        },
                        {
                            "mushroom_gyromitra",
                            S("Gyromitra"),
                            "mushroom_gyromitra.png",
                            1,
                            -5
                        },
                        {
                            "mushroom_macrolepiota",
                            S("Macrolepiota"),
                            "mushroom_macrolepiota.png",
                            5,
                            0
                        },
                        {
                            "mushroom_galerina",
                            S("Galerina"),
                            "mushroom_galerina.png",
                            1,
                            -3
                        },
                        {
                            "mushroom_boletus",
                            S("Boletus"),
                            "mushroom_boletus.png",
                            4,
                            0
                        }
                    }

for _, mushroom in pairs(hb.mushroomdatas) do
    hb.register_mushroom(mushroom[1],
                            mushroom[2],
                            mushroom[3],
                            mushroom[4]
                            )
end

for _,item in pairs(hb.flowerdatas) do
	hb.add_simple_flower(unpack(item))
end

-- Compatibility for older versions
minetest.register_alias("clover_red","trifolium_red")
minetest.register_alias("clover_white","trifolium_white")
minetest.register_alias("cornflower","centaurea")
minetest.register_alias("houndstooth","anagallis_yellow")
minetest.register_alias("margerit","leucanthemum_white")
minetest.register_alias("poppy_red","papaver_red")
minetest.register_alias("ribwort","plantago")
minetest.register_alias("snappdragon","antirrhinum")
minetest.register_alias("sundew","drosera")
minetest.register_alias("thimble_blue","digitalis_blue")
minetest.register_alias("thimble_yellow","digitalis_yellow")
minetest.register_alias("snappdragon","antirrhinum")
minetest.register_alias("yarrow_white","achillea_white")

minetest.register_alias("mushroom_bulbou0s_green","mushroom_bulbous_green")
minetest.register_alias("mushroom_chanterelle","mushroom_cantharellus")
minetest.register_alias("mushroom_lorikeet","mushroom_gyromitra")
minetest.register_alias("mushroom_parasol","mushroom_macrolepiota")
minetest.register_alias("mushroom_poisonous_sublime","mushroom_galerina")
minetest.register_alias("mushroom_stone","mushroom_boletus")


dofile(minetest.get_modpath(modname) .. "/register_mods.lua")

minetest.log("action","[Mod] " .. hb.modname .. " V " .. hb.version .. "." .. hb.revision .. " loaded.")
print("[Mod] " .. hb.modname .. " V " .. hb.version .. "." .. hb.revision .. " loaded.")
