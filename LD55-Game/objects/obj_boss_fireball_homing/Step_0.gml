/// @description Insert description here
// You can write your code in this editor

_target_rotation = direction;
image_angle = direction;
//part_system_position(_particle_system, x, y);
part_system_position(_particle_system2, x, y);
part_system_angle(_particle_system2, direction - 90);

x = x + lengthdir_x((_current_speed * global.game_speed) - (_rotation_speed * 2), direction);
y = y + lengthdir_y((_current_speed * global.game_speed) - (_rotation_speed * 2), direction);

_rotation_speed = lerp(_rotation_speed, _max_rotation_speed, 0.025);

if (_speed_up = false) {
	if ((point_direction(x, y, obj_player.x, obj_player.y) - direction) < 5 && (point_direction(x, y, obj_player.x, obj_player.y) - direction) > -5) {
		_speed_up = true;
		direction = point_direction(x, y, obj_player.x, obj_player.y)
	} else {
		direction += _rotation_speed;
	}
} else {
	_current_speed = lerp(_current_speed, _max_speed, 0.015);
}

array_shift(_curve_points_x);
array_shift(_curve_points_y);

array_push(_curve_points_x, self.x);
array_push(_curve_points_y, self.y);
