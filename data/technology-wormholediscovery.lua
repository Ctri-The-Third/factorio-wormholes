local wormholeDiscovery = table.deepcopy(data.raw["technology"]["planet-discovery-fulgora"])

wormholeDiscovery.name = "wormhole-discovery"
wormholeDiscovery.prerequisites = { "space-platform-thruster" } 

wormholeDiscovery.unit = {
    count = 10,
    ingredients ={
        { 
            "space-science-pack", 1
        }
    
    },
    time=60

}
wormholeDiscovery.effects = {{
    space_location="wormhole",
    type = "unlock-space-location"
}}

data:extend{wormholeDiscovery}
