if room = rm_upgrades
//if obj_control.gameover && obj_control.tab = 3
    {
    //if y < room_height / 2
    //highlight_rot = 180
    //else
    //highlight_rot = 0
    
    draw_sprite_ext(spr_upgrade_ring,0,x,y,1,1,0,c_white,obj_control.flash_a)
    //if position_meeting(mouse_x,mouse_y,self) 
    //draw_circle(x,y,48,1)
    if point_distance(mouse_x,mouse_y,x,y) < 48
        {
        draw_sprite_ext(spr_select_highlight,0,x,y,1,.7,0,c_white,.2)
        }
    if selected
        {
        draw_sprite_ext(spr_select_highlight,0,x,y,1,.7,0,c_white,.4)
        effect_create_above(ef_spark,x + random(64)-32 , y + random(128)-128 , 1 , c_white)
        }
    
    }
