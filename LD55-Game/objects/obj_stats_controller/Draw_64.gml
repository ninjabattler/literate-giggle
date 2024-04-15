/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_griffy)
display_set_gui_size(1920, 1080);
	
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_green)
draw_text(640, 1010, _player_souls);
	
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_set_colour(c_red)
draw_healthbar(0, 1025, 427, 1080, (_player_health / _player_max_health) * 100, c_black, c_red, c_red, 0, true, false);
draw_sprite(spr_player_stats, 0, 0, 1080);
	
if (_victory) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_sprite(spr_gui_sign, 0, 960, 340);
	
	draw_set_colour(c_yellow);
	draw_text(960, 340, "Victory");
} else if (_player_health <= 0) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_sprite(spr_gui_sign, 0, 960, 340);
	
	draw_set_colour(c_yellow);
	draw_text(960, 340, "Game Over");
}