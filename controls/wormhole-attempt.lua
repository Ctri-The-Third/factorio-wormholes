
function is_player_at_wormhole()

    local return_value = false 
    for _, player in pairs(game.players) do

        
        local surface_string = ""
        local connected_string = ""
        local admin_string = ""
        local surface = player.physical_surface
        local surface_name = surface.name 
        
        if surface.platform then
            surface_string = "platform"
            
            local platform = surface.platform 
            surface_name = platform.name 
            if platform.space_location then 
                local location = platform.space_location

                surface_string = "platform over " .. location.name
                if location.name == "wormhole" then 
                    return_value = true
                end
            end 
        elseif surface.planet then
            surface_string = "planet"
        end 

        if player.connected then 
                connected_string = ""
        else 
            connected_string = "(offline) "
        end

        if player.admin then 
            admin_string = "admin"
        else
            admin_string = "player"
        end 
        game.print(admin_string .. " " .. player.name .. connected_string .. " is on surface ".. surface_name .. "[".. player.physical_surface_index .. "], which is a " .. surface_string )

        

    end
    game.print("player @ wormhole detection returns " .. tostring(return_value))
    return return_value
end 


function surfaces_to_delete()
    -- go through each surface
      -- if it's a planet, add it to the return thingy
      -- if it's not a planet, check its location
      -- if it's at the wormhole and not moving (status 6), skip
      -- if it's not at the wormhole or is moving, add it to the return thingy.
    return_list = {}
    count = 0 
    for _, surface in pairs(game.surfaces) do
        if surface.planet and surface.planet.name ~= "nauvis" then 
            return_list[count] = surface.name
            count = count + 1 
            game.print("DEL " .. surface.name)
            game.delete_surface(surface)
        elseif surface.planet and surface.planet.name == "nauvis" then
            local gen_settings = surface.map_gen_settings
            gen_settings.seed = 0 --THIS IS WHERE YOU GOT TO
            game.print("wormhole-attempt.lua, nauvis handling needs redone, and figure out the seeding.")
        elseif surface.platform then 
            local platform = surface.platform 
            if not platform.hub then 
                game.print("DEL " .. surface.name)
                game.delete_surface(surface)
            elseif not platform.space_location or  platform.space_location.name ~= "wormhole" then 
                
                return_list[count] = surface.name
                count = count + 1 
                game.print("DEL " .. platform.name .. "(".. surface.name .. ")")
                game.delete_surface(surface)
            else
                game.print("KEEP" .. platform.name .. "(".. surface.name .. ")")
                if platform.space_location then 
                    game.print("  " .. platform.space_location.name) 
                else 
                    game.print("  eh?")
                end    
            end 
        else 
            game.print("??? " .. surface.name)
        end
        ::continue::
    end

end 