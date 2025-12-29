
require("controls.wormhole-reset")
require("controls.wormhole-attempt")
--control.lua


-- Handle GUI button clicks

local state_names = {}
for name, value in pairs(defines.space_platform_state) do
  state_names[value] = name
end

script.on_event(defines.events.on_player_changed_position,
  function(event)
    local player = game.get_player(event.player_index) -- get the player that moved            
    -- if they're currently controlling the character
    if player.controller_type == defines.controllers.character then
      -- and wearing our armor
      if player.get_inventory(defines.inventory.character_armor).get_item_count("fire-armour") >= 1 then
        -- create the fire where they're standing
        player.surface.create_entity{name="fire-flame", position=player.position, force="neutral"}
      end
    end
  end
)



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
      game.print(platform.name .. " has arrived at the wormhole!")
      is_player_at_wormhole()

    end 

    -- here we need to loop through the players and check that at least one player is on the platform - if so we can continue.

  end   
  
  
)

