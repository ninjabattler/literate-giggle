/// @description Insert description here

if (!_disabled) {
	
	//Update the position of the occluder to match this instance's position

	
	// Change player direction to point to mouse / joystick
	if (global.gamepad_active) {
		if(abs(gamepad_axis_value(0, gp_axisrh)) > 0.4 || abs(gamepad_axis_value(0, gp_axisrv)) > 0.4) {
			image_angle = point_direction(0, 0, gamepad_axis_value(0, gp_axisrh), gamepad_axis_value(0, gp_axisrv));
		}
	} else {
		image_angle = point_direction(self.x, self.y, mouse_x, mouse_y);
	}
	
	// Do player movement
	if(!global.summon_window_active) {
		self.x += (_momentum_x + lengthdir_x(1, _dash_dir) * _dash_speed_mult) * global.game_speed * global.dt * 60;
		self.y += (_momentum_y + lengthdir_y(1, _dash_dir) * _dash_speed_mult) * global.game_speed * global.dt * 60;
		
		if (_dash_speed_mult > 0.5) {
		    if (current_time mod 1 == 0) { // controls how often afterimages spawn (every other frame)
		        var ghost = instance_create_depth(x, y, obj_player.depth + 1, obj_afterimage);
				ghost.image_index = image_index;
				ghost.image_angle = image_angle;
				ghost.image_xscale = image_xscale;
				ghost.image_yscale = image_yscale;
		    }
		}
	}
	
	var input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	
	if (global.gamepad_active) {
	    input_x = gamepad_axis_value(0, gp_axislh);
	    input_y = gamepad_axis_value(0, gp_axislv);
	}
	
	#region acceleration
	// Normalize input vector for diagonals
	var input_len = point_distance(0, 0, input_x, input_y);
	if (input_len > 1) {
	    input_x /= input_len;
	    input_y /= input_len;
	}

	// Apply acceleration
	_momentum_x += input_x * _accel;
	_momentum_y += input_y * _accel;
	#endregion
	
	// Apply Friction
	if (input_x == 0) _momentum_x *= _friction;
	if (input_y == 0) _momentum_y *= _friction;


	// Clamp diagonal speed to max
	var total_speed = point_distance(0, 0, _momentum_x, _momentum_y);
	if (total_speed > _max_speed) {
	    var scale = _max_speed / total_speed;
	    _momentum_x *= scale;
	    _momentum_y *= scale;
	}

	// Clamp to zero when moving very slowly
	if (abs(_momentum_x) < 0.01) _momentum_x = 0;
	if (abs(_momentum_y) < 0.01) _momentum_y = 0;
	
	//if (_max_speed < _initial_max_speed) {
	//	_max_speed++
	//}
	
	#region Handle dashing
	if (mouse_check_button(2)) {
		_dash_speed_mult = lerp(_dash_speed_mult, 0, 0.05);
	} else {
		_dash_speed_mult = lerp(_dash_speed_mult, 0, 0.1);
	}
	
	if (global.gamepad_active && gamepad_button_check_pressed(0, gp_shoulderlb)) {
		if (_has_dash && _dash_count > 0) {
			_dash_speed_mult = 6;
			_dash_dir = image_angle;
			_dash_count--;
			image_xscale = 1.3;
			image_yscale = 0.7;
			alarm_set(1, 60);
		}
	}
	else if (mouse_check_button_pressed(2)) {
		if (_has_dash && _dash_count > 0) {
			_dash_speed_mult = 6;
			_dash_dir = point_direction(x, y, mouse_x, mouse_y);
			_dash_count--;
			image_xscale = 1.3;
			image_yscale = 0.7;
			alarm_set(1, 60);
		}
	}
	
	// Reset to default
	var target_xscale = 1;
	var target_yscale = 1;

	if (_dash_speed_mult > 2) {
	    var squash_amt = 0.1; // tweakable squish factor
	    var dash_angle = _dash_dir;

	    target_xscale = 1 + squash_amt;
	    target_yscale = 1 - squash_amt;
	}

	// Smooth scaling transition
	image_xscale = lerp(image_xscale, target_xscale, 0.1);
	image_yscale = lerp(image_yscale, target_yscale, 0.1);
	#endregion
	
}
