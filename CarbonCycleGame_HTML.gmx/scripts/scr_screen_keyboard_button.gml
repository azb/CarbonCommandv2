mouse_pos_x = round(mouse_x / abc_button_width)
mouse_pos_y = round((mouse_y - screen_keyboard_vert_buffer_top)/ abc_button_height)

if mouse_check_button_released(mb_left)
{
    if mouse_pos_x > 0 and mouse_pos_x <= 10
    {
        if mouse_pos_y > 0 and mouse_pos_y <= 4
        {
            if string_length(key_pressed[mouse_pos_x,mouse_pos_y]) < 2
            {
                new_name[new_name_iterator] = key_pressed[mouse_pos_x,mouse_pos_y]
                new_name_iterator++
                debug_text = key_pressed[mouse_pos_x,mouse_pos_y]
            }
            else if mouse_pos_x == 8 and mouse_pos_y == 4
            {
                new_name[new_name_iterator] = ' '
                new_name_iterator++
                debug_text = key_pressed[mouse_pos_x,mouse_pos_y]
            }
            else if mouse_pos_x == 9 and mouse_pos_y == 4
            {
                if new_name_iterator > 0
                    new_name_iterator--
                new_name[new_name_iterator] = ''
                debug_text = key_pressed[mouse_pos_x,mouse_pos_y]
            }
            else if mouse_pos_x == 10 and mouse_pos_y == 4
            {
                //test_score++
                //player_score = test_score
                player_score = global.high_score
                final_name = new_name[0] + new_name[1] + new_name[2] + new_name[3] + new_name[4] + new_name[5]
                highscore_add(final_name,player_score)
                is_enter_name = 0
                debug_text = key_pressed[mouse_pos_x,mouse_pos_y]
            }
        }
    }
}

