
require("data.spacelocation-wormhole")
require("data.connection-edgeofsolarsystemwormhole")
require("data.technology-wormholediscovery")
require("data.ui-styles")

local victory_sprite = {
    type = "sprite",
    name = "ngp-victory",
    filename = "__core__/graphics/upload-chartbundle.png",
    size = {500, 750},  
    flags = {"gui-icon"}
}
data.extend{victory_sprite}

if mods["visible-planets"] then
    vp_add_planets_to_blacklist({"wormhole";})
end 

