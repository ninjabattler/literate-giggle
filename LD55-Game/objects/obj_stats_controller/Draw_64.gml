/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_griffy)
display_set_gui_size(1920, 1080);
draw_set_valign(fa_bottom);

draw_set_halign(fa_left);
draw_set_colour(c_red)
draw_text(0, 1080, $"Health: {_player_health}");

draw_set_halign(fa_right);
draw_set_colour(c_blue)
draw_text(1920, 1080, $"Souls: {_player_souls}");