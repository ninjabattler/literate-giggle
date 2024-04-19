/// @description Insert description here
// You can write your code in this editor
image_angle = direction;
part_system_position(_particle_system, x, y);

if(instance_exists(target)) {
	move_towards_point(target.x, target.y, _speed * global.game_speed);
} else {
	speed = 10;
}