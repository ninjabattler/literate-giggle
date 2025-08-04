/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(1920, 1080);

if (!surface_exists(_soul_counter_surface)) {
	_soul_counter_surface = surface_create(200, 200);
}

draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_set_colour(c_red)
draw_healthbar(0 + _stats_offset, 1025, 427 + _stats_offset, 1080, (_player_health / _player_max_health) * 100, c_black, global.hp_color, global.hp_color, 0, true, false);
draw_sprite(spr_soul_counter, _souls_index, 602 + _stats_offset, 960);
draw_sprite(spr_player_stats, 0, 0 + _stats_offset, 1080);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var tex = surface_get_texture(_soul_counter_surface)
var tex_w = texture_get_texel_width(tex);
var tex_h = texture_get_texel_height(tex);

surface_set_target(_soul_counter_surface);

draw_text_colour(100, 100, _player_souls, #b0e2ff, #b0e2ff, #202a2f, #202a2f, 1);

surface_reset_target();

shader_set(sh_wave_x);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "u_time"), current_time);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "texel_x"), tex_w);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "speed"), 0.005);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "waves"), 100);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "wave_width"), 1);

draw_surface(_soul_counter_surface, 541 + _stats_offset, 906);
surface_free(_soul_counter_surface);

shader_reset();

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