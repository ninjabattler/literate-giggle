/// @description Insert description here
// You can write your code in this editor

if (_timer <= 0 && !_cutscene_ended) {
	_cutscene_ended = true;
	obj_player._disabled = false;
	obj_test_boss._active = true;
	obj_test_boss._target_stats_offset = 0;
	obj_stats_controller._target_stats_offset = 0;
	_target_screen_width = 1920;
	_target_screen_height = 1080;
	
	_target_view_x = _target_screen_width / 2;
	_target_view_y = _target_screen_height / 2;
	
	audio_stop_sound(snd_music_main);
	audio_play_sound(snd_music_boss, 0, true);
} else if (_cutscene_ended) {
	_screen_width = lerp(_screen_width, _target_screen_width, 0.05);
	_screen_height = lerp(_screen_height, _target_screen_height, 0.05);
	
	if (_border_frame > 0) {
		_border_frame -= 48 * global.dt;	
	}

	_view_x = lerp(_view_x, _target_view_x, 0.15);
	_view_y = lerp(_view_y, _target_view_y, 0.15);
	
	global.music_volume = lerp(global.music_volume, _music_volume_start, 0.25);

	view_camera[0] = camera_create();
	var viewmat = matrix_build_lookat(_view_x, _view_y, -10, _view_x, _view_y, 0, 0, 1, 0);
	var projmat = matrix_build_projection_ortho(_screen_width, _screen_height, 1.0, 32000.0);
	camera_set_view_mat(view_camera[0], viewmat);
	camera_set_proj_mat(view_camera[0], projmat);
} else {
	_timer -= 1 * global.dt;
	if (_border_frame < 48) {
		_border_frame += 48 * global.dt;	
	}

	_screen_width = lerp(_screen_width, _target_screen_width, 0.015);
	_screen_height = lerp(_screen_height, _target_screen_height, 0.015);

	_view_x = lerp(_view_x, obj_test_boss.x, 0.04);
	_view_y = lerp(_view_y, obj_test_boss.y, 0.04);

	global.music_volume = lerp(global.music_volume, 0, 0.025);

	view_camera[0] = camera_create();
	var viewmat = matrix_build_lookat(_view_x, _view_y, -10, _view_x, _view_y, 0, 0, 1, 0);
	var projmat = matrix_build_projection_ortho(_screen_width, _screen_height, 1.0, 32000.0);
	camera_set_view_mat(view_camera[0], viewmat);
	camera_set_proj_mat(view_camera[0], projmat);
}