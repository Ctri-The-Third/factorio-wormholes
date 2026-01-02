local wormhole = table.deepcopy(data.raw["space-location"]["solar-system-edge"])
local shatteredPlanet = table.deepcopy(data.raw["space-location"]["shattered-planet"])

wormhole.name="wormhole"
wormhole.icons = {
  {
    icon = shatteredPlanet.icon ,
    icon_size = wormhole.icon_size,
    tint = {r=0,g=0.3,b=1, a=0.5}
  }
}



wormhole.draw_orbit = false
wormhole.distance = 51
wormhole.orientation = 0.245
wormhole.magnitude = 1
wormhole.asteroid_spawn_influence = 1 
wormhole.asteroid_spawn_definitions = {
        {
          angle_when_stopped = 1,
          asteroid = "metallic-asteroid-chunk",
          probability = 0.00029999999999999991,
          speed = 0.016666666666666665,
          type = "asteroid-chunk"
        },
        {
          angle_when_stopped = 1,
          asteroid = "carbonic-asteroid-chunk",
          probability = 0.0005,
          speed = 0.016666666666666665,
          type = "asteroid-chunk"
        },
        {
          angle_when_stopped = 1,
          asteroid = "oxide-asteroid-chunk",
          probability = 0.0002,
          speed = 0.016666666666666665,
          type = "asteroid-chunk"
        },
        {
          angle_when_stopped = 0.4,
          asteroid = "huge-metallic-asteroid",
          probability = 0.00075,
          speed = 0.016666666666666665
        },
        {
          angle_when_stopped = 0.4,
          asteroid = "huge-carbonic-asteroid",
          probability = 0.00125,
          speed = 0.016666666666666665
        },
        {
          angle_when_stopped = 0.4,
          asteroid = "huge-oxide-asteroid",
          probability = 0.0005,
          speed = 0.016666666666666665
        }
      }
data:extend{wormhole}


