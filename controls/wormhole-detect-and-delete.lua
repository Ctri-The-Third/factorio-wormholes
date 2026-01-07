
function is_player_at_wormhole()
    local player_count = table_size(get_players_at_wormhole())
    if player_count > 0 then
        return true
    else
        return false
    end
end 

function get_players_at_wormhole()

    local return_value = false 
    local return_players = {} 
    local count_of_found_players = 1
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
                    if player.admin then 
                        return_players[count_of_found_players] = player 
                        
                        count_of_found_players = count_of_found_players + 1 
                    end 
                end
            end 
        elseif planet then
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
      
    end
    
    return return_players
end 


function get_players_not_at_wormhole() 
    local good_players = {} 
    local bad_players = get_players_at_wormhole()

    -- iterate through each player
        --if player name in bad_players, skip em

        -- else, add em to return object

    -- return good_players
end 

function go_into_wormhole()
      
      --any players not on a space platform at the wormhole are killed.
    
    local safe_planet_names = {
        nauvis = "safe",
        vulcanus = "safe", 
        fulgora = "safe",
        gleba = "safe", 
        aquilo = "safe",
        --rubia = "unsafe",
        maraxis = "unsafe"
    }
    return_list = {}
    count = 0 
    local unfamiliar_planets = false 
    local unsupported_planets = false 
    local planet = nil 
    for _, surface in pairs(game.surfaces) do
        planet = surface.planet 
        -- check for planets - if not in list - skip
        if planet and not safe_planet_names[planet.name] then 
            game.print(planet.name .. " not reset by Wormhole mod: Unfamiliar planet", {color = {255,255,100}})
            unfamiliar_planets = true 
        elseif planet and safe_planet_names[planet.name] == "unsafe" then 
            game.print(planet.name .. " not reset by Wormhole mod: Currently unsupported.", {color = {255,175,100}})
            unsupported_planets = true 
        elseif planet and planet.name ~= "nauvis" then 
            return_list[count] = surface.name
            local gen_settings = surface.map_gen_settings
            --game.print(surface.name .. gen_settings.seed)
            count = count + 1 
            --game.print("DEL " .. surface.name)
            game.delete_surface(surface)
        elseif planet and planet.name == "nauvis" then
            local gen_settings = surface.map_gen_settings
            
            gen_settings.seed = math.random(1, 4294967295)
            surface.map_gen_settings = gen_settings

            for chunk in surface.get_chunks() do
                
                surface.delete_chunk({chunk.x, chunk.y})
                
            end 

            for _,force in pairs(game.forces) do
                if force.name == "enemy" then
                    force.reset_evolution()
                end 
                if force.name == "player" then 
                    local map_tags = force.find_chart_tags(surface)
                    --game.print("Found ".. #map_tags .. " tags")
                    for _, tag in pairs(map_tags) do 
                        --game.print(tag)
                        tag.destroy()
                    end 
                end 


                
                
            end 
            
            
        elseif surface.platform then 
            local platform = surface.platform 
            if not platform.hub then 
                --game.print("DEL " .. surface.name)
                game.delete_surface(surface)
            elseif not platform.space_location or  platform.space_location.name ~= "wormhole" then 
                
                return_list[count] = surface.name
                count = count + 1 
                --game.print("DEL " .. platform.name .. "(".. surface.name .. ")")
                game.delete_surface(surface)
            else
                --game.print("KEEP" .. platform.name .. "(".. surface.name .. ")")
                if platform.space_location then 
                    --game.print("  " .. platform.space_location.name) 
                else 
                    --game.print("  eh?")
                end    
            end 
        else 
            --game.print("??? " .. surface.name)
        end
        ::continue::
    end
    if unfamiliar_planets then
        game.print("An unfamiliar planet is one that the mod authors have not tested compatibility with yet.", {color = {255,255,100}})
        game.print("First, check for updates to the Wormholes mod.", {color = {255,255,100}})
        game.print("If there aren't any updates, then you can help by going to https://mods.factorio.com/mod/wormholes-new-game-plus/discussion, and asking for the planet mod's compatibility to be tested", {color = {255,255,100}})
        game.print("Be sure to list what mods you have installed, and which planet was listed above as unfamiliar. Thanks!", {color = {255,255,100}})
    end 
    if unsupported_planets then 
        game.print("An unsupported planet is one that causes the game to crash if we reset it.",  {color = {255,175,100}})
        game.print("If the mod knows it's unsupported, that means the wormhole mod author tried to make the two mods play nice, but hasn't managed it (yet?)",  {color = {255,175,100}})
        game.print("If you want to see if things have changed, you can check the womrhole mod's discussion page here: https://mods.factorio.com/mod/wormholes-new-game-plus/discussion", {color = {255,175,100}})
        game.print("then search for the relevant planet name to see the latest. Thanks!",  {color = {255,175,100}})
    end 

end 