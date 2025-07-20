/// @description Insert description here
// You can write your code in this editor
if (_game_slow_speed) {
	global.game_speed = 1;
}

if (_particle_system) {
	part_system_destroy(_particle_system);
}

if (_particle_system2) {
	part_system_destroy(_particle_system2);
}