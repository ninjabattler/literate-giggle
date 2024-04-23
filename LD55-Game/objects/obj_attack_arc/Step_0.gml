/// @description Insert description here
// You can write your code in this editor

if (global.gamepad_active && gamepad_button_check_pressed(0, gp_shoulderrb)) {
	if (_can_switch) {
		if (_side == "LEFT") {
			_side = "RIGHT";	
			_can_switch = false;
			_target_dir_offset = 45;
			alarm_set(0, 20);
		} else {
			_side = "LEFT";	
			_can_switch = false;
			_target_dir_offset = -45;
			alarm_set(0, 20);
		}
	}
}

//var _mouse_distance = point_distance(obj_player.x, obj_player.y ,mouse_x, mouse_y);\
var _mouse_dir = 0;
if (global.gamepad_active) {
	if(abs(gamepad_axis_value(0, gp_axisrh)) > 0.4 || abs(gamepad_axis_value(0, gp_axisrv)) > 0.4) {
		_mouse_dir = point_direction(0, 0, gamepad_axis_value(0, gp_axisrh), gamepad_axis_value(0, gp_axisrv));
	}
} else {
	_mouse_dir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
}
var _projection_dist = 50;

_current_dir_offset = lerp(_current_dir_offset, _target_dir_offset, 0.2);
_mouse_dir += _current_dir_offset;
	
var _x_offset = lengthdir_x(_projection_dist, _mouse_dir);
var _y_offset = lengthdir_y(_projection_dist, _mouse_dir);

x = obj_player.x + _x_offset;
y = obj_player.y + _y_offset;

var _x2 = x;
var _y2 = y;
var _x3 = x;
var _y3 = y;

if (_side == "LEFT") {
	_x2 = obj_player.x + lengthdir_x(_projection_dist, _mouse_dir-4);
	_y2 = obj_player.y + lengthdir_y(_projection_dist, _mouse_dir-4);
	_x3 = obj_player.x + lengthdir_x(_projection_dist, _mouse_dir-8);
	_y3 = obj_player.y + lengthdir_y(_projection_dist, _mouse_dir-8);
} else {
	_x2 = obj_player.x + lengthdir_x(_projection_dist, _mouse_dir+4);
	_y2 = obj_player.y + lengthdir_y(_projection_dist, _mouse_dir+4);
	_x3 = obj_player.x + lengthdir_x(_projection_dist, _mouse_dir+8);
	_y3 = obj_player.y + lengthdir_y(_projection_dist, _mouse_dir+8);
}

if (!_can_switch) {
	instance_create_depth(x, y, -1, obj_slash_particle);
	instance_create_depth(_x2, _y2, -1, obj_slash_particle);
	instance_create_depth(_x3, _y3, -1, obj_slash_particle);
}
