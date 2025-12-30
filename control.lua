
require("controls.wormhole-message")
require("controls.wormhole-detect-and-delete")
require("controls.ui-clicks")
--control.lua


-- Handle GUI button clicks

local state_names = {}
for name, value in pairs(defines.space_platform_state) do
  state_names[value] = name
end




commands.add_command("re", "reload mods", function(event)
  game.reload_mods()
  game.print("mods reload is complete")
end )

commands.add_command("sa", "reload mods", function(event)
  game.auto_save()
  
  
end )

commands.add_command("wormhole", "manually trigger a wormhole event",   function(event)
  is_player_at_wormhole()
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

