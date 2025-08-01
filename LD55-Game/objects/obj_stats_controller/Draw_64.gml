/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(1920, 1080);
	
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_set_colour(c_red)
draw_healthbar(0 + _stats_offset, 1025, 427 + _stats_offset, 1080, (_player_health / _player_max_health) * 100, c_black, global.hp_color, global.hp_color, 0, true, false);
draw_sprite(spr_player_stats, 0, 0 + _stats_offset, 1080);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black)
draw_text_transformed(641 + _stats_offset, 1006, _player_souls, 1, 1, 0);
	
if (_victory) {
	draw_set_font(fnt_griffy_title)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_sprite(spr_gui_title, 0, 960, 300);
	
	draw_set_valign(fa_bottom);
	draw_set_colour(global.text_color);
	draw_text_transformed(960, 300, "Victory", 1, 1, 0);
} else if (_player_health <= 0) {
	draw_set_font(fnt_griffy_title)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_sprite(spr_gui_title, 0, 960, 300);
	
	draw_set_valign(fa_bottom);
	draw_set_colour(global.text_color);
	draw_text_transformed(960, 300, "Game Over", 1, 1, 0);
}

draw_set_font(fnt_griffy)