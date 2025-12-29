local main_frame = {} 

commands.add_command("wormhole2","display a test message", function(event)
  local player = game.get_player(event.player_index)
  local player_screen = player.gui.screen

  if player_screen.wormhole_main_frame then
    return
  end

  main_frame = player_screen.add{type="frame",name="wormhole_main_frame", caption="Hello, world!"}  
  main_frame.style.size = {385,165}
  main_frame.auto_center = true

  local content_frame = main_frame.add{type="frame", name="content_frame", direction="vertical", style="ngp_content_frame"}
  local controls_flow = content_frame.add{type="flow", name="controls_flow", direction="horizontal", style ="ngp_controls_flow"}

  controls_flow.add{type="button", name="ngp_controls_toggle", caption="Deactivate"}
end
)

script.on_event(defines.events.on_gui_click, function(event)

  if event.element.name == "ngp_controls_toggle" then
    local player_storage = storage.players[event.player_index]
    player_storage.controls_active = not player_storage.controls_active
    
    local control_toggle = event.element
    control_toggle.caption = (player_storage.controls_active) and "Deactivate" or "Acti"
  end

end )


script.on_init(function()
  storage.players={}
end)


script.on_event(defines.events.on_player_created, function(event)
  storage.players[event.player_index] = {controls_active = true}
end )