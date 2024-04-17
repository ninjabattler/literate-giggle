/// @description Insert description here
// You can write your code in this editor

_target_rotation = direction;
image_angle = direction;
part_system_position(_particle_system, x, y);
part_system_angle(_particle_system, direction + 90);

if (_rotation < _target_rotation) {
	_rotation++;	
} else if (_rotation > _target_rotation) {
	_rotation--;
}

if (_target_boss) {
	if (instance_number(obj_test_boss) > 0 ) {
		move_towards_point( obj_test_boss.x, obj_test_boss.y, 10);
	} else {
		instance_destroy()
	}
} else {
	move_towards_point( obj_player.x, obj_player.y, 10);
}