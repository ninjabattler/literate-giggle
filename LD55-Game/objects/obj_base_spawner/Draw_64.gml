/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_griffy)
display_set_gui_size(1920, 1080);
draw_set_valign(fa_top);

draw_set_halign(fa_center);
draw_set_colour(c_orange)
draw_text(960, 0, $"Wave: {_current_wave}/{array_length(_waves)}");