/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	
draw_set_colour(global.text_color);
draw_text_transformed(x, y + 250, "Enemies with Blue Magic", 2, 2, 0);
draw_text_transformed(x, y + 355, "Will Slow You and Your Projectiles!", 1.5, 1.5, 0);