/// @description Insert description here

if (!_disabled) {
	
	// Change player direction
	if (global.gamepad_active) {
		if(abs(gamepad_axis_value(0, gp_axisrh)) > 0.4 || abs(gamepad_axis_value(0, gp_axisrv)) > 0.4) {
			image_angle = point_direction(0, 0, gamepad_axis_value(0, gp_axisrh), gamepad_axis_value(0, gp_axisrv));
		}
	} else {
		image_angle = point_direction(self.x, self.y, mouse_x, mouse_y);
	}
	
	// Do player movement
	if(!global.summon_window_active) {
		self.x += (_momentum_x + lengthdir_x(1, _dash_dir) * _dash_speed_mult) * global.game_speed;
		self.y += (_momentum_y + lengthdir_y(1, _dash_dir) * _dash_speed_mult) * global.game_speed;
	}
	
	var _move_up = keyboard_check(ord("W"));
	var _move_left = keyboard_check(ord("A"));
	var _move_down = keyboard_check(ord("S"));
	var _move_right = keyboard_check(ord("D"));
	
	// Gamepad movement
	if (global.gamepad_active) {

			if (abs(_momentum_x) <= _max_speed){
				_momentum_x+= 1 * gamepad_axis_value(0, gp_axislh);
			}
			
			if (abs(_momentum_y) <= _max_speed){
				_momentum_y+= 1 * gamepad_axis_value(0, gp_axislv);
			}
	}
	
	if (_dash_speed_mult > 0) {
		_dash_speed_mult -= 0.1;
	} else {
		_dash_speed_mult = 0;
	}

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

	if (!_move_left && !_move_right && gamepad_axis_value(0, gp_axislh) == 0) {
		if (abs(_momentum_x) > 0) {
			_momentum_x/=1.5;
		}
	}

	if (!_move_up && !_move_down && gamepad_axis_value(0, gp_axislv) == 0) {
		if (abs(_momentum_y) > 0) {
			_momentum_y/=1.5;
		}
	}

	// Clamps the speed to maximum speed
	_momentum_x = clamp(_momentum_x, -_max_speed, _max_speed);
	_momentum_y = clamp(_momentum_y, -_max_speed, _max_speed);
	
	if(abs(_momentum_x) < 0.1) {
		_momentum_x = 0;	
	}
	if(abs(_momentum_y) < 0.1) {
		_momentum_y = 0;	
	}

	if (_max_speed < _initial_max_speed) {
		_max_speed++
	}
	
	if (global.gamepad_active && gamepad_button_check_pressed(0, gp_shoulderlb)) {
		if (_has_dash && _dash_count > 0) {
			_dash_speed_mult = 5;
			_dash_dir = image_angle;
			_dash_count--;
			alarm_set(1, 60);
		}
	}
	else if (mouse_check_button_pressed(2)) {
		if (_has_dash && _dash_count > 0) {
			_dash_speed_mult = 5;
			_dash_dir = point_direction(x, y, mouse_x, mouse_y);
			_dash_count--;
			alarm_set(1, 60);
		}
	}
}
