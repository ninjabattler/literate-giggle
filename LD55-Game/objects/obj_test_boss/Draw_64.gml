/// @description Insert description here
// You can write your code in this editor

draw_set_valign(fa_top);
draw_set_halign(fa_right);

draw_healthbar(room_width - 610 + _stats_offset, 0, room_width + _stats_offset, 45, (_hp / _max_hp) * 100, c_black, global.hp_color, global.hp_color, 1, true, true)
// draw_line_color(room_width - 33, room_height / 3, room_width, room_height / 3, c_black, c_black);
// draw_line_color(room_width - 33, (room_height / 3) * 2, room_width, (room_height / 3) * 2, c_black, c_black);

draw_sprite(spr_gui_boss_healthbar, 0, room_width + _stats_offset, 0)

draw_set_color(global.text_color);
draw_set_font(fnt_boss_name)
draw_text_transformed(room_width - 8 + _stats_offset, 93, "Bound Minor Lich", 1, 1, 0);