/// @description Insert description here
// You can write your code in this editor

// Zoom out camera
//if(camera_zoom_out) {
//	camera_width += 16;
//	camera_height += 9;
//	camera_width = clamp(camera_width, 1280, 1920);
//	camera_height = clamp(camera_height, 720, 1080);
	
//	camera_destroy(view_camera[0]);
//	view_camera[0] = camera_create_view(0, 0, camera_width, camera_height, 0, self, -1, -1, 640, 360);
//}

image_angle = point_direction(mouse_x,mouse_y,self.x,self.y);
if(!global.summon_window_active && !_disabled) {
	self.x += _momentum_x;
	self.y += _momentum_y;
}

if (!_disabled) {
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

	// Clamps the speed to maximum speed
	_momentum_x = clamp(_momentum_x, -_max_speed, _max_speed);
	_momentum_y = clamp(_momentum_y, -_max_speed, _max_speed);
	
	if(abs(_momentum_x) < 1) {
		_momentum_x = 0;	
	}
	if(abs(_momentum_y) < 1) {
		_momentum_y = 0;	
	}

	if (_max_speed < _initial_max_speed) {
		_max_speed++
	}
}