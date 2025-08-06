/// @description Insert description here
// You can write your code in this editor

if (_show_boss_name) {
	_boss_name_underline = lerp(_boss_name_underline, 1200, 0.0075);

	if (_boss_name_underline < 1550) {
		_boss_name_opacity = lerp(_boss_name_opacity, 1, 0.015)	
	}
} else {
	_boss_name_opacity = lerp(_boss_name_opacity, 0, 0.1)	
}

if (_show_dialogue) {
	if (_dialogue_timer <= 0) {
		if (string_length(_dialogue_text) < string_length(_dialogue[_dialogue_current])) {
			var _char_to_add = string_char_at(_dialogue[_dialogue_current], _dialogue_index)
			
			if (_char_to_add != " ") {
				audio_play_sound(snd_click_soft, 0, false);
			}
			
			_dialogue_text += _char_to_add;
			_dialogue_index += 1;
			_dialogue_timer = 0.0125;
		}
	} else {
		_dialogue_timer -= global.dt;	
	}
}

if (_timer <= 0 && !_cutscene_ended) {
	switch (_step) {
		case 0:
			obj_test_boss._invisible = false;
			audio_play_sound(snd_teleport, 0, false);
			part_system_destroy(_particle_system);
			
			_particle_system2 = part_system_create(prt_boss_spawn_explosion);
			part_system_position(_particle_system2, obj_test_boss.x, obj_test_boss.y);
			
			_show_boss_name = true;
			_step += 1;
			_timer = 2;
			break;
		case 1:
			_show_dialogue = true;
			break;
		case 2:
			audio_play_sound(snd_boss_laugh, 0, false);
			_timer = 3;
			_step += 1;
			_show_dialogue = false;
			break;
		case 3:
			_show_dialogue = true;
			break;
		case 4:
			obj_test_boss._arm_state = "PROJECTILE";
			_show_boss_name = false;
			audio_play_sound(snd_boss_1_growl, 0, false);
			_step += 1;
			_timer = 1.5;
			break;
		case 5:
			obj_test_boss._arm_state = "IDLE";
			obj_test_boss._hide_shield = false;
			audio_play_sound(snd_shield_cast, 0, false);
			_timer = 1.5;
			_step += 1;
			break;
		case 6:
			_cutscene_ended = true;
			part_system_destroy(_particle_system2);
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
			break;
	}
} else if (_cutscene_ended) {
	_screen_width = lerp(_screen_width, _target_screen_width, 0.05);
	_screen_height = lerp(_screen_height, _target_screen_height, 0.05);
	
	if (_border_frame > 0) {
		_border_frame -= 48 * global.dt;	
	}

	_view_x = lerp(_view_x, _target_view_x, 0.15);
	_view_y = lerp(_view_y,_target_view_y, 0.15);
	
	global.music_volume = lerp(global.music_volume, _music_volume_start, 0.25);
	
	var _lookat_x = clamp(_view_x, 0, room_width - _screen_width / 2);
	var _lookat_y = clamp(_view_y, 0, room_height - _screen_height / 2);

	view_camera[0] = camera_create();
	var viewmat = matrix_build_lookat(_lookat_x, _lookat_y, -10, _lookat_x, _lookat_y, 0, 0, 1, 0);
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
	
	var _lookat_x = clamp(_view_x, 0, room_width - _screen_width / 2);
	var _lookat_y = clamp(_view_y, 0, room_height - _screen_height / 2);

	view_camera[0] = camera_create();
	var viewmat = matrix_build_lookat(_lookat_x, _lookat_y, -10, _lookat_x, _lookat_y, 0, 0, 1, 0);
	var projmat = matrix_build_projection_ortho(_screen_width, _screen_height, 1.0, 32000.0);
	camera_set_view_mat(view_camera[0], viewmat);
	camera_set_proj_mat(view_camera[0], projmat);
}