/// @description Insert description here
// You can write your code in this editor
x = _enemy_to_follow.x
y = _enemy_to_follow.y

if (_particles != noone) {
	part_system_position(_particle_system, x, y);
}

image_angle += _rotation_speed * global.game_speed * global.dt;
image_xscale = 1.5;
image_yscale = 1.5;