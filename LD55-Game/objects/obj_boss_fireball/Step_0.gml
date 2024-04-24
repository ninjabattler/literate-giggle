/// @description Insert description here
// You can write your code in this editor

_target_rotation = direction;
image_angle = direction;
part_system_position(_particle_system, x, y);
part_system_position(_particle_system2, x, y);
part_system_angle(_particle_system2, direction + 90);

if (_target_boss) {
	if (instance_number(obj_test_boss) > 0 ) {
		move_towards_point( obj_test_boss.x, obj_test_boss.y, 10 * global.game_speed);
	} else {
		instance_destroy()
	}
} else {
	move_towards_point( obj_player.x, obj_player.y, 10 * global.game_speed);
}

// Time Slow Effect
if (_game_speed_reset_timer > 0) {
	_game_speed_reset_timer -= global.dt;
	
} else if (_game_slow_speed) {
	global.game_speed = 1;
	_game_slow_speed = false;
}