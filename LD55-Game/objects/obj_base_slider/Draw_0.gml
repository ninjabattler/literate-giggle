/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_sprite(spr_fireball_summon, 0, x + ((_current_percent / _max_percent) * sprite_width), y);

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
	
draw_set_colour(global.text_color);
draw_text_transformed(x, y - 16, _label, 2, 2, 0);

draw_set_halign(fa_right);
draw_text_transformed(x + sprite_width, y - 16, $"{_current_percent}%", 2, 2, 0);