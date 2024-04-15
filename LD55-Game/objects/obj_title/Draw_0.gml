/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fnt_griffy_title);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
	
draw_set_colour(global.text_color);
draw_text_transformed(x, y, "Literate Giggle", 2, 2, 0);

draw_set_font(fnt_griffy)