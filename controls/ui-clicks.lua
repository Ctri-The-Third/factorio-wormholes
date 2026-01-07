
script.on_event(defines.events.on_gui_click, function(event)
    ngp_close_button(event)
    ngp_go_forwards(event)
end 
)



function ngp_close_button(event)
    if not event.element.valid then 
        return 
    end 
    if event.element.name == "ngp_close_button" or event.element.name == "ngp_go_back" then 
        
        local player = game.get_player(event.player_index)
        if player.gui.screen.wormhole_main_frame then 
        player.gui.screen.wormhole_main_frame.destroy()
        end 
    end
    
end


function ngp_go_forwards(event)
    if not event.element.valid then 
        return 
    end 
    if event.element.name == "ngp_go_forwards" then 
        
        local player = game.get_player(event.player_index)
        if player.gui.screen.wormhole_main_frame then 
            player.gui.screen.wormhole_main_frame.destroy()
        end 
        
        go_into_wormhole()
        
    end 
end 