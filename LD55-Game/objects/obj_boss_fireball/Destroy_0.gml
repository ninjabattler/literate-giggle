/// @description Insert description here
// You can write your code in this editor
if (_game_slow_speed) {
	global.game_speed = 1;
}

obj_test_boss._attacking = false;

// part_system_destroy(_particle_system);
part_system_destroy(_particle_system2);