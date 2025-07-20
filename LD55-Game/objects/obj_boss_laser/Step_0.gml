/// @description Insert description here
// You can write your code in this editor
part_system_angle(_particle_system, direction - 90);

// Time Slow Effect
if (_laser_timer > 0) {
	_laser_timer -= global.game_speed * global.dt;
	
	image_angle = direction;
	part_system_position(_particle_system, x, y);
	move_towards_point(x + 32 * dcos(direction), y - 32 * dsin(direction), _laser_movement_speed)
} else {
	if (!_sound_played) {
		if (!_silent) {
			audio_play_sound(snd_boss_1_laser, 0, false);
		}
		
		_particle_system2 = part_system_create(prt_boss_laser_burst);
		part_system_position(_particle_system2, x, y);
		part_system_angle(_particle_system2, direction);
		_sound_played = true;
	}
	
	if (!_player_damaged && collision_line(x, y, x + 1920 * dcos(direction), y - 1920 * dsin(direction), obj_player, true, true)) {
		obj_stats_controller._player_health -= 2;
		audio_play_sound(snd_enemy_hurt, 0, false);
		_player_damaged = true;
	}
	
	if (_current_laser_width < _target_laser_width) {
		_current_laser_width += 40 * global.game_speed * global.dt;
	} else {
		instance_destroy();	
	}
}