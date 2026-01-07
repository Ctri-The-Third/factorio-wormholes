
function teleport_valid_platforms()
    local reset_planets_only = {} 
    local counter = 1 
    for planet_name, safety_bool in pairs(storage.safe_planet_names) do 
        if safety_bool == "safe" then 
            reset_planets_only[counter] = planet_name
            counter = counter + 1 
        end 
    end 

    if counter == 1 then 
        game.print("Wormhole issue: no 'safe' planets on the other end? what???")
        return 
    end 
    local target_planet_index = math.random(1,counter-1)
    
    local target_planet_name = reset_planets_only[target_planet_index]
    local target_space_location = nil -- game.planets[target_planet_name]

    for _, planet in pairs(game.planets) do 
        if planet.name == target_planet_name then 
            target_space_location = planet.prototype
        end 
    end 

    if not target_space_location then 
        return 
    end 
    for _, surface in pairs(game.surfaces) do 
        if surface.platform and surface.platform.space_location and surface.platform.space_location.name == "wormhole" then 
            surface.platform.space_location = target_space_location
            surface.platform.paused = true 
            
        end
    end 

    game.print("You emerge from the wormhole above an alternate " .. target_planet_name)
end 




