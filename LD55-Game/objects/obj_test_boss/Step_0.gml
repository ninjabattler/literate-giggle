/// @description Insert description here
// You can write your code in this editor
event_inherited();
image_angle = _sprite_rotation;
_shield_rotate += global.game_speed;

//Idle Movement
if (!_attacking && !_targetable) {
	_arm_state = "IDLE";
	_rotation += 1 + 0.25 * _current_phase;
	x = 960 + radius * dcos(_rotation)
	y = 540 - radius * dsin(_rotation)

	if (_attack_timer > 0) {
	    _attack_timer -= global.game_speed * global.dt;
	} else {
		_attacking = true;
		
		switch(_attack_orders[_current_phase - 1][_current_attack]) {
			case "FIREBALL_RING":
				_arm_state = "SPIN";
				_fireball_ring = true
			    _fireball_timer= 0.5;
				_fireball_ring_repeat = 0;
				_fireball_ring_max_repeat = -1 + 2 * _current_phase;
				break;
			case "LASER_TELEPORT":
				_arm_state = "TELEPORT";
				_laser_teleport = true
			    _laser_teleport_timer = 0.5;
				_laser_teleport_repeat = 5 * _current_phase;
				break;
			case "LASER_FAN":
				_arm_state = "PROJECTILE";
				_laser_fan = true
			    _laser_fan_timer = 0.5;
				_laser_fan_max_repeat = 5 * _current_phase;
				break;
			case "FIREBALL_BURST":
				_arm_state = "PROJECTILE";
				_fireball_burst = true
			    _fireball_burst_timer= 0.5;
				_fireball_burst_repeat = 0;
				_fireball_burst_max_repeat = 5 * _current_phase;
				break;
			case "FIREBALL_REFLECTIVE":
				_arm_state = "DEFENSE";
				_fireball_reflective = true;
			    _fireball_reflective_timer= 0.5;
				break;
			case "LASER_SPIN":
				_arm_state = "SPIN";
				_laser_spin = true
			    _laser_spin_timer = 0.025;
				_laser_spin_repeat = 0;
				break;
			case "FIREBALL_SPIN":
				_arm_state = "SPIN";
				_fireball_spin = true
			    _fireball_spin_timer = 0.025;
				_fireball_spin_repeat = 0;
				break;
			case "LASER_TELEPORT_FAN":
				_arm_state = "TELEPORT";
				_laser_teleport_fan = true
			    _laser_teleport_fan_timer = 1;
				_laser_teleport_fan_repeat = 0;
				_laser_teleport_fan_teleports = 5;
				break;
			case "FIREBALL_TELEPORT":
				_arm_state = "TELEPORT";
				_fireball_teleport = true
			    _fireball_teleport_timer = 0.5;
				_fireball_teleport_repeat = 10;
				break;
		}
			
		if(_current_attack + 1 = array_length(_attack_orders[_current_phase - 1])) {
			_current_attack = 0;
		} else {
			_current_attack++;
		}
	}
}

//Vulnerable
if (_targetable) {
	if (_targetable_timer > 0) {
	    _targetable_timer -= global.game_speed * global.dt;
		
		if (_current_phase == 1 && _hp <= (_max_hp / 3) * 2) {
			_current_phase = 2;
			_targetable = false;
			_attack_timer = 3.5 - 0.5 * _current_phase;
			_attacking = false;
		}
		
		if (_current_phase == 2 && _hp <= _max_hp / 3) {
			_current_phase = 3;
			_targetable = false;
			_attack_timer = 3.5 - 0.5 * _current_phase;
			_attacking = false;
		}
		
		_fireball_reflects = _current_phase - 1;
	} else {
		_fireball_reflects = _current_phase - 1;
		_targetable = false;
		_attack_timer = 3.5 - 0.5 * _current_phase;
		_attacking = false;
	}
}

