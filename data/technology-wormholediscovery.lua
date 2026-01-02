local wormholeDiscovery = table.deepcopy(data.raw["technology"]["planet-discovery-fulgora"])

wormholeDiscovery.name = "wormhole-discovery"
wormholeDiscovery.prerequisites = { "promethium-science-pack" } 
wormholeDiscovery.icons = {
        {
          icon = "__wormholes-new-game-plus__/graphics/icons/wormhole_128.png",
          icon_size = 128
        },
        {
          floating = true,
          icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
          icon_size = 128,
          scale = 0.25,
          shift = {
            50,
            50
          }
        }
    }
wormholeDiscovery.icon_size = 256

wormholeDiscovery.unit = {
    count = 500, 
    ingredients = {
        {
        "automation-science-pack",
        1
        },
        {
        "logistic-science-pack",
        1
        },
        {
        "chemical-science-pack",
        1
        },
        {
        "production-science-pack",
        1
        },
        {
        "utility-science-pack",
        1
        },
        {
        "space-science-pack",
        1
        },
        {
        "metallurgic-science-pack",
        1
        },
        {
        "agricultural-science-pack",
        1
        },
        {
        "electromagnetic-science-pack",
        1
        },
        {
        "cryogenic-science-pack",
        1
        }
    },
    time = 60

}
wormholeDiscovery.effects = {{
    space_location="wormhole",
    type = "unlock-space-location"
}}

data:extend{wormholeDiscovery}
