/// @description Insert description here
// You can write your code in this editor

part_system_position(_part_sys, x, y);

var _mouse_distance = point_distance(obj_player.x, obj_player.y ,mouse_x, mouse_y);
var _mouse_dir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
var _projection_dist = 50;

_current_dir_offset = lerp(_current_dir_offset, _target_dir_offset, 0.2);
_mouse_dir += _current_dir_offset;
	
var _x_offset = lengthdir_x(_projection_dist, _mouse_dir);
var _y_offset = lengthdir_y(_projection_dist, _mouse_dir);

x = obj_player.x + _x_offset;
y = obj_player.y + _y_offset;