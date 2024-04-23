/// @description Insert description here
// You can write your code in this editor
image_angle = point_direction(x, y, obj_player.x, obj_player.y);

if (!_attacking) {
	_rotation += 1.25;
	x = 960 + radius * dcos(_rotation)
	y = 540 - radius * dsin(_rotation)

	if (_attack_timer > 0) {
	    _attack_timer -= global.game_speed * global.dt;
	} else {
		_attacking = true;
		
		switch(_attack_order[_current_attack]) {
			case "FIREBALL_RING":
				_fireball_ring = true
			    _fireball_timer= 0.5;
				_fireball_ring_repeat = 0;
				_fireball_ring_max_repeat = -1 + 2 * _current_phase;
				break;
			case "LASER_TELEPORT":
				_laser_teleport = true
			    _laser_teleport_timer = 0.5;
				_laser_teleport_repeat = 5 * _current_phase;
				break;
			case "LASER_FAN":
				_laser_fan = true
			    _laser_fan_timer = 0.5;
				_laser_fan_max_repeat = 5 * _current_phase;
				break;
			case "FIREBALL_BURST":
				_fireball_burst = true
			    _fireball_burst_timer= 0.5;
				_fireball_burst_repeat = 0;
				_fireball_burst_max_repeat = 5 * _current_phase;
				break;
		}
			
		if(_current_attack + 1 = array_length(_attack_order)) {
			_current_attack = 0;
		} else {
			_current_attack++;
		}
	}
}


//Fireball Ring
if (_attacking && _fireball_ring) {
	if (_fireball_timer > 0) {
	    _fireball_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_summon_shoot, 0, false);
		
	    for(var _i = 0; _i<= 8; _i++){
			var _fireball = instance_create_depth(x, y, 0, obj_boss_fireball_non_homing);
			_fireball.direction = (_i * 45) + ((22.5 / _current_phase) * _fireball_ring_repeat);
		}

		if (_fireball_ring_repeat < _fireball_ring_max_repeat) {
			_fireball_timer = 0.6 - 0.1 * _current_phase;
			_fireball_ring_repeat++;
		} else {
			_fireball_ring = false;
			_attack_timer = 3;
			_attacking = false;
		}
	}
}

//Laser Teleoprt
if (_attacking && _laser_teleport) {
	if (_laser_teleport_timer > 0) {
	    _laser_teleport_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_click_soft, 0, false);

		_rotation += random_range(0, 360);
		x = 960 + radius * dcos(_rotation)
		y = 540 - radius * dsin(_rotation)
		
		var _laser = instance_create_depth(x, y, 0, obj_boss_laser);
		_laser.direction = point_direction(x, y, obj_player.x, obj_player.y);
		
		if (_laser_teleport_repeat > 0) {
			_laser_teleport_repeat--;
			_laser_teleport_timer = 0.6 - 0.1 * _current_phase;
		} else {
			_attacking = false;
			_attack_timer = 3;
			_laser_teleport = false;
		}
	}
}

//Laser Fan
if (_attacking && _laser_fan) {
	if (_laser_fan_timer > 0) {
	    _laser_fan_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_click_soft, 0, false);
		
		var _angle_modifier = 0;
		switch (_current_phase) {
			case 1:
				_angle_modifier = 15
				break;
			case 2:
				_angle_modifier = 12.5
				break;
			case 3:
				_angle_modifier = 10
				break;
		}
		
		if (_laser_fan_repeat == 0) {
			_laser_fan_angle = point_direction(x, y, obj_player.x, obj_player.y);
			var _laser = instance_create_depth(x, y, 0, obj_boss_laser);
			_laser.direction = _laser_fan_angle;
		} else {
			var _laser1 = instance_create_depth(x, y, 0, obj_boss_laser);
			var _laser2 = instance_create_depth(x, y, 0, obj_boss_laser);
			
			_laser1.direction = _laser_fan_angle + _angle_modifier * _laser_fan_repeat;
			_laser2.direction = _laser_fan_angle - _angle_modifier * _laser_fan_repeat;
		}
		
		
		if (_laser_fan_repeat < _laser_fan_max_repeat) {
			_laser_fan_repeat++;
			_laser_fan_timer = _angle_modifier / 100;
		} else {
			_attacking = false;
			_attack_timer = 3;
			_laser_fan = false;
			_laser_fan_repeat = 0;
		}
	}
}

//Fireball Burst
if (_attacking && _fireball_burst) {
	if (_fireball_burst_timer > 0) {
	    _fireball_burst_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_summon_shoot, 0, false);
		
		var _fireball = instance_create_depth(x, y, 0, obj_boss_fireball_homing);
		_fireball.direction = image_angle + random_range(-5, 5);


		if (_fireball_burst_repeat < _fireball_burst_max_repeat) {
			_fireball_burst_timer = 0.4 - 0.1 * _current_phase;
			_fireball_burst_repeat++;
		} else {
			_fireball_burst = false;
			_attack_timer = 3;
			_attacking = false;
		}
	}
}