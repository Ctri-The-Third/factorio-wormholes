

function relocate_from_command(event)
    local player = game.get_player(event.player_index) 
    local surface = player.physical_surface

    local platform = surface.platform
    if not platform then 
        return 
    end 


    if platform.space_location then 
        game.print("Platform ".. platform.name .. " at ".. platform.space_location.name)
    elseif platform.space_connection then 
        game.print("Platform " .. platform.name .. " travelling on " .. platform.space_connection.name)
    end 
    relocate_space_platform(platform)
    
end 


function relocate_space_platform(platform)
    -- get the platform
    -- move it to gleba
    local target_planet = nil 
    for _,planet in pairs(game.planets) do 
        if planet.name == "gleba" then 
            target_planet = planet 
            game.print("found our target")
        else 
            game.print("planet " .. planet.name .. " is not our target")
        end 
    end 

    platform.space_location = target_planet.prototype
    platform.paused = true 
end 


