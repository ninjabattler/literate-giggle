/// @description Insert description here
// You can write your code in this editor

// Time Slow Effect
if (_particle_update_timer > 0) {
	_particle_update_timer -= global.game_speed * global.dt;
	
} else {
	part_system_update(_particle_system);
	part_system_update(_particle_system2);
	_particle_update_timer = 0.001;
}