//Arm Rotation Offset
if (!_targetable) {
	_sprite_rotation = point_direction(x, y, obj_player.x, obj_player.y);
	_shield_scale_offset = lerp(_shield_scale_offset, _target_shield_scale_offset, 0.02);
			
	switch (_arm_state) {
		case "IDLE":
			_arm_1_1_rotation_offset = lerp(_arm_1_1_rotation_offset, _target_arm_1_1_rotation_offset, 0.025);
			_arm_1_2_rotation_offset = lerp(_arm_1_2_rotation_offset, _target_arm_1_2_rotation_offset, 0.025);
			_arm_2_1_rotation_offset = lerp(_arm_2_1_rotation_offset, _target_arm_2_1_rotation_offset, 0.025);
			_arm_2_2_rotation_offset = lerp(_arm_2_2_rotation_offset, _target_arm_2_2_rotation_offset, 0.025);
			_arm_3_1_rotation_offset = lerp(_arm_3_1_rotation_offset, _target_arm_3_1_rotation_offset, 0.025);
			_arm_3_2_rotation_offset = lerp(_arm_3_2_rotation_offset, _target_arm_3_2_rotation_offset, 0.025);
			
			_arm_1_1_rotation = lerp(_arm_1_1_rotation, _arm_state_idle[0]._arm_rot_1 + _arm_1_1_rotation_offset, 0.1);
			_arm_1_2_rotation = lerp(_arm_1_2_rotation, _arm_state_idle[0]._arm_rot_2 + _arm_1_2_rotation_offset, 0.1);
			_arm_2_1_rotation = lerp(_arm_2_1_rotation, _arm_state_idle[1]._arm_rot_1 + _arm_2_1_rotation_offset, 0.1);
			_arm_2_2_rotation = lerp(_arm_2_2_rotation, _arm_state_idle[1]._arm_rot_2 + _arm_2_2_rotation_offset, 0.1);
			_arm_3_1_rotation = lerp(_arm_3_1_rotation, _arm_state_idle[2]._arm_rot_1 + _arm_3_1_rotation_offset, 0.1);
			_arm_3_2_rotation = lerp(_arm_3_2_rotation, _arm_state_idle[2]._arm_rot_2 + _arm_3_2_rotation_offset, 0.1);
	
			if (_arm_rotation_timer > 0) {
			    _arm_rotation_timer -= global.game_speed * global.dt;
			} else {
				_target_arm_1_1_rotation_offset = -_target_arm_1_1_rotation_offset;
				_target_arm_1_2_rotation_offset = -_target_arm_1_2_rotation_offset;
				_target_arm_2_1_rotation_offset = -_target_arm_2_1_rotation_offset;
				_target_arm_2_2_rotation_offset = -_target_arm_2_2_rotation_offset;
				_target_arm_3_1_rotation_offset = -_target_arm_3_1_rotation_offset;
				_target_arm_3_2_rotation_offset = -_target_arm_3_2_rotation_offset;
				
				_target_shield_scale_offset = -_target_shield_scale_offset;
				_arm_rotation_timer = 0.75
			}
			break;
		case "SPIN":
			_arm_1_1_rotation_offset = _arm_1_1_rotation_offset < 360 ? _arm_1_1_rotation_offset + 3 : 0;
			_arm_1_2_rotation_offset = _arm_1_2_rotation_offset > -360 ? _arm_1_2_rotation_offset - 3 : 0;
			_arm_2_1_rotation_offset = _arm_2_1_rotation_offset < 360 ? _arm_2_1_rotation_offset + 3 : 0;
			_arm_2_2_rotation_offset = _arm_2_2_rotation_offset > -360 ? _arm_2_2_rotation_offset - 3 : 0;
			_arm_3_1_rotation_offset = _arm_3_1_rotation_offset < 360 ? _arm_3_1_rotation_offset + 3 : 0;
			_arm_3_2_rotation_offset = _arm_3_2_rotation_offset > -360 ? _arm_3_2_rotation_offset - 3 : 0;
			
			_arm_1_1_rotation = lerp(_arm_1_1_rotation, _arm_state_spin[0]._arm_rot_1 + _arm_1_1_rotation_offset, 0.1);
			_arm_1_2_rotation = lerp(_arm_1_2_rotation, _arm_state_spin[0]._arm_rot_2 + _arm_1_2_rotation_offset, 0.1);
			_arm_2_1_rotation = lerp(_arm_2_1_rotation, _arm_state_spin[1]._arm_rot_1 + _arm_2_1_rotation_offset, 0.1);
			_arm_2_2_rotation = lerp(_arm_2_2_rotation, _arm_state_spin[1]._arm_rot_2 + _arm_2_2_rotation_offset, 0.1);
			_arm_3_1_rotation = lerp(_arm_3_1_rotation, _arm_state_spin[2]._arm_rot_1 + _arm_3_1_rotation_offset, 0.1);
			_arm_3_2_rotation = lerp(_arm_3_2_rotation, _arm_state_spin[2]._arm_rot_2 + _arm_3_2_rotation_offset, 0.1);
			
			if (_arm_rotation_timer > 0) {
			    _arm_rotation_timer -= global.game_speed * global.dt;
			} else {
				_target_shield_scale_offset = -_target_shield_scale_offset;
				_arm_rotation_timer = 0.75
			}
			break;
			
		case "TELEPORT":
			_arm_1_1_rotation_offset = 0;
			_arm_1_2_rotation_offset = 0;
			_arm_2_1_rotation_offset = 0;
			_arm_2_2_rotation_offset = 0;
			_arm_3_1_rotation_offset = 0;
			_arm_3_2_rotation_offset = 0;
			
			_arm_1_1_rotation = lerp(_arm_1_1_rotation, _arm_state_teleport[0]._arm_rot_1 + _arm_1_1_rotation_offset, 0.025);
			_arm_1_2_rotation = lerp(_arm_1_2_rotation, _arm_state_teleport[0]._arm_rot_2 + _arm_1_2_rotation_offset, 0.025);
			_arm_2_1_rotation = lerp(_arm_2_1_rotation, _arm_state_teleport[1]._arm_rot_1 + _arm_2_1_rotation_offset, 0.025);
			_arm_2_2_rotation = lerp(_arm_2_2_rotation, _arm_state_teleport[1]._arm_rot_2 + _arm_2_2_rotation_offset, 0.025);
			_arm_3_1_rotation = lerp(_arm_3_1_rotation, _arm_state_teleport[2]._arm_rot_1 + _arm_3_1_rotation_offset, 0.025);
			_arm_3_2_rotation = lerp(_arm_3_2_rotation, _arm_state_teleport[2]._arm_rot_2 + _arm_3_2_rotation_offset, 0.025);
	
			if (_arm_rotation_timer > 0) {
			    _arm_rotation_timer -= global.game_speed * global.dt;
			} else {
				_target_arm_1_1_rotation_offset = -_target_arm_1_1_rotation_offset;
				_target_arm_1_2_rotation_offset = -_target_arm_1_2_rotation_offset;
				_target_arm_2_1_rotation_offset = -_target_arm_2_1_rotation_offset;
				_target_arm_2_2_rotation_offset = -_target_arm_2_2_rotation_offset;
				_target_arm_3_1_rotation_offset = -_target_arm_3_1_rotation_offset;
				_target_arm_3_2_rotation_offset = -_target_arm_3_2_rotation_offset;
				
				_target_shield_scale_offset = -_target_shield_scale_offset;
				_arm_rotation_timer = 0.75
			}
			break;
		case "PROJECTILE":
			_arm_1_1_rotation_offset = lerp(_arm_1_1_rotation_offset, _target_arm_1_1_rotation_offset, 0.025);
			_arm_1_2_rotation_offset = lerp(_arm_1_2_rotation_offset, _target_arm_1_2_rotation_offset, 0.025);
			_arm_2_1_rotation_offset = lerp(_arm_2_1_rotation_offset, _target_arm_2_1_rotation_offset, 0.025);
			_arm_2_2_rotation_offset = lerp(_arm_2_2_rotation_offset, _target_arm_2_2_rotation_offset, 0.025);
			_arm_3_1_rotation_offset = lerp(_arm_3_1_rotation_offset, _target_arm_3_1_rotation_offset, 0.025);
			_arm_3_2_rotation_offset = lerp(_arm_3_2_rotation_offset, _target_arm_3_2_rotation_offset, 0.025);
			
			_arm_1_1_rotation = lerp(_arm_1_1_rotation, _arm_state_projectile[0]._arm_rot_1 + _arm_1_1_rotation_offset, 0.1);
			_arm_1_2_rotation = lerp(_arm_1_2_rotation, _arm_state_projectile[0]._arm_rot_2 + _arm_1_2_rotation_offset, 0.1);
			_arm_2_1_rotation = lerp(_arm_2_1_rotation, _arm_state_projectile[1]._arm_rot_1 + _arm_2_1_rotation_offset, 0.1);
			_arm_2_2_rotation = lerp(_arm_2_2_rotation, _arm_state_projectile[1]._arm_rot_2 + _arm_2_2_rotation_offset, 0.1);
			_arm_3_1_rotation = lerp(_arm_3_1_rotation, _arm_state_projectile[2]._arm_rot_1 + _arm_3_1_rotation_offset, 0.1);
			_arm_3_2_rotation = lerp(_arm_3_2_rotation, _arm_state_projectile[2]._arm_rot_2 + _arm_3_2_rotation_offset, 0.1);
	
			if (_arm_rotation_timer > 0) {
			    _arm_rotation_timer -= global.game_speed * global.dt;
			} else {
				_target_arm_1_1_rotation_offset = -_target_arm_1_1_rotation_offset;
				_target_arm_1_2_rotation_offset = -_target_arm_1_2_rotation_offset;
				_target_arm_2_1_rotation_offset = -_target_arm_2_1_rotation_offset;
				_target_arm_2_2_rotation_offset = -_target_arm_2_2_rotation_offset;
				_target_arm_3_1_rotation_offset = -_target_arm_3_1_rotation_offset;
				_target_arm_3_2_rotation_offset = -_target_arm_3_2_rotation_offset;
				
				_target_shield_scale_offset = -_target_shield_scale_offset;
				_arm_rotation_timer = 0.75
			}
			break;
		case "DEFENSE":
			var _state = _arm_state_defense_1;
			
			if (_fireball_reflects == 1) {
				_state = _arm_state_defense_2;
			}
			
			if (_fireball_reflects == 2) {
				_state = _arm_state_defense_3;
			}
			
			_arm_1_1_rotation = lerp(_arm_1_1_rotation, _state[0]._arm_rot_1 + _arm_1_1_rotation_offset, 0.1);
			_arm_1_2_rotation = lerp(_arm_1_2_rotation, _state[0]._arm_rot_2 + _arm_1_2_rotation_offset, 0.1);
			_arm_2_1_rotation = lerp(_arm_2_1_rotation, _state[1]._arm_rot_1 + _arm_2_1_rotation_offset, 0.1);
			_arm_2_2_rotation = lerp(_arm_2_2_rotation, _state[1]._arm_rot_2 + _arm_2_2_rotation_offset, 0.1);
			_arm_3_1_rotation = lerp(_arm_3_1_rotation, _state[2]._arm_rot_1 + _arm_3_1_rotation_offset, 0.1);
			_arm_3_2_rotation = lerp(_arm_3_2_rotation, _state[2]._arm_rot_2 + _arm_3_2_rotation_offset, 0.1);
	
			if (_arm_rotation_timer > 0) {
				_arm_rotation_timer -= global.game_speed * global.dt;
			} else {
				_target_arm_1_1_rotation_offset = -_target_arm_1_1_rotation_offset;
				_target_arm_1_2_rotation_offset = -_target_arm_1_2_rotation_offset;
				_target_arm_2_1_rotation_offset = -_target_arm_2_1_rotation_offset;
				_target_arm_2_2_rotation_offset = -_target_arm_2_2_rotation_offset;
				_target_arm_3_1_rotation_offset = -_target_arm_3_1_rotation_offset;
				_target_arm_3_2_rotation_offset = -_target_arm_3_2_rotation_offset;
				
				_target_shield_scale_offset = -_target_shield_scale_offset;
				_arm_rotation_timer = 0.75
			}
			break;
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
			_attack_timer = 3.5 - 0.5 * _current_phase;
			_attacking = false;
		}
	}
}

