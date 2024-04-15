/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_griffy)
display_set_gui_size(1920, 1080);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_sprite(spr_wave_counter, 0, 0, -1);
draw_set_colour(global.text_color);
draw_text(5, 5, $"Wave: {_current_wave}/{array_length(_waves)}");


draw_sprite(spr_wave_cooldown, 0, 1670, -150 + _cooldown_drop);
draw_set_halign(fa_center);
draw_text(1670, 75 + _cooldown_drop, $"{_countdown} Seconds til Next Wave");
draw_text(1670, 180 + _cooldown_drop, "Press [TAB] to Skip");

if(_wave_on_cooldown && _cooldown_drop < 0) {
	_cooldown_drop += 8;
}

if(!_wave_on_cooldown && _cooldown_drop > -300) {
	_cooldown_drop -= 8;
}