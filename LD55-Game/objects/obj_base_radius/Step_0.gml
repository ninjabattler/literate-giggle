/// @description Insert description here
// You can write your code in this editor
x = _enemy_to_follow.x
y = _enemy_to_follow.y

part_system_position(_particle_system, x, y);

image_angle += global.game_speed;
image_xscale = 1.5;
image_yscale = 1.5;