//Laser Teleport
if (_attacking && _laser_teleport) {
	if (_laser_teleport_timer > 0) {
	    _laser_teleport_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_click_soft, 0, false);

		_rotation += random_range(0, 360);
		x = 960 + radius * dcos(_rotation);
		y = 540 - radius * dsin(_rotation);
		
		apply_projectile_pose();
		
		var _laser = instance_create_depth(x, y, 0, obj_boss_laser);
		_laser.direction = point_direction(x, y, obj_player.x, obj_player.y);
		
		if (_laser_teleport_repeat > 0) {
			_laser_teleport_repeat--;
			_laser_teleport_timer = 0.6 - 0.1 * _current_phase;
		} else {
			_attacking = false;
			_attack_timer = 3.5 - 0.5 * _current_phase;
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
			_attack_timer = 3.5 - 0.5 * _current_phase;
			_laser_fan = false;
			_laser_fan_repeat = 0;
		}
	}
}

//Laser Spin
if (_attacking && _laser_spin) {
	_rotation += 1 + 0.25 * _current_phase;
	x = 960 + radius * dcos(_rotation)
	y = 540 - radius * dsin(_rotation)
		
	if (_laser_spin_timer > 0) {
	    _laser_spin_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_click_soft, 0, false);
		
		var _laser = instance_create_depth(x, y, 0, obj_boss_laser);
		_laser.direction = _rotation - 180;
		
		if (_laser_spin_repeat < _laser_spin_max_repeat) {
			_laser_spin_repeat++;
			_laser_spin_timer = 0.025;
		} else {
			_attacking = false;
			_attack_timer = 3 - _current_phase;
			_laser_spin = false;
		}
	}
}

