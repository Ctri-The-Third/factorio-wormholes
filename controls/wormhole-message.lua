local main_frame = {} 

function display_wormhole_message(player)
  local player_screen = player.gui.screen

  if player_screen.wormhole_main_frame then
    --
    return
  end

  main_frame = player_screen.add{type="frame", name="wormhole_main_frame", direction="vertical"}  
  
  main_frame.style.size = {475, 570}
  main_frame.auto_center = true

  -- Titlebar
  local titlebar = main_frame.add{type="flow", name="titlebar", direction="horizontal"}
  titlebar.add{type="label", caption = "Hello, world!", style = "frame_title"}
  local drag_handle = titlebar.add{type="empty-widget", style="draggable_space_header"}
  drag_handle.style.height = 24
  drag_handle.style.horizontally_stretchable = true 
  drag_handle.drag_target = main_frame 
  titlebar.add{type="sprite-button", name="ngp_close_button", sprite="utility/close", style="close_button"}
  
  -- main content
  local content_frame = main_frame.add{type="frame", name="content_frame", direction="horizontal", style="ngp_content_frame"}
  local left_side = content_frame.add{type="sprite", sprite="ngp-victory"}
  left_side.style.size = {300,450}
  left_side.style.stretch_image_to_widget_size=true
  local right_side = content_frame.add{type="flow", direction="vertical"}
  right_side.style.horizontally_stretchable = true 
  local text_label = right_side.add{
    type ="label",
    caption= "Congratultions on reaching the wormhole at the end of the game! \n You (and any other space platforms here) can enter the wormhole to enter a new solar system with all of your progress so far.\n\n You will keep your technology, and any platforms at currently at the wormhole space location \n \nTHIS IS A DESTRUCTIVE ACTION."

  }
  text_label.style.single_line=false
  text_label.style.maximal_width = 250

  

  -- footer
  local footer = main_frame.add{type="flow", name="footer", direction="horizontal", style="dialog_buttons_horizontal_flow"}
  footer.add{type="button", name="ngp_go_back", caption="Go back", style="back_button"}

  local spacer = footer.add{type="empty-widget"}
  spacer.style.horizontally_stretchable = true 

  footer.add{type="button", name="ngp_go_forwards", caption="Enter the wormhole", style="red_confirm_button"}

  -- add "go on" and "go back" buttons

end





