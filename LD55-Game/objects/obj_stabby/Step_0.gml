/// @description Insert description here
// You can write your code in this editor

x = obj_player.x + lengthdir_x(_offset, _direction);
y = obj_player.y + lengthdir_y(_offset, _direction);

image_angle = obj_player.image_angle;

_offset -= 180 * global.game_speed * global.dt;

if (_destroy_timer > 0) {
	_destroy_timer -= global.game_speed * global.dt;
	
} else {
	instance_destroy();
}