//Laser Teleport Fan
if (_attacking && _laser_teleport_fan) {
	if (_laser_teleport_fan_timer > 0) {
	    _laser_teleport_fan_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_click_soft, 0, false);
		
		if (_laser_teleport_fan_repeat == 0) {
			apply_projectile_pose();
			_laser_fan_angle = point_direction(x, y, obj_player.x, obj_player.y);
			var _laser = instance_create_depth(x, y, 0, obj_boss_laser);
			_laser.direction = _laser_fan_angle;
		} else {
			var _laser1 = instance_create_depth(x, y, 0, obj_boss_laser);
			var _laser2 = instance_create_depth(x, y, 0, obj_boss_laser);
			
			_laser1.direction = _laser_fan_angle + 12.5 * _laser_teleport_fan_repeat;
			_laser2.direction = _laser_fan_angle - 12.5 * _laser_teleport_fan_repeat;
		}
		
		if (_laser_teleport_fan_repeat < _laser_teleport_fan_max_repeat) {
			_laser_teleport_fan_repeat++;
			_laser_teleport_fan_timer = 0.025;
		} else if (_laser_teleport_fan_teleports > 0) {
			_laser_teleport_fan_teleports--;
			_laser_teleport_fan_repeat = 0;
			_laser_teleport_fan_timer = 1;

			_rotation += random_range(0, 360);
			x = 960 + radius * dcos(_rotation);
			y = 540 - radius * dsin(_rotation);
		} else {
			_attacking = false;
			_attack_timer = 2;
			_laser_teleport_fan = false;
		}
	}
}

