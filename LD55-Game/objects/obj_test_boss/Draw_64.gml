/// @description Insert description here
// You can write your code in this editor

draw_healthbar(room_width - 32, 0, room_width, room_height, (_hp / _max_hp) * 100, c_black, global.hp_color, global.hp_color, 3, true, true)
draw_line_color(room_width - 33, room_height / 3, room_width, room_height / 3, c_black, c_black);
draw_line_color(room_width - 33, (room_height / 3) * 2, room_width, (room_height / 3) * 2, c_black, c_black);

draw_set_color(global.text_color);
draw_set_valign(fa_top);
draw_set_halign(fa_right);

draw_text_transformed(room_width - 34, 0, "Novice Lich", 2, 2, 0);