///scr_upgrade_item_message(sprite,subimg)
//scr_upgrade_item_message(sprite_index,upgrade_index + 1)
//1240 90
if room = rm_upgrades
//if obj_control.gameover && obj_control.tab = 3
    {
    //if y < room_height / 2
    //highlight_rot = 180
    //else
    
    message_xpos = 1240
    message_ypos = 90 -20
    
    highlight_rot = 0
    
    if selected
        {
        if upgrade_index < upgrades
            {
            message_a = adjust(message_a , 1)
            }
        }
    else
        {
        message_a = adjust(message_a , 0)
        }
    
       if y < room_height / 2
            yoff = -100 + 100 * message_a + 540
       else    
            yoff = 100 - 100 * message_a
    if upgrade_index < upgrades
        {
        cost = upgrade_index * upgrade_coefficient + upgrade_initial_cost
        if global.cash >= cost bspr = spr_button_upgrade else bspr = spr_button_too_expensive
        //    draw_sprite_ext(spr_message,0,message_xpos,message_ypos,1,1,0,c_white,message_a)
        if argument0 > -1
        draw_sprite_ext(argument0,argument1,1514,message_ypos + 150,1,1,0,c_white,message_a) ///message_xpos + 100 
        
        if selected
        {
        if uicon1 > -1
            {
            draw_sprite(spr_upgrade_icon,0,message_xpos+64,message_ypos+64)
            draw_sprite(spr_upgrade_icon,uicon1,message_xpos+64,message_ypos+64)
            }
        if uicon2 > -1
            {
            draw_sprite(spr_upgrade_icon,0,message_xpos+64,message_ypos+64+78)
            draw_sprite(spr_upgrade_icon,uicon2,message_xpos+64,message_ypos+64 + 78)
            }
        }
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_set_color(c_black)
        draw_set_alpha(message_a)
        draw_set_font(fnt_message)
        scr_paragraph(upgrade[upgrade_index],message_xpos,message_ypos + 200,460,c_black)
        draw_set_alpha(1)
        //draw_text(x-250+10,y-350-150+10,upgrade[upgrade_index])
        
        //if message_a > .1
        //if button(bspr,x-160,y-300+15 + yoff,320,64,"Upgrade ($"+string(cost)+')',-1,0,"")
        if selected && obj_control.upgrade_button_pressed = 1
            {
            //UPGRADE
            if global.cash >= cost
                {
                obj_control.upgrade_button_pressed = 0
                upgrade_index++
                global.cash -= cost
                if global.sound_active
                audio_play_sound(snd_chaching,1,0)
                }
            }
        }
    else
        {
        draw_set_halign(fa_center)
        if selected
        scr_paragraph("This item is fully upgraded.",message_xpos + 280,message_ypos + 200,460,c_black)
        
        }
            
    if mouse_check_button_pressed(1) or mouse_check_button_released(1)
        {
        if point_distance(mouse_x,mouse_y,x,y) < 48
        //if position_meeting(mouse_x,mouse_y,self)
            {
            with obj_selectable
            selected = 0
            selected = 1
            }
        else if !scr_in_mouse_zone()
            {
            selected = 0
            }
        }  
    }
