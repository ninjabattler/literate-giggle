/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_griffy)
display_set_gui_size(1920, 1080);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

if (!instance_exists(obj_test_boss)) {
	draw_sprite(spr_wave_counter, 0, 0, -1);

	draw_set_colour(global.text_color);
	draw_text_transformed(5, 5, $"Wave: {_current_wave}/{array_length(_waves)}", 1, 1, 0);
}

draw_sprite(spr_wave_cooldown, 0, 1670, -150 + _cooldown_current_y);
draw_set_halign(fa_center);
if (_current_wave == 0) {
	draw_text_transformed(1670, 75 + _cooldown_current_y, $"Wave 1 in {_countdown} Seconds", 1, 1, 0);
} else {
	draw_text_transformed(1670, 75 + _cooldown_current_y, $"{_countdown} Seconds til Next Wave", 1, 1, 0);
}
draw_text_transformed(1670, 180 + _cooldown_current_y, "Press [TAB] to Skip", 1, 1, 0);

if(_wave_on_cooldown && _cooldown_drop < 0) {
	//_cooldown_drop += 8;
}

if(!_wave_on_cooldown && _cooldown_drop > -300) {
	//_cooldown_drop -= 8;
}