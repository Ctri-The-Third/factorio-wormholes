
local nauvisWormhole = table.deepcopy(data.raw["space-connection"]["aquilo-solar-system-edge"])

nauvisWormhole.from="solar-system-edge"
nauvisWormhole.to="wormhole"
nauvisWormhole.name="solar-system-edge-wormhole"

nauvisWormhole.icons = {
    {
        icon = "__space-age__/graphics/icons/planet-route.png"
    },
    {
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        icon_size = 64,
        scale = 0.33300000000000001,
        shift = {
        -6,
        -6
        }
    },
    {
        icon = "__wormholes-new-game-plus__/graphics/icons/wormhole_64.png",
        icon_size = 64,
        scale = 0.33300000000000001,
        shift = {
        6,
        6,
        },

        
    }
    }
nauvisWormhole.length = 5000
nauvisWormhole.asteroid_spawn_definitions = {}

data:extend{nauvisWormhole}
