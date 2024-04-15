/// @description Insert description here
// You can write your code in this editor

image_angle = direction;

if(instance_exists(target)) {
	move_towards_point(target.x, target.y, _speed);
} else {
	speed = 10;
}