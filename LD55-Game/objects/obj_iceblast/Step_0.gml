/// @description Insert description here
// You can write your code in this editor

image_angle = direction;
part_system_position(_particle_system, x, y);
part_system_angle(_particle_system, direction + 90);

if(instance_exists(target)) {
	move_towards_point(target.x, target.y, _speed);
} else {
	speed = 10;
}