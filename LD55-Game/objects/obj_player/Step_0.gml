/// @description Insert description here
// You can write your code in this editor

image_angle=point_direction(mouse_x,mouse_y,self.x,self.y);
self.x += _momentum_x;
self.y += _momentum_y;

var _move_up = keyboard_check(ord("W"));
var _move_left = keyboard_check(ord("A"));
var _move_down = keyboard_check(ord("S"));
var _move_right = keyboard_check(ord("D"));

if (_move_left) {
	if (_momentum_x > -_max_speed){
		_momentum_x--;
	}
}

if (_move_right) {
	if (_momentum_x < _max_speed){
		_momentum_x++;
	}
}

if (_move_up) {
	if (_momentum_y > -_max_speed){
		_momentum_y--;
	}
}

if (_move_down) {
	if (_momentum_y < _max_speed){
		_momentum_y++;
	}
}

if (!_move_left && !_move_right) {
	if (_momentum_x < 0) {
		_momentum_x++
	} else if (_momentum_x > 0) {
		_momentum_x--	
	}
}


if (!_move_up && !_move_down) {
	if (_momentum_y < 0) {
		_momentum_y++
	} else if (_momentum_y > 0) {
		_momentum_y--	
	}
}