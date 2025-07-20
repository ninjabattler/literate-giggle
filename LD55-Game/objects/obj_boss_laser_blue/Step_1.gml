/// @description Insert description here
// You can write your code in this editor

if (_laser_timer > 0) {
	part_system_angle(_particle_system, direction);
	part_system_position(_particle_system, x, y);
	_laser_timer -= global.game_speed * global.dt;
	
	image_angle = direction;
	part_system_position(_particle_system, x, y);
	move_towards_point(x + 32 * dcos(direction), y - 32 * dsin(direction), 20)
} else {
	if (!_sound_played) {
		audio_play_sound(snd_boss_1_laser, 0, false);
		_particle_system2 = part_system_create(prt_boss_laser_blue);
		part_system_position(_particle_system2, x, y);
		part_system_angle(_particle_system2, direction);
		part_system_destroy(_particle_system);
		_sound_played = true;
	} else {
		part_system_angle(_particle_system2, direction);
		part_system_position(_particle_system2, x, y);
	}
	
	if (!_player_damaged && collision_line(x, y, x + 1920 * dcos(direction), y - 1920 * dsin(direction), obj_player, true, true)) {
		obj_stats_controller._player_health -= 2;
		audio_play_sound(snd_enemy_hurt, 0, false);
		_player_damaged = true;
	}
}