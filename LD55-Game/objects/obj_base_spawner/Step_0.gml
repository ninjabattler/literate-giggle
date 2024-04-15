/// @description Insert description here
// You can write your code in this editor

if (_wave_timeline_complete && instance_number(obj_base_enemy) == 0 && !_wave_on_cooldown) {
	if (_current_wave != array_length(_waves)) {
		_wave_timeline_complete = false;
		_wave_on_cooldown = true;
		_countdown = 30;
		
		alarm_set(1, 60);
	} else if (obj_stats_controller._victory) {
		obj_stats_controller._victory = true
		obj_player._disabled = true;
		
		if (room != room_last) {
			instance_create_depth(960, 540, -100, obj_next_button);
		} else {
			instance_create_depth(960, 540, -100, obj_return_title_button);
		}
		instance_create_depth(960, 740, -100, obj_exit_button);
	}
}

if(_cooldown_current_y < 0 && _wave_on_cooldown) {
	_cooldown_current_y = lerp(_cooldown_current_y, 0, 0.15);
} else if(_cooldown_current_y > _cooldown_drop && !_wave_on_cooldown) {
	_cooldown_current_y = lerp(_cooldown_current_y, _cooldown_drop, 0.1);	
}