/// @description Insert description here
// You can write your code in this editor

if (_wave_timeline_complete && instance_number(obj_base_enemy) == 0) {
	if (_current_wave != array_length(_waves)) {
		_wave_timeline_complete = false;
		alarm_set(1, 300);
	} else {
		obj_stats_controller._victory = true
		obj_player._disabled = true;
	}
}