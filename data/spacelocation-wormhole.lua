local wormhole = table.deepcopy(data.raw["space-location"]["solar-system-edge"])
local shatteredPlanet = table.deepcopy(data.raw["space-location"]["shattered-planet"])

wormhole.name="wormhole"
wormhole.icons = {
  {
    icon = shatteredPlanet.icon ,
    icon_size = wormhole.icon_size,
    tint = {r=0,g=0.3,b=1, a=0.2}
  }
}
wormhole.draw_orbit = false
wormhole.distance = 7.5
wormhole.orientation = wormhole.orientation + 0.02
wormhole.magnitude = 1
wormhole.asteroid_spawn_influence = 0 
wormhole.asteroid_spawn_definitions = {}
data:extend{wormhole}