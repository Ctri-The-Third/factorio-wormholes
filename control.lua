
require("controls.wormhole-message")
require("controls.wormhole-detect-and-delete")
require("controls.ui-clicks")
require("controls.spaceplatform-relocate")
--control.lua


-- If you're a modder with a planet you know will work this this mod and want it to be reset
-- use this remote with your planet's name, and pass in a boolean of true/false

remote.add_interface("wormholes-new-game-plus", {
  register_planet = function(planet_name, safe_bool) register_planet(planet_name, safe_bool) end 
})


function register_planet(planet_name, safe_bool) 
  if safe_bool then 
    storage.safe_planet_names[planet_name] = "safe"
  elseif not safe_bool then 
    storage.safe_planet_names[planet_name] = "unsafe"
  end 
end 



commands.add_command("re", "reload mods", function(event)
  game.reload_mods()
  game.print("mods reload is complete")
end )

commands.add_command("sa", "reload mods", function(event)
  game.auto_save()
  
  
end )

commands.add_command("wormhole", "manually trigger a wormhole event",   function(event)
  game.print("Debug commands are disabled.")
  --go_into_wormhole()
  end
)



script.on_event(defines.events.on_space_platform_changed_state, 
  function(event)
    local platform = event.platform
    local old_state = event.old_state
    if platform.space_location == nil or  platform.space_location.name ~= "wormhole" then 
      return 
    end 
    
    if old_state == 2 and  platform.state == 6 then 
      if is_player_at_wormhole() then 
        local players = get_players_at_wormhole()
        for _, player in ipairs(players) do 
          display_wormhole_message(player)
        end 
      end 
    end 
  end   
)

local default_safe_planet_names = {
        nauvis = "safe",
        vulcanus = "safe", 
        fulgora = "safe",
        gleba = "safe", 
        aquilo = "safe",
        rubia = "unsafe",
        maraxsis = "unsafe"
    }

script.on_init(
  function (event)
    storage.safe_planet_names = default_safe_planet_names
  end 
)
script.on_configuration_changed(
  function (event)
    if not storage.safe_planet_names then 
      storage.safe_planet_names = default_safe_planet_names
    end 
  end       
)