/// @description Insert description here
// You can write your code in this editor

if (_wave_timeline_complete && instance_number(obj_base_enemy) == 0) {
	_wave_timeline_complete = false;
	alarm_set(1, 300);
}