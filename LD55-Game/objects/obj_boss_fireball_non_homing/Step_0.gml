/// @description Insert description here
// You can write your code in this editor

_target_rotation = direction;
image_angle = direction;
part_system_position(_particle_system, x, y);
part_system_position(_particle_system2, x, y);
part_system_angle(_particle_system2, direction - 90);

x = x + lengthdir_x(_speed * global.game_speed, direction);
y = y + lengthdir_y(_speed * global.game_speed, direction);

// Time Slow Effect
if (_game_speed_reset_timer > 0) {
	_game_speed_reset_timer -= global.dt;
	
} else if (_game_slow_speed) {
	global.game_speed = 1;
	_game_slow_speed = false;
}

_speed += 0.1 * global.game_speed