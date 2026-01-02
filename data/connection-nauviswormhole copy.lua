
local nauvisWormhole = table.deepcopy(data.raw["space-connection"]["aquilo-solar-system-edge"])

nauvisWormhole.from="solar-system-edge"
nauvisWormhole.to="wormhole"
nauvisWormhole.name="solar-system-edge-wormhole"

nauvisWormhole.icons = {
    {
        icon = "__space-age__/graphics/icons/planet-route.png"
    },
    {
        icon = "__base__/graphics/icons/nauvis.png",
        icon_size = 64,
        scale = 0.33300000000000001,
        shift = {
        -6,
        -6
        }
    },
    {
        icon = "graphics/icons/wormhole_128.png",
        icon_size = 128,
        scale = 0.33300000000000001,
        shift = {
        6,
        6,
    
        
        }
    }
    }
nauvisWormhole.length = 15000
nauvisWormhole.asteroid_spawn_definitions = {}

--data:extend{nauvisWormhole}
