/// @description Insert description here
// You can write your code in this editor

_target_rotation = direction;
image_angle = direction;
part_system_position(_particle_system, x, y);
part_system_position(_particle_system2, x, y);
part_system_angle(_particle_system2, direction + 90);

x = x + lengthdir_x(_current_speed * global.game_speed, direction);
y = y + lengthdir_y(_current_speed * global.game_speed, direction);

if (point_direction(x, y, obj_player.x, obj_player.y) > direction) {
	direction += 0.3;	
} else if (point_direction(x, y, obj_player.x, obj_player.y) < direction) {
	direction -= 0.3;	
}

_current_speed = lerp(_current_speed, _max_speed, 0.0025);