//Fireball Spin
if (_attacking && _fireball_spin) {
	_rotation += 1 + 0.25 * _current_phase;
	x = 960 + radius * dcos(_rotation)
	y = 540 - radius * dsin(_rotation)
		
	if (_fireball_spin_timer > 0) {
	    _fireball_spin_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_summon_shoot, 0, false);
		
		var _fireball = instance_create_depth(x, y, 0, obj_boss_fireball_homing);
		_fireball.direction = image_angle + random_range(-5, 5);
		
		if (_fireball_spin_repeat < _fireball_spin_max_repeat) {
			_fireball_spin_repeat++;
			_fireball_spin_timer = 0.025;
		} else {
			_attacking = false;
			_attack_timer = 3 - _current_phase;
			_fireball_spin = false;
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
			_attack_timer = 3.5 - 0.5 * _current_phase;
			_attacking = false;
		}
	}
}

//Fireball Teleport
if (_attacking && _fireball_teleport) {
	if (_fireball_teleport_timer > 0) {
	    _fireball_teleport_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_summon_shoot, 0, false);

		_rotation += random_range(0, 360);
		x = 960 + radius * dcos(_rotation);
		y = 540 - radius * dsin(_rotation);
		apply_projectile_pose();
		
	    for(var _i = 0; _i<= 4; _i++){
			var _laser = instance_create_depth(x, y, 0, obj_boss_laser);
			_laser.direction = _i * 90;
			
			if (_current_phase == 3) {
				var _fireball = instance_create_depth(x, y, 0, obj_boss_fireball_non_homing);
				_fireball.direction = _i * 90;
			}
		}
		
		if (_fireball_teleport_repeat > 0) {
			_fireball_teleport_repeat--;
			_fireball_teleport_timer = 0.6 - 0.1 * _current_phase;
		} else {
			_attacking = false;
			_attack_timer = 3.5 - 0.5 * _current_phase;
			_fireball_teleport = false;
		}
	}
}

//Fireball Reflective
if (_attacking && _fireball_reflective) {
	if (_fireball_reflective_timer > 0) {
	    _fireball_reflective_timer -= global.game_speed * global.dt;
	} else {
		audio_play_sound(snd_summon_shoot, 0, false);
		instance_create_depth(x, y, 0, obj_boss_fireball);
		_fireball_reflective = false;
	}
}